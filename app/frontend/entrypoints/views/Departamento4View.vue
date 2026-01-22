<template>
  <div style="min-height: 100vh; width: 100%">
    <section class="sub-header">
      <h1>Departamentos</h1>
    </section>
    <AppNavbar />
    <section class="link-section">
      <nav class="breadcrumbs">
        <ul>
          <li>
            <router-link to="/"><span>🚀</span></router-link>
          </li>
          <li><router-link to="/departamentos1">Departamentos</router-link></li>
          <li>
            <router-link to="/departamentos4"
              >División de Proyectos y Programas</router-link
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
            <div ref="richText"></div>
          </div>
        </div>
      </div>
    </section>

    <section>
      <div class="menu-global">
        <div class="row">
          <!-- Columna 1 -->
          <div class="menu-col" v-for="(item, index) in menuItems" :key="index">
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

      <ContentBar
        :isVisible="isContentBarVisible"
        :title="currentTitle"
        :description="currentDescription"
        @close="closeContentBar"
      />
    </section>
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

import Limg from "../assets/img/L.png";
import Dimg from "../assets/img/D.png";
import Pimg from "../assets/img/P.png";

import { renderRichText } from "../utils/richTextRenderer.js";

export default {
  name: "Departamento4View",
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
      mainTitle: "División de Proyectos y Programas 🚀",
      introParagraphs: [],
      largeDescriptionHtml: '',
      missionText: "",
      visionText: "",
      objectivesText: "",
      functionsText: "",
      contactText: "",
      menuItems: [],
    };
  },
  mounted() {
    this.loadMenuData();
  },
  methods: {
    loadMenuData() {
      // Intentar leer desde window.pageInitialData (renderizado por home/index) o desde gon
      const pagesByGroup = window.pageInitialData?.pages_by_group || window.gon?.pages_by_group || {};
      const departamentoPages = pagesByGroup['departamento4'] || [];
      // Evitamos duplicados
      this.menuItems = [];

      if (departamentoPages.length > 0) {
        // Llenar variables por apartado según subgroup
        departamentoPages.forEach(p => {
          // Normalize subgroup to lower-case to tolerate edits with different casing
          const subgroup = (p.subgroup || '').toString().toLowerCase();
          if (subgroup === 'description') {
            // Simple load: do not attempt to parse MISIÓN/VISIÓN; just load short and large descriptions
            this.mainTitle = p.name || this.mainTitle;
            const shortText = p.large_description|| '';
            this.introParagraphs = shortText ? shortText.split(/\n\s*\n/).map(s => s.trim()).filter(Boolean) : [];
            try {
              renderRichText({ el: this.$refs.richText, pageId: p.id, initialHtml: p.large_description_html || '', sanitize: false });
            } catch (e) {
              // eslint-disable-next-line no-console
              console.error('renderRichText failed', e);
            }
            this.contactText = p.short_description || '';
          } else {
            // Mapeo de imágenes según el subgrupo
            let img = Pimg;
            if (subgroup === 'objectives') img = Limg;
            if (subgroup === 'functions') img = Dimg;
            if (subgroup === 'contact') img = Pimg;

            this.menuItems.push({
              image: img,
              title: subgroup.toUpperCase(),
              pageId: p.id,
              subgroup: subgroup,
              description: p.large_description_html || '', // Usar large_description_html para mostrar en el botón
              short_description: p.short_description || '',
            });
          }
        });

      } else {
        // Si no hay datos, usar los valores por defecto ya definidos anteriormente
        this.menuItems = [
          {
            image: Limg,
            title: 'OBJETIVOS',
            subtitle: '',
            description: 'Facilitar el acceso a formaciones no académicas dirigidas a la actualización y el mejoramiento profesional de toda la comunidad universitaria. Mantener una oferta educativa y accesible a un público amplio que denota el compromiso social de la Universidad por la sociedad.'
          },
          {
            image: Dimg,
            title: 'FUNCIONES',
            subtitle: '',
            description: 'Formular y evaluar la factibilidad de realizar programas y proyectos de orientación educativa. Asegurar el cumplimiento de los lineamientos metodológicos requeridos. Realizar informes de avance de los programas y proyectos de extensión educativa. Brindar información de los programas y proyectos de extensión educativa. Participar en la organización de cursos y talleres, así como en la coordinación de estos con las Facultades y Dependencias Centrales de la Universidad que lo requieran. Elaborar la planificación de cursos de capacitación, presenciales o a distancia a ser dictados por la Dirección de Extensión. Coordinar la divulgación de todos los programas educativos de extensión de la Universidad. Las demás funciones que le confieren las leyes y reglamentos, normas y su supervisor inmediato.'
          },
          {
            image: Pimg,
            title: 'CONTACTO',
            subtitle: '',
            description: 'Coordinador: MARIA ISABEL RAMOS. Tlf: (0212) 605-3919. Correo: deu.depecp@gmail.com'
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

  if (menuItem.pageId) {
    try {
      // Limpiar contenido anterior
      if (this.$refs.sideRichText) {
        this.$refs.sideRichText.innerHTML = '';
      }
      
      renderRichText({ 
        el: this.$refs.sideRichText, 
        pageId: menuItem.pageId,
        initialHtml: menuItem.description || '',
        sanitize: false 
      });
    } catch (e) {
      console.error("Error cargando rich text en el sidebar", e);
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
  line-height: 1.6; /* Interlineado ajustado */
  text-align: justify; /* Justificar texto para mejor lectura */
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
/* */
.link-section {
  background-color: #025247;
}

.breadcrumbs {
  font-family: "Arial", sans-serif;
  font-size: 16px;
  display: flex;
  align-items: center;
  padding: 10px 20px;
  background-color: #025247; /* Fondo claro */
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  margin-left: 100px;
}

.breadcrumbs ul {
  list-style: none;
  display: flex;
  gap: 10px; /* Espacio entre los elementos */
  margin: 0;
  padding: 0;
}

.breadcrumbs li {
  display: flex;
  align-items: center;
}

.breadcrumbs li:not(:last-child)::after {
  content: "›"; /* Separador entre enlaces */
  margin-left: 10px;
  margin-right: 10px;
  color: #ffffff; /* Color del separador */
}

.breadcrumbs a {
  text-decoration: none;
  color: #ffffff; /* Azul profesional */
  font-weight: 500; /* Peso medio */
  transition: color 0.3s;
}

.breadcrumbs a:hover {
  color: #ffffff; /* Azul más oscuro en hover */
}
/* */
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
  margin: 0 auto; /* Centra el contenido */
  border-bottom: 3px solid #ffffff; /* Color y grosor de la línea */
  padding-bottom: 5px; /* Espacio entre el título y la línea */
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
  margin: 0 auto; /* Centra el contenido */
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
.drawer-enter, .drawer-leave-to /* .drawer-leave-active in <2.1.8 */ {
  transform: translateX(100%);
  opacity: 0;
}
.btn-container {
  display: none; /* Usa flexbox para alinear el contenido */
  justify-content: center; /* Centra horizontalmente */
  align-items: center; /* Centra verticalmente si es necesario */
  position: absolute;
  bottom: 20px; /* Espacio desde el borde inferior de la columna */
  left: 0; /* Alinea el contenedor al borde izquierdo de la columna */
  width: 100%; /* Asegura que el contenedor ocupe todo el ancho de la columna */
  height: auto; /* Ajusta la altura si es necesario */
  text-align: center; /* Centra el texto dentro del contenedor */
}

.menu-col:hover .btn-container {
  display: block; /* Muestra el botón al hacer hover sobre la columna */
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
  width: 200px; /* Ancho del botón */
  /* margin: 0 auto; No es necesario con flexbox en el contenedor */
}
.menu-col {
  position: relative; /* Asegura que el contenedor de imagen tenga posición relativa */
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

/* Capa negra siempre visible */
.layer {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5); /* Capa negra con 50% de opacidad */
  display: flex;
  justify-content: center;
  align-items: center;
  transition: 0.5s;
}

/* Efecto hover sobre la capa */
.layer:hover {
  background: #01695b; /* Aumenta la opacidad al hacer hover */
}

.text-box {
  color: #fff;
  text-align: center;
  padding: 20px;
  opacity: 1;
  transition: all 0.5s ease;
}

/* Efecto hover sobre el texto */
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

/** */
@media (max-width: 1024px) {
  .hero-btn {
    font-size: 18px; /* Aumenta el tamaño del botón */
  }
  h1 {
    font-size: 40px; /* Aumenta el tamaño de h1 en pantallas grandes */
  }

  .titulo {
    font-size: 40px; /* Aumenta el tamaño del título en pantallas grandes */
  }
  p {
    font-size: 20px; /* Aumenta el tamaño del texto de los párrafos */
    line-height: 1.8; /* Ajusta el interlineado */
  }
  .icon {
    font-size: 3rem; /* Aumenta el tamaño de los iconos */
  }
}
@media (max-width: 768px) {
  .row {
    flex-direction: column;
  }
  .menu-col {
    flex-direction: column;
  }
  .row-about {
    flex-direction: column;
  }
  h1 {
    font-size: 1.5rem;
  }
  .sub-header h1 {
    padding-left: 30px;
  }
  p {
    font-size: 1rem; /* Reducir tamaño aún más en pantallas muy pequeñas */
    line-height: 1.4;
    margin-bottom: 25px; /* Reducir espacio entre párrafos */
    padding: 0 5px; /* Reducir padding lateral en dispositivos más pequeños */
    text-align: left;
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
</style>
