<template>
  <div style="min-height: 100vh; width: 100%">
    <section class="sub-header">
      <h1>{{ subHeaderTitle }}</h1>
    </section>
    <AppNavbar />
    <section class="link-section">
      <nav class="breadcrumbs">
        <ul>
          <li>
            <router-link to="/"><span>🚀</span></router-link>
          </li>
          <li>
            <router-link to="/about">Sobre Nosotros</router-link>
          </li>
        </ul>
      </nav>
    </section>
    <section class="section-container">
      <div class="mision-vision">
        <h1 class="titulo">{{ mainTitle }} <span class="icon">🚀 </span></h1>
        <div class="content-container">
          <div class="paragraphs">
            <div ref="mainRichText" class="rich-text"></div>
            <template v-if="introParagraphs.length">
               <p v-for="(p, idx) in introParagraphs" :key="idx">{{ p }}</p>
            </template>
          </div>
        </div>
      </div>
    </section>
    <section>
      <h1 class="valores">Nuestros Valores <span class="icon">🚀 </span></h1>
      <div class="card-container">
        <div v-for="(val, idx) in values" :key="'val-'+idx" class="card">
          <div class="icon">
            <img :src="val.image" :alt="'Icono ' + (idx+1)" />
          </div>
          <h3 class="title">{{ val.title }}</h3>
          <p class="text">{{ val.text }}</p>
        </div>
      </div>
    </section>
    
    <section class="objetivos">
      <div class="row-about">
        <div class="about-col">
          <div class="about-container-img">
            <img :src="descriptionImageUrl" alt="Sobre Nosotros" />
          </div>
        </div>
        <div class="about-col">
          <h1>{{ functionsItem.title }}</h1>
          <p>{{ functionsItem.short_description }}</p>
          <div class="btn-container">
            <button @click="openContentBar(functionsItem)" class="hero-btn">
              Conoce más ⇀
            </button>
          </div>
        </div>
      </div>
    </section>

    <MenuBar :menuItems="teamItems" />

    <section class="objetivos">
      <div class="row-about">
        <div class="about-col">
          <div class="about-container-img">
            <img :src="historyImageUrl" alt="Reseña Historica" />
          </div>
        </div>
        <div class="about-col">
          <h1>{{ historyItem.title }}</h1>
          <p>{{ historyItem.short_description }}</p>
          <div class="btn-container">
            <button @click="openContentBar(historyItem)" class="hero-btn">
              Conoce más ⇀
            </button>
          </div>
        </div>
      </div>
    </section>

    <div class="organigrama-container">
       <img :src="infogramImageUrl" class="organigrama" alt="Organigrama" />
    </div>

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
import MenuBar from "../components/MenuBar.vue";

import compromisoImg from "../assets/img/compromiso.png";
import excelenciaImg from "../assets/img/excelencia.png";
import innovacionImg from "../assets/img/innovacion.png";
import colaboracionImg from "../assets/img/colaboracion.png";

import imgantonio from "../assets/img/imgantonio.jpg";
import imgmercy from "../assets/img/imgmercy.jpg";
import imgelizabeth from "../assets/img/imgelizabeth1.png";
import defaultInfogram from "../assets/img/f_organigrama.png";
import defaultDescriptionImg from "../assets/img/deuabout.png";
import defaultHistoryImg from "../assets/img/IMAGEN_B.png";

import { renderRichText, cleanActionTextHtml } from "../utils/richTextRenderer";

export default {
  name: "AboutView",
  components: {
    AppNavbar,
    ContentBar,
    MenuBar,
  },
  data() {
    return {
      isContentBarVisible: false,
      currentTitle: "",
      currentDescription: "",
      subHeaderTitle: "Sobre Nosotros",
      mainTitle: "Sobre Nosotros",
      introParagraphs: [],
      values: [
        { image: compromisoImg, title: "COMPROMISO", text: "Con el crecimiento y desarrollo de nuestra comunidad. Trabajamos de manera responsable, ética y dedicada." },
        { image: excelenciaImg, title: "EXCELENCIA", text: "En todo lo que hacemos, desde la planificación y desarrollo de nuestros programas." },
        { image: innovacionImg, title: "INNOVACIÓN", text: "Fomentamos la creatividad y la innovación en la extensión universitaria." },
        { image: colaboracionImg, title: "COLABORACIÓN", text: "Valoramos el trabajo en equipo y la colaboración con nuestros aliados." }
      ],
      functionsItem: { title: "Funciones", short_description: "", description: "" },
      historyItem: { title: "Reseña Historica", short_description: "", description: "" },
      teamItems: [],
      defaultTeamItems: [
        { image: imgantonio, title: "Ing. José Antonio Fernández", subtitle: "Sub-Director", description: "Subdirector de la Dirección de Extensión Universitaria." },
        { image: imgmercy, title: "Prof. Mercy Ospina", subtitle: "Directora", description: "Directora de la Dirección de Extensión Universitaria." },
        { image: imgelizabeth, title: "Sra. Elizabeth Piña", subtitle: "Jefa de División", description: "Jefa de la División de Programas y Proyectos." }
      ],
      infogramImageUrl: defaultInfogram,
      descriptionImageUrl: defaultDescriptionImg,
      historyImageUrl: defaultHistoryImg
    };
  },
  mounted() {
    this.loadMenuData();
  },
  methods: {
    loadMenuData() {
      const pagesByGroup = window.pageInitialData?.pages_by_group || window.gon?.pages_by_group || {};
      const nosotrosPages = pagesByGroup['nosotros'] || [];

      if (nosotrosPages.length > 0) {
        nosotrosPages.forEach(p => {
          const subgroup = (p.subgroup || '').toString().toLowerCase();
          
          if (subgroup === 'title') {
            this.subHeaderTitle = p.name || this.subHeaderTitle;
          } else if (subgroup === 'description') {
            this.mainTitle = p.name || this.mainTitle;
            const fullText = p.large_description || '';
            this.introParagraphs = fullText ? fullText.split(/\n\s*\n/).map(s => s.trim()).filter(Boolean) : [];
            
            this.$nextTick(() => {
              if (this.$refs.mainRichText) {
                renderRichText({ el: this.$refs.mainRichText, pageId: p.id, initialHtml: p.large_description_html || '', sanitize: false });
              }
            });
            // Use uploaded section image if available
            if (p.section_image_url) {
              this.descriptionImageUrl = p.section_image_url;
            }
          } else if (subgroup.startsWith('value')) {
            const index = parseInt(subgroup.replace('value', '')) - 1;
            if (this.values[index]) {
              this.values[index].title = p.name || this.values[index].title;
              this.values[index].text = p.short_description || this.values[index].text;
            }
          } else if (subgroup === 'functions') {
            this.functionsItem = {
              title: p.name || "Funciones",
              short_description: p.short_description || "",
              description: p.large_description_html || "",
              pageId: p.id
            };
          } else if (subgroup === 'historical_review') {
            this.historyItem = {
              title: p.name || "Reseña Historica",
              short_description: p.short_description || "",
              description: p.large_description_html || "",
              pageId: p.id
            };
            // Use uploaded section image if available
            if (p.section_image_url) {
              this.historyImageUrl = p.section_image_url;
            }
          }
        });

        // Map team members
        const director = nosotrosPages.find(p => p.subgroup === 'director');
        const subDirector = nosotrosPages.find(p => p.subgroup === 'sub_director');
        const headDivision = nosotrosPages.find(p => p.subgroup === 'head_division');

        const mapTeam = (p, defaultItem) => {
          if (!p) return defaultItem;
          const rawDescription = p.large_description_html || defaultItem.description;
          return {
            image: p.team_image_url || defaultItem.image,
            title: p.name || defaultItem.title,
            subtitle: p.short_description || defaultItem.subtitle,
            description: cleanActionTextHtml(rawDescription),
            pageId: p.id
          };
        };

        this.teamItems = [
          mapTeam(subDirector, this.defaultTeamItems[0]),
          mapTeam(director, this.defaultTeamItems[1]),
          mapTeam(headDivision, this.defaultTeamItems[2])
        ];

        // Map infogram image
        const infogramPage = nosotrosPages.find(p => p.subgroup === 'infogram');
        if (infogramPage && infogramPage.infogram_image_url) {
          this.infogramImageUrl = infogramPage.infogram_image_url;
        }

      } else {
        this.teamItems = this.defaultTeamItems;
      }
    },

    async openContentBar(item) {
      if (!item) return;
      
      this.currentTitle = item.title;
      this.currentDescription = item.description;
      this.isContentBarVisible = true;

      await this.$nextTick();

      if (item.pageId && this.$refs.sideRichText) {
        try {
          this.$refs.sideRichText.innerHTML = '';
          renderRichText({ 
            el: this.$refs.sideRichText, 
            pageId: item.pageId,
            initialHtml: item.description || '',
            sanitize: false 
          });
        } catch (e) {
          console.error("Error cargando rich text", e);
        }
      }
    },

    closeContentBar() {
      this.isContentBarVisible = false;
    }
  }
};
</script>
<style scoped>
* {
  font-family: museo-sans;
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
    url("../assets/img/nubes.png");
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

p {
  color: #fff;
  font-size: 20px;
  font-weight: 300;
  line-height: 1.6;
  text-align: justify;
  margin-bottom: 20px;
}

h3 {
  text-align: center;
  font-weight: 100;
  margin: 10px 0;
}

.row-about {
  display: flex;
  justify-content: center;
  gap: 100px;
}

.objetivos {
  width: 70%;
  margin: auto;
  padding-top: 150px;
}

.about-col {
  flex-basis: 50%;
}

.about-col img {
  width: 100%;
}

.about-col p {
  color: black;
  text-align: left;
  font-weight: 500;
}

.about-col h1 {
  padding-top: 0;
  text-align: left;
  font-weight: 700;
}

.hero-btn {
  display: inline-block;
  text-decoration: none;
  color: #000000;
  border: 1px solid #000000;
  padding: 5px 23px;
  background: transparent;
  position: relative;
  cursor: pointer;
  border-radius: 50px;
}

.hero-btn:hover {
  border: 1px solid #01695b;
  background: #01695b;
  transition: 1s;
}

.btn-container {
  text-align: left;
}

.drawer-enter-active,
.drawer-leave-active {
  transition: transform 1s ease, opacity 1s ease;
}

.drawer-enter,
.drawer-leave-to {
  transform: translateX(100%);
  opacity: 0;
}

.menu-content h1 {
  width: 80%;
  margin: auto;
  color: #01695b;
  text-align: left;
  padding-top: 10px;
  padding-bottom: 30px;
}

.layer:hover .menuItems {
  background: #01695b;
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

.image {
  max-width: 300px;
  margin-left: 20px;
  padding-right: 20px;
  padding-bottom: 50px;
}

.organigrama {
  width: 90%;
  height: 90%;
  padding-bottom: 100px;
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

.valores {
  font-weight: 700;
  line-height: 1em;
  font-family: "museo-sans";
  padding-bottom: 20px;
  margin: 0 auto;
  padding-bottom: 50px;
  padding-top: 100px;
}

.card-container {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 20px;
  margin: 20px;
  width: 80%;
  margin: 20px auto;
}

.card {
  width: 23%;
  background-color: #e7e7e7;
  padding: 20px;
  border-radius: 15px;
  text-align: center;
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.card:hover {
  transform: translateY(-10px);
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
}

.card .icon {
  flex-shrink: 0;
}

.card .icon img {
  width: 40px;
  height: 40px;
  object-fit: contain;
  transition: transform 0.3s ease;
}

.card .icon img:hover {
  transform: scale(1.1);
}

.card .title {
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 10px;
  color: black;
  flex-grow: 0;
}

.card .text {
  font-size: 14.5px;
  color: black;
  text-align: left;
  line-height: 1.5;
  flex-grow: 1;
}

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

.card-container {
  width: 100%;
  justify-content: center;
}

.card {
  width: 90%;
  margin-bottom: 20px;
}

.row-about {
  flex-direction: column;
  gap: 20px;
}

.about-col h1 {
  font-size: 1.5rem;
}

.objetivos {
  width: 90%;
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
  
  .about-col h1 {
    font-size: 1.3rem;
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

  .card-container {
    width: 85%;
  }

  .card {
    width: 45%;
  }

  .row-about {
    flex-direction: row;
    gap: 50px;
  }

  .about-col h1 {
    font-size: 2rem;
  }

  .objetivos {
    width: 75%;
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

  .card {
    width: 22%;
  }

  .row-about {
    gap: 80px;
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

  .row-about {
    gap: 100px;
  }

  .objetivos {
    width: 70%;
  }
}
</style>
