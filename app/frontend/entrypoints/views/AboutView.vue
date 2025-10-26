<template>
  <div style="min-height: 100vh; width: 100%">
    <section class="sub-header">
      <h1>Sobre Nosotros</h1>
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
        <h1 class="titulo">Sobre Nosotros <span class="icon">🚀 </span></h1>
        <div class="content-container">
          <div class="paragraphs">
            <h2>Misión</h2>
            <p>
              Promover la transferencia de conocimientos y de tecnología, la
              acción social y la prestación de servicios para tener un impacto
              positivo en la sociedad, respondiendo a las necesidades del
              entorno y contribuyendo al desarrollo y bienestar de nuestra
              comunidad interna y externa.
            </p>
            <h2>Visión</h2>
            <p>
              Nos visualizamos como líderes en la promoción y gestión de la
              extensión universitaria, siendo reconocidos por nuestra
              contribución al desarrollo sostenible y la mejora de la calidad de
              vida de las personas en nuestra comunidad. Buscamos ser un
              referente en la generación y transferencia de conocimiento,
              estableciendo alianzas estratégicas con actores clave tanto a
              nivel nacional como internacional.
            </p>
          </div>
        </div>
      </div>
    </section>
    <section>
      <h1 class="valores">Nuestros Valores <span class="icon">🚀 </span></h1>
      <div class="card-container">
        <div class="card">
          <div class="icon">
            <img src="..\assets\img\compromiso.png" alt="Icono 1" />
          </div>
          <h3 class="title">COMPROMISO</h3>
          <p class="text">
            Con el crecimiento y desarrollo de nuestra comunidad. Trabajamos de
            manera responsable, ética y dedicada para brindar oportunidades de
            aprendizaje y desarrollo a todas las personas que forman parte de
            nuestra comunidad, tanto interna como externa.
          </p>
        </div>
        <div class="card">
          <div class="icon">
            <img src="..\assets\img\excelencia.png" alt="Icono 2" />
          </div>
          <h3 class="title">EXCELENCIA</h3>
          <p class="text">
            En todo lo que hacemos, desde la planificación y desarrollo de
            nuestros programas de extensión, hasta la atención que brindamos a
            colaboradores y participantes, nos esforzamos por ofrecer servicios
            de calidad y superar expectativas.
          </p>
        </div>
        <div class="card">
          <div class="icon">
            <img src="..\assets\img\innovacion.png" alt="Icono 3" />
          </div>
          <h3 class="title">INNOVACIÓN</h3>
          <p class="text">
            Fomentamos la creatividad y la innovación en la extensión
            universitaria. Buscamos nuevas formas de impactar positivamente a
            nuestra comunidad, utilizando herramientas tecnológicas,
            metodologías educativas innovadoras.
          </p>
        </div>
        <div class="card">
          <div class="icon">
            <img src="..\assets\img\colaboracion.png" alt="Icono 4" />
          </div>
          <h3 class="title">COLABORACIÓN</h3>
          <p class="text">
            Valoramos el trabajo en equipo y la colaboración con nuestros
            aliados. Reconocemos que juntos podemos lograr más y nos esforzamos
            por establecer alianzas estratégicas con actores clave tanto a nivel
            nacional como internacional.
          </p>
        </div>
      </div>
    </section>
    <section class="objetivos">
      <div class="row-about">
        <div class="about-col">
          <div class="about-container-img">
            <img src="..\assets\img\deuabout.png" />
          </div>
        </div>
        <div class="about-col">
          <h1>Funciones</h1>
          <p>
            La Dirección de Extensión Universitaria de la UCV trabaja para
            fortalecer el vínculo entre la universidad y la sociedad a través de
            programas que promueven el desarrollo social, cultural y educativo.
            A continuación, se detallan los objetivos y funciones que guían sus
            acciones en la proyección y el impacto comunitario.
          </p>
          <div class="btn-container">
            <button @click="showFuncionesContentBar = true" class="hero-btn">
              Conoce más ⇀
            </button>
            <ContentBar
              :isVisible="showFuncionesContentBar"
              title="FUNCIONES"
              description="Coordinar, ejecutar, organizar y asesorar en materia de
              extensión. Presidir el Consejo Central de Extensión. Coordinar, supervisar y evaluar las actividades de extensión de la
              Universidad. Mantener informado al Consejo Central de Extensión de los hechos
              relevantes del acontecer nacional e internacional que requieran la
              participación de la UCV. Representar a la Universidad en el Núcleo de Directores de
              Extensión del Consejo Nacional de Universidades. Representar a la DEU en los Consejos Centrales de las Dependencias
              Centrales, donde los hubiere. Desarrollar el plan estratégico de actividades de extensión que
              responda a la solución de la problemática nacional. Evaluar la factibilidad técnica y económica de los proyectos
              presentados a la Dirección. Elaborar y controlar la ejecución del presupuesto asignado. Establecer y promover la interacción con personalidades e
              instancias del Estado, Gobiernos Regionales, Locales, Universidades
              Nacionales, Gremios, Asociaciones, Organismos y Empresas vinculadas
              a la labor extensionista. Promover y desarrollar Convenios de Cooperación Interinstitucional
              nacionales e internacionales con el propósito de facilitar la
              ejecución de programas, proyectos y otras actividades de
              extensión. Mantener relación directa con los distintos entes de la
              Universidad, a fin de garantizar la presencia e imagen de la DEU en
              la UCV. Participar activamente en la promoción y divulgación de los logros,
              planes y proyectos de extensión de la UCV. Cumplir con las funciones que le sean señaladas en los Reglamentos
              y Normativas emanados del Consejo Universitario y por el
              Rector."
              @close="handleCloseFunciones"
            />
          </div>
        </div>
      </div>
    </section>
    <MenuBar :menuItems="menuItems" />
    <section class="objetivos">
      <div class="row-about">
        <div class="about-col">
          <div class="about-container-img">
            <img src="..\assets\img\IMAGEN_B.png" />
          </div>
        </div>
        <div class="about-col">
          <h1>Reseña Historica</h1>
          <p>
            La Dirección de Extensión Universitaria ha sido clave en la conexión
            entre la universidad y la sociedad, promoviendo proyectos de
            formación continua, cooperación y desarrollo comunitario. A lo largo
            de los años, ha fortalecido su compromiso con la educación y el
            progreso social, respondiendo a las necesidades del entorno.
          </p>
          <div class="btn-container">
            <button @click="showResenaContentBar = true" class="hero-btn">
              Conoce más ⇀
            </button>
            <ContentBar
              :isVisible="showResenaContentBar"
              title="RESEÑA HISTORICA"
              description="La Universidad Central de Venezuela (UCV), fundada en
              1721, es la institución de educación superior más antigua del país y
              se ha destacado por su compromiso con la docencia, la investigación
              y la extensión universitaria. En 1988, se
              estableció la Comisión de Extensión con el objetivo de impulsar las
              actividades de extensión universitaria y proponer acciones que
              promovieran la integración de todas las Facultades y Dependencias. Este esfuerzo inicial sentó las bases para una reestructuración más
              profunda que culminó el 11 de diciembre de 1995, cuando el Consejo
              Universitario aprobó la creación de la Coordinación Central de
              Extensión. Posteriormente, el 27 de noviembre de 2002, por decisión
              del Consejo Universitario, se le otorgó el rango de Dirección,
              consolidándose como la Dirección de Extensión Universitaria de la
              UCV. En noviembre de 2024, la Dirección de Extensión Universitaria celebró una jornada
              conmemorativa titulada Celebrando nuestra historia y con visión
              hacia el futuro, en el Aula Magna de la UCV. Este evento destacó
              los logros alcanzados y reafirmó el compromiso de la dirección con
              la formación, la gestión social y la innovación. A lo largo de su historia, la Dirección de Extensión Universitaria ha sido fundamental en la consolidación de la UCV como una institución comprometida con el desarrollo integral de la sociedad venezolana, promoviendo la educación continua y la participación activa en la resolución de los desafíos sociales y culturales del país."
              @close="handleCloseResena"
            />
          </div>
        </div>
      </div>
    </section>
    <img src="..\assets\img\f_organigrama.png" class="organigrama" />
  </div>
</template>

<script>
import AppNavbar from "../components/appNavbar.vue";
import ContentBar from "../components/content-bar.vue";
import MenuBar from "../components/MenuBar.vue";

import imgantonio from "../assets/img/imgantonio.jpg";
import imgmercy from "../assets/img/imgmercy.jpg";
import imgelizabeth from "../assets/img/imgelizabeth1.png";

export default {
  name: "AboutView",
  components: {
    AppNavbar,
    ContentBar,
    MenuBar,
  },
  data() {
    return {
      isDrawerOpen: false,
      // Variables de estado separadas para cada ContentBar
      showFuncionesContentBar: false,
      showResenaContentBar: false,
      menuItems: [
        {
          image: imgantonio,
          title: "Ing. José Antonio Fernández",
          subtitle: "Sub-Director",
          description:
            "Subdirector de la Dirección de Extensión Universitaria, enfocado en fortalecer las relaciones interinstitucionales y coordinar iniciativas que impulsen la innovación y el desarrollo.",
        },
        {
          image: imgmercy,
          title: "Prof. Mercy Ospina",
          subtitle: "Directora",
          description:
            "Directora de la Dirección de Extensión Universitaria, comprometida con la promoción del conocimiento y la acción social para generar un impacto positivo en la comunidad universitaria y la sociedad en general.",
        },
        {
          image: imgelizabeth,
          title: "Sra. Elizabeth Piña",
          subtitle: "Jefa de División",
          description:
            "Jefa de la División de Programas y Proyectos, responsable de la planificación, coordinación y supervisión de las actividades del equipo para asegurar la consecución de las metas operativas y estratégicas de la división.",
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
    beforeEnter(el) {
      el.style.transform = "translateX(100%)";
    },
    enter(el, done) {
      el.offsetHeight; // Trigger reflow
      el.style.transition = "transform 0.3s ease-in-out";
      el.style.transform = "translateX(0)";
      done();
    },
    leave(el, done) {
      el.style.transition = "transform 0.3s ease-in-out";
      el.style.transform = "translateX(100%)";
      done();
    },
    // Métodos para cerrar cada ContentBar individualmente
    handleCloseFunciones() {
      this.showFuncionesContentBar = false;
    },
    handleCloseResena() {
      this.showResenaContentBar = false;
    },
  },
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

@media (max-width: 1024px) {
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

  .hero-btn {
    font-size: 18px;
  }

  .icon {
    font-size: 3rem;
  }
}

@media (max-width: 768px) {
  .sub-header h1 {
    padding-left: 30px;
  }

  .card-container {
    justify-content: center;
    gap: 0;
    width: 100%;
  }

  .card {
    width: 70%;
    margin-bottom: 20px;
    padding: 15px;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
  }

  .card .icon {
    margin-bottom: 10px;
  }

  .card .icon img {
    width: 30px;
    height: 30px;
  }

  .card .title {
    font-size: 0.9rem;
    margin-bottom: 10px;
  }

  .card .text {
    font-size: 0.8rem;
    text-align: center;
    line-height: 1.4;
    flex-grow: 0;
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

  .paragraphs p {
    font-size: 1rem;
    text-align: left;
  }

  .hero-btn {
    font-size: 1rem;
  }

  .objetivos {
    padding-top: 50px;
    padding-bottom: 80px;
    width: 80%;
  }

  .breadcrumbs {
    margin-left: 10px;
  }

  .breadcrumbs a {
    font-size: 0.9rem;
    line-height: 1.5;
  }

  .mision-vision {
    padding: 20px 40px;
    width: 100%;
  }

  .sub-header {
    height: 20vh;
  }

  .row-about {
    gap: 0px;
  }
}
</style>
