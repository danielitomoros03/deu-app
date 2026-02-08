// Utility to fetch and render rich HTML from Rails ActionText endpoints
// Usage: import { renderRichText } from '../utils/richTextRenderer'
// renderRichText({ el: someDomElement, pageId: 12, initialHtml: htmlString, sanitize: false })

export async function fetchLargeDescriptionRaw(pageId) {
  if (!pageId) return '';
  try {
    const url = `/api/v1/pages/${pageId}/large_description_raw`;
    const res = await fetch(url, { credentials: 'same-origin' });
    if (!res.ok) {
      console.warn('Failed to fetch large_description_raw, status', res.status, 'for', url);
      return '';
    }
    const text = await res.text();
    return text || '';
  } catch (e) {
    // eslint-disable-next-line no-console
    console.error('Error fetching large_description_raw for page', pageId, e);
    return '';
  }
}

export function cleanActionTextHtml(html) {
  if (!html || typeof html !== 'string') return '';

  try {
    const parser = new DOMParser();
    const doc = parser.parseFromString(html, 'text/html');

    // If the content is wrapped in a single div.trix-content, unwrap it
    const trixContent = doc.querySelector('div.trix-content');
    if (trixContent && doc.body.children.length === 1) {
      return trixContent.innerHTML.trim();
    }

    // If there's a single wrapping div, try to unwrap it
    if (doc.body.children.length === 1 && doc.body.firstElementChild.tagName === 'DIV') {
      const wrapper = doc.body.firstElementChild;
      // Only unwrap if it doesn't have meaningful classes or attributes (except trix-content)
      if (!wrapper.className || wrapper.className === 'trix-content') {
        return wrapper.innerHTML.trim();
      }
    }

    return doc.body.innerHTML.trim();
  } catch (e) {
    console.warn('Failed to clean ActionText HTML', e);
    return html;
  }
}

export function fixRelativeUrlsAndClean(html, origin = window.location.origin, pathname = window.location.pathname) {
  if (!html) return '';
  try {
    const parser = new DOMParser();
    const doc = parser.parseFromString(html, 'text/html');

    // Remove potentially harmful script tags
    doc.querySelectorAll('script').forEach(s => s.remove());

    // Fix src/href attributes
    const attrs = ['src', 'href'];
    attrs.forEach(attr => {
      doc.querySelectorAll('[' + attr + ']').forEach(node => {
        const val = node.getAttribute(attr);
        if (!val) return;
        if (/^(https?:|data:|blob:|mailto:)/i.test(val)) return; // absolute / safe
        if (val.startsWith('//')) {
          node.setAttribute(attr, window.location.protocol + val);
          return;
        }
        if (val.startsWith('/')) {
          node.setAttribute(attr, origin + val);
          return;
        }
        // relative: build based on current path
        const base = origin + pathname.replace(/\/[^/]*$/, '/');
        node.setAttribute(attr, base + val);
      });
    });

    return doc.body.innerHTML;
  } catch (e) {
    console.warn('Failed to parse/fix HTML, returning original', e);
    return html;
  }
}

// Optional sanitizer placeholder - if you want sanitization, integrate DOMPurify here
export function sanitizeHtml(html) {
  // If DOMPurify is available globally, use it
  if (typeof DOMPurify !== 'undefined' && DOMPurify.sanitize) {
    try {
      return DOMPurify.sanitize(html);
    } catch (e) {
      console.warn('DOMPurify sanitize failed, falling back to raw html', e);
      return html;
    }
  }
  // No sanitizer available - return input as-is
  return html;
}

// Main entry: render rich HTML into provided element
// options: { el: DOMElement, pageId: number, initialHtml: string, sanitize: boolean }
export async function renderRichText({ el, pageId, initialHtml = '', sanitize = false }) {
  if (!el) throw new Error('renderRichText requires a DOM element `el`');

  // Apply initial HTML immediately so UI shows something while fetching
  if (initialHtml) {
    try {
      const cleaned = cleanActionTextHtml(initialHtml);
      const fixed = fixRelativeUrlsAndClean(cleaned);
      el.innerHTML = sanitize ? sanitizeHtml(fixed) : fixed;
    } catch (e) {
      el.innerHTML = initialHtml;
    }
  }

  // Then try to fetch the raw HTML from server
  if (pageId) {
    const raw = await fetchLargeDescriptionRaw(pageId);
    if (raw && raw.trim()) {
      const cleaned = cleanActionTextHtml(raw);
      const fixed = fixRelativeUrlsAndClean(cleaned);
      el.innerHTML = sanitize ? sanitizeHtml(fixed) : fixed;
      return el.innerHTML;
    }
  }

  return el.innerHTML || '';
}
