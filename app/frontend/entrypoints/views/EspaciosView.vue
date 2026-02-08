<template>
  <div style="min-height: 100vh; width: 100%">
    <section class="sub-header">
      <h1>Espacios Universitarios</h1>
    </section>
    <AppNavbar />
    <section class="link-section">
      <nav class="breadcrumbs">
        <ul>
          <li>
            <router-link to="/"><span>🚀</span></router-link>
          </li>
          <li>
            <router-link to="/espacios-universitarios"
              >Espacios Universitarios</router-link
            >
          </li>
        </ul>
      </nav>
    </section>
    <section class="section-container">
      <div class="mision-vision">
        <h1 class="titulo">
          {{ mainTitle }}
        </h1>
        <div class="content-container">
          <div class="paragraphs">
            <template v-if="introParagraphs.length">
              <p v-for="(p, idx) in introParagraphs" :key="idx">{{ p }}</p>
            </template>
            <div ref="richText" class="rich-text"></div>
          </div>
        </div>
      </div>
    </section>


<div class="event-calendar-container">
  <div class="calendar-header">
    <h2 class="calendar-title">Calendario de Eventos</h2>
    <div class="calendar-controls">
      <button @click="previousMonth" class="control-btn">←</button>
      <span class="current-month">{{ currentMonthName }} {{ currentYear }}</span>
      <button @click="nextMonth" class="control-btn">→</button>
    </div>
  </div>

  <div class="calendar-grid">
    <div class="calendar-weekdays">
      <div class="weekday" v-for="day in ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb']" :key="day">
        {{ day }}
      </div>
    </div>

    <div class="calendar-days">
      <div 
        v-for="day in calendarDays" 
        :key="day.date"
        :class="[
          'calendar-day',
          { 
            'current-month': day.isCurrentMonth,
            'today': day.isToday,
            'has-events': day.events.length > 0
          }
        ]"
        @click="selectDay(day)"
      >
        <div class="day-number">{{ day.number }}</div>
        <div class="day-events">
          <div 
            v-for="event in day.events" 
            :key="event.id"
            class="event-indicator"
            :style="{ backgroundColor: getEventColor(event) }"
            :title="event.name"
          >
            {{ event.name.substring(0, 3) }}
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
    <!-- Modal de evento -->
    <div v-if="selectedDay && selectedDay.events.length > 0" class="event-modal-overlay" @click.self="closeModal">
      <div class="event-modal">
        <button class="close-modal" @click="closeModal">×</button>
        
        <h3 class="modal-date">{{ formatDate(selectedDay.date) }}</h3>
        
        <div v-for="event in selectedDay.events" :key="event.id" class="event-card">
          <div class="event-image-container">
            <img 
              :src="getImageUrl(event.imagePath)" 
              :alt="event.name"
              class="event-image"
              @error="handleImageError"
            />
          </div>
          
          <div class="event-details">
            <h4 class="event-name">{{ event.name }}</h4>
            
            <div class="event-info">
              <div class="info-item">
                <span class="info-icon">🕒</span>
                <span>{{ formatTime(event.eventFrom) }} - {{ formatTime(event.eventTo) }}</span>
              </div>
              
              <div class="info-item">
                <span class="info-icon">📍</span>
                <span>{{ event.room.name }}</span>
              </div>
            </div>
            
            <p class="event-description">{{ event.description }}</p>
            
            <button @click="showEventDetails(event)" class="details-btn">
              Más Detalles
            </button>
          </div>
        </div>
      </div>
    </div>

    <section v-if="contentItems.length > 0">
      <div class="menu-global">
        <div class="row">
          <div class="menu-col" v-for="(item, index) in contentItems" :key="'content-' + index">
            <div class="image-container">
              <img :src="item.image" alt="Imagen del menú" />
              <div class="layer">
                <div class="text-box">
                  <h3>{{ item.title }}</h3>
                  <div class="btn-container">
                    <button
                      @click="openContentBar(item.title, item.description)"
                      class="hero-btn"
                    >
                      Conoce más ⇀
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>


    <section>
      <div class="menu-global">
        <div class="row">
          <!-- Columna 1: Funciones -->
          <div class="menu-col" v-for="(item, index) in menuItems" :key="'footer-' + index">
            <div class="image-container">
              <img :src="item.image" alt="Imagen del menú" />
              <div class="layer">
                <div class="text-box">
                  <h3>{{ item.title }}</h3>
                  <div class="btn-container">
                    <button
                      @click="openContentBar(item.title, item.description)"
                      class="hero-btn"
                    >
                      Conoce más ⇀
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

      <ContentBar
        :isVisible="isContentBarVisible"
        :title="currentTitle"
        :description="currentDescription"
        @close="closeContentBar"
      />

    <div v-if="isContentBarVisible" class="content-bar">
      <h2>{{ currentTitle }}</h2>
      <div ref="sideRichText" class="rich-text-container"></div>
      <button @click="isContentBarVisible = false">Cerrar</button>
    </div>
  </div>
</template>

<script>
import AppNavbar from "../components/appNavbar.vue";
import ContentBar from "../components/content-bar.vue";
import { renderRichText } from "../utils/richTextRenderer";
import Limg from "../assets/img/L.png";
import Dimg from "../assets/img/D.png";
import Pimg from "../assets/img/P.png";
export default {
  name: "EspaciosView",
  components: {
    AppNavbar,
    ContentBar,
  },
  data() {
    return {
      isDrawerOpen: false,
      isContentBarVisible: false,
      showContentBar: false,
      currentTitle: "",
      currentDescription: "",
      // Content variables populated from backend pages
      mainTitle: "Espacios Universitarios 🚀",
      introParagraphs: [],
      largeDescriptionHtml: '',
      missionText: "",
      visionText: "",
      objectivesText: "",
      functionsText: "",
      contactText: "",
      menuItems: [],
      contentItems: [],
      events: [],
      currentDate: new Date(),
      selectedDay: null,
      loading: true,
      error: null,
      externalApiUrl:"https://8lvctg3s-3000.brs.devtunnels.ms/api/events"
    };
  },
  computed: {
    currentYear() {
      return this.currentDate.getFullYear();
    },
    currentMonth() {
      return this.currentDate.getMonth();
    },
    currentMonthName() {
      const options = { month: 'long' };
      return this.currentDate.toLocaleDateString('es-ES', options);
    },
    calendarDays() {
      const year = this.currentYear;
      const month = this.currentMonth;
      
      const firstDay = new Date(year, month, 1);
      const lastDay = new Date(year, month + 1, 0);
      const daysFromPrevMonth = firstDay.getDay();
      const daysFromNextMonth = 6 - lastDay.getDay();
      
      const days = [];
      
      // Días del mes anterior
      const prevMonthLastDay = new Date(year, month, 0).getDate();
      for (let i = daysFromPrevMonth - 1; i >= 0; i--) {
        const date = new Date(year, month - 1, prevMonthLastDay - i);
        days.push(this.createDayObject(date, false));
      }
      
      // Días del mes actual
      for (let i = 1; i <= lastDay.getDate(); i++) {
        const date = new Date(year, month, i);
        days.push(this.createDayObject(date, true));
      }
      
      // Días del mes siguiente
      for (let i = 1; i <= daysFromNextMonth; i++) {
        const date = new Date(year, month + 1, i);
        days.push(this.createDayObject(date, false));
      }
      
      return days;
    }
  },
  mounted() {
    this.loadMenuData();
    this.fetchEventsFromExternalApi();
  },
  methods: {
   loadMenuData() {
      // Intentar leer desde window.pageInitialData (renderizado por home/index) o desde gon
      const pagesByGroup = window.pageInitialData?.pages_by_group || window.gon?.pages_by_group || {};
      const espaciosPages = pagesByGroup['espacios_universitarios'] || [];

      // Limpiar arrays
      this.contentItems = [];
      this.menuItems = [];

      if (espaciosPages.length > 0) {
        // Separar el contenido en dos arrays
        const mainContent = []; // Para el contenido principal
        const footerItems = []; // Para Objetivo, Contacto y Funciones
        
        espaciosPages.forEach(p => {
          const subgroup = (p.subgroup || '').toString().toLowerCase();
          
          if (subgroup === 'description') {
            this.mainTitle = p.name || this.mainTitle;
            const fullText = p.large_description || '';
            this.introParagraphs = fullText ? fullText.split(/\n\s*\n/).map(s => s.trim()).filter(Boolean) : [];
            
            this.$nextTick(() => {
              if (typeof renderRichText === 'function' && this.$refs.richText) {
                renderRichText({ 
                  el: this.$refs.richText, 
                  pageId: p.id, 
                  initialHtml: p.large_description_html || '', 
                  sanitize: false 
                });
              }
            });
          } else {
            let img = Pimg;
            if (subgroup === 'objectives') img = Limg;
            if (subgroup === 'functions') img = Dimg;
            if (subgroup === 'contact') img = Pimg;

            const menuItem = {
              image: img,
              title: subgroup.toUpperCase(),
              pageId: p.id,
              description: p.large_description_html || '',
              short_description: p.short_description || '',
              subgroup: subgroup
            };

            // Separar Objetivo, Contacto y Funciones para mostrarlos al final
            if (subgroup === 'objectives' || subgroup === 'contact' || subgroup === 'functions') {
              footerItems.push(menuItem);
            } else {
              mainContent.push(menuItem);
            }
          }
        });

        // Ordenar footerItems en el orden específico:Funciones, Objetivo, Contacto
        const orderedFooterItems = [];
      
        const funciones = footerItems.find(item => item.subgroup === 'functions');
        if (funciones) orderedFooterItems.push(funciones);

        const objetivo = footerItems.find(item => item.subgroup === 'objectives');
        if (objetivo) orderedFooterItems.push(objetivo);
        
        const contacto = footerItems.find(item => item.subgroup === 'contact');
        if (contacto) orderedFooterItems.push(contacto);

        this.contentItems = mainContent;
        this.menuItems = orderedFooterItems;

      } else {
        // Si no hay datos, usar los valores por defecto ya definidos anteriormente
        this.menuItems = [
          {
            image: Limg,
            title: 'OBJETIVOS',
            subtitle: '',
            description: 'Identificar las necesidades de desarrollo social y económico de las comunidades locales y regionales. Diseñar y ejecutar programas dentro de un marco de acción estratégico para la universidad, emanado desde la Dirección de Extensión Universitaria. Fortalecer el trabajo y la vinculación con las diversas comunidades locales y regionales, pertenecientes a los diferentes sectores.'
          },
          {
            image: Dimg,
            title: 'FUNCIONES',
            subtitle: '',
            description: 'Realizar estudios y diagnósticos para identificar las necesidades específicas de las comunidades en las que se implementarán los programas. Diseñar y ejecutar programas y proyectos que respondan a las necesidades identificadas, en el marco de las áreas de acción establecidas. Gestionar los recursos humanos, financieros y materiales necesarios para la ejecución de los programas. Monitorear y evaluar el impacto de los programas en las comunidades, con el fin de realizar los ajustes necesarios para mejorar su efectividad. Fortalecer la vinculación con las comunidades a través de la comunicación permanente y la participación activa en la gestión de los programas. Los Programas Regionales deben difundir los resultados de sus investigaciones y evaluaciones. Esto se puede hacer a través de publicaciones, conferencias y talleres. Los Programas Regionales deben fortalecer las redes de trabajo con otras instituciones que trabajan con las comunidades.'
          },
          {
            image: Pimg,
            title: 'CONTACTO',
            subtitle: '',
            description: 'Coordinador: JUAN ALBERTO TINEO MALAVÉ. Tlf: (0412) 091-6710. Correo: coordinacion.ucvnuevaesparta@gmail.com'
          }
        ];
      }
    },

    async openContentBar(item) {
      const menuItem = typeof item === 'string' 
        ? this.menuItems.find(m => m.title === item) 
        : item;
      
      if (!menuItem) return;
      
      this.currentTitle = menuItem.title;
      this.currentDescription = menuItem.description;
      this.isContentBarVisible = true;

      await this.$nextTick();

      if (menuItem.pageId && this.$refs.sideRichText) {
        try {
          this.$refs.sideRichText.innerHTML = '';
          
          if (typeof renderRichText === 'function') {
            renderRichText({ 
              el: this.$refs.sideRichText, 
              pageId: menuItem.pageId,
              initialHtml: menuItem.description || '',
              sanitize: false 
            });
          } else {
            this.$refs.sideRichText.innerHTML = menuItem.description || 'Contenido no disponible';
          }
        } catch (e) {
          console.error("Error cargando rich text en el sidebar", e);
          if (this.$refs.sideRichText) {
            this.$refs.sideRichText.innerHTML = menuItem.description || 'Contenido no disponible';
          }
        }
      }
    },


    closeContentBar() {
      this.isContentBarVisible = false;
    },

    _stripHtml(html) {
      if (!html) return '';
      const div = document.createElement('div');
      div.innerHTML = html;
      return div.textContent || div.innerText || '';
    },

    openDrawer() {
      this.isDrawerOpen = true;
    },

    closeDrawer() {
      this.isDrawerOpen = false;
    },

    createDayObject(date, isCurrentMonth) {
      const today = new Date();
      const isToday = 
        date.getDate() === today.getDate() &&
        date.getMonth() === today.getMonth() &&
        date.getFullYear() === today.getFullYear();
      
      const events = this.events || [];
      
      const dayEvents = events.filter(event => {
        if (!event || !event.eventFrom || !event.eventTo) return false;
        
        try {
          const eventStartDate = new Date(event.eventFrom);
          const eventEndDate = new Date(event.eventTo);
          const currentDate = new Date(date);
          
          eventStartDate.setHours(0, 0, 0, 0);
          eventEndDate.setHours(0, 0, 0, 0);
          currentDate.setHours(0, 0, 0, 0);
          
          return currentDate >= eventStartDate && currentDate <= eventEndDate;
        } catch (e) {
          console.error('Error procesando fecha del evento:', e);
          return false;
        }
      });
      
      const sortedDayEvents = dayEvents.sort((a, b) => {
        try {
          const timeA = new Date(a.eventFrom).getTime();
          const timeB = new Date(b.eventFrom).getTime();
          return timeA - timeB;
        } catch (e) {
          return 0;
        }
      });
      
      return {
        date: date.toISOString().split('T')[0],
        number: date.getDate(),
        isCurrentMonth,
        isToday,
        events: sortedDayEvents
      };
    },

    getEventDuration(event) {
      try {
        const start = new Date(event.eventFrom);
        const end = new Date(event.eventTo);
        start.setHours(0, 0, 0, 0);
        end.setHours(0, 0, 0, 0);
        const diffTime = Math.abs(end - start);
        const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
        return diffDays + 1;
      } catch (e) {
        console.error('Error calculando duración del evento:', e);
        return 1;
      }
    },

    async fetchEventsFromExternalApi() {
      try {
        this.loading = true;
        this.error = null;
        console.log('🔄 Cargando eventos desde API externa:', this.externalApiUrl);
        
        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), 10000);
        
        const response = await fetch(this.externalApiUrl, {
          method: 'GET',
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          signal: controller.signal,
          mode: 'cors'
        });
        
        clearTimeout(timeoutId);
        
        if (!response.ok) {
          const errorText = await response.text();
          throw new Error(`Error HTTP ${response.status}: ${response.statusText} - ${errorText}`);
        }
        
        const apiData = await response.json();
        let loadedEvents = [];
        
        if (Array.isArray(apiData)) loadedEvents = apiData;
        else if (apiData.events && Array.isArray(apiData.events)) loadedEvents = apiData.events;
        else if (apiData.data && Array.isArray(apiData.data)) loadedEvents = apiData.data;
        else throw new Error('Formato de respuesta no reconocido');
        
        this.events = loadedEvents.map(event => ({
          id: event.id || Math.random(),
          name: event.name || 'Evento sin nombre',
          eventFrom: event.eventFrom || event.start_date || event.fecha_inicio || new Date().toISOString(),
          eventTo: event.eventTo || event.end_date || event.fecha_fin || event.eventFrom || new Date().toISOString(),
          description: event.description || event.descripcion || 'Sin descripción',
          room: event.room || { name: event.location || event.lugar || 'Ubicación no especificada' },
          imagePath: event.imagePath || event.image || event.imagen || ''
        }));
        
        console.log(`✅ ${this.events.length} eventos cargados`);
      } catch (err) {
        console.error('❌ Error cargando eventos:', err);
        this.error = `No se pudieron cargar los eventos: ${err.message}`;
        this.events = [];
      } finally {
        this.loading = false;
        this.$forceUpdate();
      }
    },

    previousMonth() {
      this.currentDate = new Date(this.currentYear, this.currentMonth - 1, 1);
      this.$forceUpdate();
    },

    nextMonth() {
      this.currentDate = new Date(this.currentYear, this.currentMonth + 1, 1);
      this.$forceUpdate();
    },

    selectDay(day) {
      if (day.events && day.events.length > 0) {
        this.selectedDay = day;
      }
    },

    closeModal() {
      this.selectedDay = null;
    },

    getEventColor(event) {
      const colors = ['#01695b', '#025247', '#0a8c7a', '#1caf9a'];
      return colors[(event.id || 0) % colors.length];
    },

    formatDate(dateString) {
      try {
        const date = new Date(dateString);
        return date.toLocaleDateString('es-ES', { 
          weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' 
        });
      } catch (e) {
        return 'Fecha no disponible';
      }
    },

    formatTime(dateTimeString) {
      try {
        const date = new Date(dateTimeString);
        return date.toLocaleTimeString('es-ES', { hour: '2-digit', minute: '2-digit' });
      } catch (e) {
        return 'Hora no disponible';
      }
    },

    showEventDetails(event) {
      alert(`Más detalles de: ${event.name}\n\n${event.description}`);
    },

    getImageUrl(imagePath) {
      if (!imagePath) return '';
      if (imagePath.startsWith('http')) return imagePath;
      return `https://8lvctg3s-3000.brs.devtunnels.ms${imagePath}`;
    },

    handleImageError(event) {
      event.target.src = 'https://via.placeholder.com/250x200?text=No+Imagen';
    }
  }
};
</script>

<style scoped>
@font-face {
  font-family: "museo-sans";
  src: url("../assets/fonts/MuseoSans-100.ttf");
}
* {
  font-family: "museo-sans";
}
p {
  color: #fff;
  font-size: 20px;
  line-height: 1.6;
  text-align: justify;
  margin-bottom: 20px;
}

h3 {
  text-align: center;
  font-weight: 100;
  margin: 10px 0;
}

.sub-header {
  height: 30vh;
  width: 100%;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  background-image: linear-gradient(
      to top,
      rgba(0, 0, 0, 0.9),
      rgba(0, 0, 0, 0.1)
    ),
    url("../assets/img/estudiantesimg.jpg");
  background-position: center;
  background-size: cover;
  text-align: center;
  color: #fff;
}
.sub-header h1 {
  padding-top: 50px;
  text-align: left;
  padding-left: 140px;
}

.link-section {
  background-color: #025247;
}

.breadcrumbs {
  font-family: "Arial", sans-serif;
  font-size: 16px;
  display: flex;
  align-items: center;
  padding: 10px 20px;
  background-color: #025247;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  margin-left: 100px;
}

.breadcrumbs ul {
  list-style: none;
  display: flex;
  gap: 10px;
  margin: 0;
  padding: 0;
}

.breadcrumbs li {
  display: flex;
  align-items: center;
}

.breadcrumbs li:not(:last-child)::after {
  content: "›";
  margin-left: 10px;
  margin-right: 10px;
  color: #ffffff;
}

.breadcrumbs a {
  text-decoration: none;
  color: #ffffff;
  font-weight: 500;
  transition: color 0.3s;
}

.breadcrumbs a:hover {
  color: #ffffff;
}

.content-container {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  gap: 20px;
  padding-bottom: 70px;
}

.icon {
  margin-right: 5px;
}

.section-container {
  width: 100%;
  background-image: linear-gradient(#01695b, #01695bef),
    url("../assets/img/deuimg.jpg");
}
.titulo {
  font-weight: 700;
  line-height: 1em;
  font-family: "museo-sans";
  padding-bottom: 20px;
  margin: 0 auto;
  border-bottom: 3px solid #ffffff;
  padding-bottom: 5px;
}

.mision-vision {
  padding-top: 80px;
  width: 70%;
  background-image: linear-gradient(#01695b, #01695bef),
    url("../assets/img/deuimg.jpg");
  color: #fff;
  gap: 20px;
  margin: 0 auto;
  text-align: left;
  padding: 40px 0;
}

.paragraphs {
  flex-direction: column;
  margin: 0 auto;
  padding-top: 40px;
}

.paragraphs p {
  font-size: 20px;
  font-weight: 300;
}
/* Rich text from ActionText */
.rich-text {
  color: #fff;
  font-size: 20px;
  line-height: 1.6;
  margin-top: 20px;
}
/* */

.drawer-enter-active,
.drawer-leave-active {
  transition: transform 1s ease, opacity 1s ease;
}
.drawer-enter, .drawer-leave-to {
  transform: translateX(100%);
  opacity: 0;
}
.btn-container {
  display: none;
  justify-content: center;
  align-items: center;
  position: absolute;
  bottom: 20px;
  left: 0;
  width: 100%;
  height: auto;
  text-align: center;
}

.menu-col:hover .btn-container {
  display: block;
}
.hero-btn {
  display: inline-block;
  text-decoration: none;
  color: white;
  border: 1px solid #ffffff;
  padding: 12px 34px;
  font-size: 13px;
  background: transparent;
  cursor: pointer;
  border-radius: 50px;
  width: 200px;
}
.menu-col {
  position: relative;
  overflow: hidden;
}

.hero-btn:hover {
  background: #01695b;
  transition: 1s;
}
.row {
  display: flex;
  flex-wrap: wrap;
}

.menu-global {
  width: 100%;
  margin: 0;
  text-align: center;
  padding-top: 0px;
  overflow: hidden;
}

.row .menu-col {
  flex-basis: 33.1%;
  position: relative;
  overflow: hidden;
  padding-left: 0px;
  padding-right: 0px;
}

.menu-col img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.layer {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  transition: 0.5s;
}

.layer:hover {
  background: #01695b;
}

.text-box {
  color: #fff;
  text-align: center;
  padding: 20px;
  opacity: 1;
  transition: all 0.5s ease;
}

.layer:hover .text-box h3,
.layer:hover .text-box h5,
.layer:hover .text-box p {
  opacity: 0;
  transform: translateY(0);
}

.image {
  max-width: 300px;
  margin-left: 20px;
  padding-right: 20px;
  padding-bottom: 50px;
}

@media (max-width: 1024px) {
  .hero-btn {
    font-size: 18px;
  }
  h1 {
    font-size: 40px;
  }

  .titulo {
    font-size: 40px;
  }
  p {
    font-size: 20px;
    line-height: 1.8;
  }
  .icon {
    font-size: 3rem;
  }
}
@media (max-width: 768px) {
  .row {
    flex-direction: column;
  }
  .menu-col {
    flex-direction: column;
  }
  .sub-header h1 {
    padding-left: 30px;
  }
  .row-about {
    flex-direction: column;
  }
  h1 {
    font-size: 1.5rem;
  }
  p {
    font-size: 1rem;
    line-height: 1.4;
    margin-bottom: 25px; 
    padding: 0 5px; 
  }
  .icon {
    font-size: 1.5rem;
  }
  .titulo {
    font-size: 1.5rem;
  }
  .paragraphs h3 {
    font-size: 1rem;
  }
  .paragraphs p {
    font-size: 1rem;
  }
  .objetivos {
    padding-top: 80px;
    padding-bottom: 80px;
  }
  .breadcrumbs {
    margin-left: 10px;
  }
  .breadcrumbs a {
    font-size: 0.9rem;
    line-height: 1;
  }
  .mision-vision {
    padding: 20px 40px;
    width: 100%;
  }
  .sub-header {
    height: 20vh;
  }
}

/* CALENDAR  */

.event-calendar-container {
  background: white;
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  padding: 30px;
  margin: 50px auto;
  max-width: 1200px;
}

.calendar-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
  padding-bottom: 20px;
  border-bottom: 2px solid #f0f0f0;
}

.calendar-title {
  color: #01695b;
  font-size: 28px;
  font-weight: 700;
  margin: 0;
}

.calendar-controls {
  display: flex;
  align-items: center;
  gap: 20px;
}

.current-month {
  font-size: 20px;
  font-weight: 600;
  color: #333;
  min-width: 200px;
  text-align: center;
}

.control-btn {
  background: #01695b;
  color: white;
  border: none;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  font-size: 18px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.control-btn:hover {
  background: #025247;
  transform: scale(1.1);
}

.calendar-grid {
  display: flex;
  flex-direction: column;
}

.calendar-weekdays {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  gap: 10px; 
  margin-bottom: 10px;
  width: 100%; 
}
.weekday {
  text-align: center;
  font-weight: 600;
  color: #01695b;
  padding: 15px 0;
  background: #f8f9fa;
  border-radius: 8px;
}

.calendar-days {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  gap: 10px;
  width: 100%;
}

.calendar-day {
  min-height: 100px;
  min-width: 100px; 
  box-sizing: border-box; 
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  padding: 5px;
  cursor: pointer;
  transition: all 0.3s ease;
  flex-direction: column;
  overflow: hidden;
}

.calendar-day:hover {
  background: #f8f9fa;
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.calendar-day.current-month {
  background: white;
}

.calendar-day:not(.current-month) {
  background: #f8f9fa;
  color: #999;
}

.calendar-day.today {
  background: #e8f5e9;
  border-color: #01695b;
}

.calendar-day.has-events {
  border-color: #01695b;
}

.day-number {
  font-weight: 600;
  margin-bottom: 8px;
  font-size: 16px;
}

.day-events {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 3px;
  overflow: hidden;
}

.event-indicator {
  color: white;
  padding: 3px 6px;
  border-radius: 4px;
  font-size: 11px;
  text-align: center;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

/* Modal de eventos */
.event-modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.7);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
  padding: 20px;
}

.event-modal {
  background: white;
  border-radius: 15px;
  max-width: 800px;
  width: 90%;
  max-height: 90vh;
  overflow-y: auto;
  position: relative;
  padding: 30px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
}

.close-modal {
  position: absolute;
  top: 15px;
  right: 15px;
  background: none;
  border: none;
  font-size: 30px;
  color: #666;
  cursor: pointer;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s ease;
}

.close-modal:hover {
  background: #f0f0f0;
  color: #333;
}

.modal-date {
  color: #01695b;
  font-size: 24px;
  margin-bottom: 30px;
  padding-bottom: 15px;
  border-bottom: 2px solid #f0f0f0;
}

.event-card {
  display: flex;
  gap: 25px;
  padding: 25px;
  margin-bottom: 25px;
  background: #f8f9fa;
  border-radius: 10px;
  border-left: 5px solid #01695b;
  transition: all 0.3s ease;
}

.event-card:hover {
  transform: translateX(5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.event-image-container {
  flex-shrink: 0;
  width: 250px;
}

.event-image {
  width: 100%;
  height: 200px;
  object-fit: cover;
  border-radius: 8px;
}

.event-details {
  flex: 1;
}

.event-name {
  color: #01695b;
  font-size: 22px;
  margin: 0 0 15px 0;
}

.event-info {
  display: flex;
  gap: 25px;
  margin-bottom: 20px;
}

.info-item {
  display: flex;
  align-items: center;
  gap: 8px;
  color: #666;
  font-size: 15px;
}

.info-icon {
  font-size: 18px;
}

.event-description {
  color: #555;
  line-height: 1.6;
  margin-bottom: 20px;
  font-size: 16px;
}

.details-btn {
  background: #01695b;
  color: white;
  border: none;
  padding: 12px 30px;
  border-radius: 50px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  display: inline-flex;
  align-items: center;
  gap: 8px;
}

.details-btn:hover {
  background: #025247;
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(1, 105, 91, 0.3);
}

/* Responsive */
@media (max-width: 768px) {
  .event-calendar-container {
    padding: 20px;
    margin: 30px auto;
  }
  
  .calendar-header {
    flex-direction: column;
    gap: 15px;
  }
  
  .calendar-title {
    font-size: 24px;
  }
  
  .calendar-day {
    min-height: 80px;
    padding: 5px;
  }
  
  .day-number {
    font-size: 14px;
  }
  
  .event-indicator {
    font-size: 9px;
    padding: 2px 4px;
  }
  
  .event-card {
    flex-direction: column;
  }
  
  .event-image-container {
    width: 100%;
  }
  
  .event-info {
    flex-direction: column;
    gap: 10px;
  }
  
  .event-modal {
    padding: 20px;
    width: 95%;
  }
}
</style>
