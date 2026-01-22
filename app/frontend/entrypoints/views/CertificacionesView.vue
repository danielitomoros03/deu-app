<template>
  <div style="min-height: 100vh; width: 100%">
    <section class="sub-header">
      <h1>Certificaciones</h1>
    </section>
    <AppNavbar />
    <section class="link-section">
      <nav class="breadcrumbs">
        <ul>
          <li>
            <router-link to="/"><span>🚀</span></router-link>
          </li>
          <li>
            <router-link to="/certificaciones-y-avales"
              >Certificaciones y avales</router-link
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

    <CardSection
      :title="certificadosData.title"
      :description="certificadosData.description"
      :buttonText="certificadosData.buttonText"
      :buttonLink="certificadosData.buttonLink"
      :items="certificadosData.items"
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
import espacioPrueba1 from "../assets/img/espacioPrueba.jpg";
import espacioPrueba2 from "../assets/img/espacioPrueba2.jpg";
import espacioPrueba3 from "../assets/img/espacioPrueba3.jpg";
import { renderRichText } from "../utils/richTextRenderer";

export default {
  name: "CertificacionesView",
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
      mainTitle: "Certificaciones y Avales 🚀",
      introParagraphs: [],
      largeDescriptionHtml: '',
      missionText: "",
      visionText: "",
      objectivesText: "",
      functionsText: "",
      contactText: "",
      menuItems: [],
      contentItems: [],
      certificadosData: {
        title: "Explora nuestros Certificados",
        description: "Explora nuestros certificados diseñados para ampliar tu conocimiento.",
        buttonText: "Explorar ⇀",
        buttonLink: "#certificaciones-y-avales",
        items: [
           {
            image: espacioPrueba1,
            alt: "Certificado 1",
            title: "Certificado 1",
            description: "Pasillo.",
            },
          {
            image: espacioPrueba2,
            alt: "Certificado 2",
            title: "Certificado 2",
            description: "Edificio.",
           },
          {
            image: espacioPrueba3,
            alt: "Certificado 3",
            title: "Certificado 3",
            description: "Mural.",
          },
        ],
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
      const certificadosPages = pagesByGroup['certificaciones'] || [];

      // Limpiar arrays
      this.contentItems = [];
      this.menuItems = [];

      if (certificadosPages.length > 0) {
        // Separar el contenido en dos arrays
        const mainContent = []; // Para el contenido principal
        const footerItems = []; // Para Objetivo, Contacto y Funciones
        
        certificadosPages.forEach(p => {
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
</style>
