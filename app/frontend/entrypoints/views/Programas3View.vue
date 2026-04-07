<template>
  <div style="min-height: 100vh; width: 100%">
    <section class="sub-header">
      <h1>Programas</h1>
    </section>
    <AppNavbar />
    <section class="link-section">
      <nav class="breadcrumbs">
        <ul>
          <li>
            <router-link to="/"><span>🚀</span></router-link>
          </li>
          <li><router-link to="/programas3">Programas</router-link></li>
          <li>
            <router-link to="/programas3"
              >Proyecto, Productos y Servicios</router-link
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
            <template>
              <p v-for="(p, idx) in introParagraphs" :key="idx">
                {{ p }}
              </p>
            </template>
            <div ref="richText" class="rich-text"></div>
          </div>
        </div>
      </div>
    </section>

    <CardSection
      v-if="newsData.items.length > 0"
      :title="newsData.title"
      :description="newsData.description"
      :buttonText="newsData.buttonText"
      :buttonLink="newsData.buttonLink"
      :items="newsData.items"
    />

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
import CardSection from "../components/CardSection.vue";

import Limg from "../assets/img/L.png";
import Dimg from "../assets/img/D.png";
import Pimg from "../assets/img/P.png";

import { renderRichText } from "../utils/richTextRenderer.js";

export default {
  name: "Programas3View",
  components: {
    AppNavbar,
    CardSection,
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
      mainTitle: "Proyecto, Productos y Servicios 🚀",
      introParagraphs: [],
      largeDescriptionHtml: '',
      missionText: "",
      visionText: "",
      objectivesText: "",
      functionsText: "",
      contactText: "",
      menuItems: [],
      contentItems: [],
      newsData: {
        title: "Últimas Noticias",
        description: "Conoce las noticias más recientes de la DEU.",
        buttonText: "",
        buttonLink: "",
        items: [],
      },
    };
  },

  
  mounted() {
    this.loadMenuData();
  },
  methods: {
    loadMenuData() {
      // Intentar leer desde window.pageInitialData (renderizado por home/index) o desde gon
      const pagesByGroup = window.pageInitialData?.pages_by_group || window.gon?.pages_by_group || {};
      const programaPages = pagesByGroup['programa3'] || [];
      const eventsByCategory = window.pageInitialData?.events_by_category || window.gon?.events_by_category || {};
      const noticiaItems = eventsByCategory.noticia || [];

      this.newsData.items = noticiaItems.map((event) => ({
        image: event.image_url,
        alt: event.title,
        title: event.title,
        description: `${event.day_formatted} - ${event.description}`,
      }));

      // Limpiar arrays
      this.contentItems = [];
      this.menuItems = [];

      if (programaPages.length > 0) {
        // Separar el contenido en dos arrays
        const mainContent = []; // Para el contenido principal
        const footerItems = []; // Para Objetivo, Contacto y Funciones
        
        programaPages.forEach(p => {
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
        this.contentItems = [];
        
        this.menuItems = [
          {
            image: Limg,
            title: 'OBJETIVOS',
            subtitle: '',
            description: 'Identificar oportunidades de vinculación entre la universidad y las comunidades, los sectores público y privado, y las organizaciones de la sociedad civil, coordinando con las Facultades el levantamiento de información sobre proyectos, productos y servicios universitarios. Brindar apoyo técnico y administrativo a los equipos responsables de la ejecución de los proyectos universitarios. Divulgar los resultados de los proyectos universitarios a través de diversos canales de comunicación.'
          },
          {
            image: Dimg,
            title: 'FUNCIONES',
            subtitle: '',
            description: 'Identificar, en trabajo conjunto a las facultades, las oportunidades de colaboración entre la Universidad y las comunidades, los sectores público y privado, y las organizaciones de la sociedad civil. Evaluar las propuestas de proyectos universitarios, considerando su relevancia social, impacto potencial y viabilidad técnica y financiera. Seleccionar los proyectos universitarios que se alineen con los objetivos estratégicos de la Universidad y que tengan mayor potencial de impacto en la sociedad. Promover la creación de alianzas estratégicas entre la UCV y el sector productivo, para favorecer la transferencia de tecnología y conocimiento desde la universidad hacia el sector productivo. Brindar apoyo técnico y administrativo a los equipos responsables de la ejecución de los proyectos universitarios. Facilitar la coordinación entre los diferentes actores involucrados en los proyectos universitarios. Monitorear y evaluar el avance de los proyectos universitarios, asegurando el cumplimiento de los objetivos y metas establecidos. Difusión de los resultados de los Proyectos Universitarios. Divulgar los resultados de los proyectos universitarios a través de diversos canales de comunicación. Participar en eventos y ferias relacionadas con la innovación y el desarrollo productivo para promocionar la oferta de la UCV. Organizar eventos para presentar los resultados de los proyectos universitarios a la comunidad universitaria y al público en general. Generar publicaciones científicas y técnicas sobre los resultados de los proyectos universitarios.'
          },
          {
            image: Pimg,
            title: 'CONTACTO',
            subtitle: '',
            description: 'Coordinador: : RAFAEL VIELMA. Tlf: (0212) 605-3964. Correo: deu.depecp@gmail.com'
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

/* Elimina cualquier pseudo-elemento que genere espacio o contenido antes del contenido principal */
.rich-text-container *::before,
.content-bar *::before,
.rich-text-container *::after,
.content-bar *::after {
  content: none !important;
  display: inline !important;
}

/** */
/* Base Styles (Mobile first) */
.sub-header h1 {
  padding-top: 50px;
  text-align: left;
  padding-left: 20px;
}

.breadcrumbs {
  margin-left: 20px;
}

.mision-vision {
  width: 90%;
}

.titulo {
  font-size: 1.8rem;
}

.menu-col {
  flex-basis: 100%;
}

/* BREAKPOINTS */

/* Mobile Small */
@media (max-width: 480px) {
  .sub-header h1 {
    font-size: 1.5rem;
    padding-left: 15px;
  }
  
  .titulo {
    font-size: 1.4rem;
  }
}

/* Tablet and up */
@media (min-width: 768px) {
  .sub-header h1 {
    padding-left: 60px;
    font-size: 2.2rem;
  }

  .breadcrumbs {
    margin-left: 50px;
  }

  .mision-vision {
    width: 80%;
  }

  .titulo {
    font-size: 2.5rem;
  }

  .menu-col {
    flex-basis: 49%;
  }
}

/* Laptop and up */
@media (min-width: 992px) {
  .sub-header h1 {
    padding-left: 100px;
    font-size: 2.8rem;
  }

  .breadcrumbs {
    margin-left: 80px;
  }

  .mision-vision {
    width: 75%;
  }

  .titulo {
    font-size: 3rem;
  }

  .menu-col {
    flex-basis: 33.1%;
  }
}

/* Desktop and up */
@media (min-width: 1200px) {
  .sub-header h1 {
    padding-left: 140px;
    font-size: 3.5rem;
  }

  .breadcrumbs {
    margin-left: 100px;
  }

  .mision-vision {
    width: 70%;
  }
}
</style>
