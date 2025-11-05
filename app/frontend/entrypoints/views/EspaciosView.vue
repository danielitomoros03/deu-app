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
          Espacios Universitarios
          <span class="icon">🚀 </span>
        </h1>
        <div class="content-container">
          <div class="paragraphs">
            <p>
              Como parte del proceso de fortalezimiento de la vida universitaria, 
              se crea el Departamento de Espacios Universitarios, como unaunidad 
              de apoyo transversal, orientada a brindar los servicios integrales...
              .........
              .......
              .......
              
            </p>
            <h2>Misión</h2>
            <p>
              Promover la imagen institucional a nivel nacional mediante
              actividades educativas que impulsen la transformación social,
              utilizando medios comunicacionales y estrategias para la
              organización de eventos. Además, establecer y fortalecer
              relaciones interinstitucionales para ampliar el alcance de la
              universidad y generar sinergias que potencien sus proyectos de
              extensión.
            </p>
            <h2>Visión</h2>
            <p>
              Ser un departamento líder en la promoción de la extensión
              universitaria, reconocido por su capacidad de establecer alianzas
              estratégicas, fomentar la participación de la comunidad
              universitaria y organizar eventos que fortalezcan el vínculo entre
              la universidad y la sociedad.
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Reemplazando EspaciosCont con CardSection y pasando datos personalizados mediante props -->
    <CardSection
      :title="espaciosData.title"
      :description="espaciosData.description"
      :buttonText="espaciosData.buttonText"
      :buttonLink="espaciosData.buttonLink"
      :items="espaciosData.items"
    />

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

export default {
  name: "EspaciosView",
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
      espaciosData: {
        title: "Explora nuestros Espacios Universitarios",
        description: "Explora nuestros espacios universitarios diseñados para potenciar el desarrollo de tu vida académica.",
        buttonText: "Explorar ⇀",
        buttonLink: "#espacios",
        items: [
          {
            image: espacioPrueba1,
            alt: "Espacio universitario 1",
            title: "Espacio 1",
            description: "Pasillo.",
          },
          {
            image: espacioPrueba2,
            alt: "Espacio universitario 2",
            title: "Espacio 2",
            description: "Edificio.",
          },
          {
            image: espacioPrueba3,
            alt: "Espacio universitario 3",
            title: "Espacio 3",
            description: "Mural.",
          },
        ],
      },
      menuItems: [
        {
          image: Limg,
          title: "OBJETIVOS",
          subtitle: "",
          description:
            "Gestionar el establecimiento de relaciones con organizaciones públicas, privadas, comunitarias y del tercer sector, dentro de los planes estratégicos de la Dirección. Gestionar la comunicación dirigida a divulgar las actividades de la Dirección dentro y fuera de la Universidad, dentro de los planes estratégicos de la Dirección. Planificar, organizar y realizar eventos que impulsen la función de los demás departamentos y dentro de los planes estratégicos de la Dirección.",
        },
        {
          image: Dimg,
          title: "FUNCIONES",
          subtitle: "",
          description:
            "Elaborar y coordinar planes y programas de comunicación internos y externos para proyectar la imagen de la Dirección de Extensión Universitaria. Divulgar a la comunidad mediante los medios de comunicación, videos, notas de prensa, entrevistas, entre otros; los aportes y resultados de la gestión académica, investigación y extensión de la Dirección de Extensión Universitaria, toda vez que se evalúa el impacto que produce el servicio. Diseñar, coordinar y ejecutar la política de comunicación institucional, previamente aprobada por el equipo directivo. Diseñar las actividades de logística y protocolo pertinentes a los eventos de extensión dentro y fuera de las instancias de la Universidad. Mantener comunicación periódica con las Dependencias y Facultades de la Universidad, para proyectar la Dirección de Extensión Universitaria. Realizar estudios de mercadeo que midan la factibilidad de comercializar los productos. Asesorar y colaborar con el resto de las dependencias de la DEU en la preparación del material impreso para la divulgación de la gestión de extensión. Establecer alianzas estratégicas con las coordinaciones de extensión de las Facultades a fin de promover actividades educativas culturales en procura de satisfacer las necesidades de la comunidad. Fomentar la asociación con instituciones públicas y privadas a la realización de actividades educativas en beneficio de la comunidad. Elaborar una propuesta de protocolo para el establecimiento de acuerdos a nivel nacional e internacional. Las demás funciones que le confieren las leyes y reglamentos, normas y su supervisor inmediato.",
        },
        {
          image: Pimg,
          title: "CONTACTO",
          subtitle: "",
          description:
            "Coordinador: AGNEDY MATERANO. Tlf: (0212) 605-3908. Correo: deu.eventos.ucv.@gmail.com",
        },
      ],
    };
  },
  methods: {
    openDrawer() {
      this.isDrawerOpen = true;
    },
    closeDrawer() {
      this.isDrawerOpen = false;
    },
    openContentBar(title, description) {
      this.currentTitle = title;
      this.currentDescription = description;
      this.isContentBarVisible = true;
    },
    closeContentBar() {
      this.isContentBarVisible = false;
    },
  },
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
