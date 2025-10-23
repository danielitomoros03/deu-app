<template>
  <div style="min-height: 100vh; width: 100%">
    <section class="header">
      <div class="text-box">
        <h1 class="animated-title">
          Dirección de Extensión <br />Universitaria
        </h1>
        <div class="headerbtn-container">
          <router-link to="/about" class="hero-btn"> Conoce Más ⇀ </router-link>
        </div>
      </div>
    </section>
    <MenuGlobal :menuItems="menuItems" />
    <DiploCont />
    <section>
      <h1 class="numbers">Deu en Números</h1>
      <NumberC />
    </section>
  </div>
</template>

<script>
import MenuGlobal from "../components/MenuGlobal.vue";
import DiploCont from "../components/DiplomadosCont.vue";
import NumberC from "../components/NumberC.vue";

export default {
  name: "HomeView",
  components: {
    MenuGlobal,
    DiploCont,
    NumberC,
  },
  data() {
    return {
      homeItems: [
        {
          image: require("../assets/img/mercy3.jpeg"),
          title: "Venezuela y la UCV son campeones del Pre-CMUDE Bogotá 2024",
        },
        {
          image: require("../assets/img/mercy3.jpeg"),
          title:
            "DEU y la Jefatura de Protocolo dictaron Taller de Unificación de Criterios Protocolares",
        },
        {
          image: require("../assets/img/mercy3.jpeg"),
          title: "DEU y aliados se unen al Proyecto de Tacarigua",
        },
      ],
      menuItems: [
        {
          image: require("@/assets/img/L.png"),
          icon: require("@/assets/img/lista.png"),
          title: "ESPACIOS UNIVERSITARIOS",
          description:
            "Descubre cómo acceder y hacer uso de nuestras instalaciones para actividades académicas, culturales y recreativas, fomentando un entorno de aprendizaje e integración.",
          route: "/espacios-universitarios", // Nueva propiedad para definir la ruta
        },
        {
          image: require("@/assets/img/D.png"),
          icon: require("@/assets/img/organizacion.png"),
          title: "ESTRUCTURA ORGANIZATIVA",
          description:
            "Conoce la organización y funcionamiento de nuestra institución, diseñada para garantizar una gestión eficiente y una mejor experiencia académica y administrativa.",
          route: "/departamentos1", // Nueva propiedad para definir la ruta
        },
        {
          image: require("@/assets/img/P.png"),
          icon: require("@/assets/img/proyecto.png"),
          title: "CERTIFICACIONES Y AVALES",
          description:
            "Obtén reconocimientos oficiales que validan tu formación y experiencia, respaldados por nuestra institución y aliados estratégicos.",
          route: "/certificaciones-avales", // Nueva propiedad para definir la ruta
        },
      ],
    };
  },
};
</script>

<style>
* {
  font-family: museo-sans;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
.numbers {
  font-weight: 700;
}

/* Estilo para la sección de cabecera */
.header {
  height: 90vh;
  width: 100%;
  background-image: linear-gradient(rgba(0, 0, 0, 0.555), rgba(0, 0, 0, 0.555)),
    url("../assets/img/biblioteca.jpg");
  background-size: cover;
  background-position: center;
  position: relative;
}

/* Estilo para el texto dentro de la cabecera */
.text-box {
  width: 90%;
  color: #fff;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}

.text-box h1 {
  text-shadow: 2px 7px 4px rgba(0, 0, 0, 0.8);
  padding-bottom: 40px;
}

.text-box p {
  margin: 10px 0 40px;
  color: #fff;
}

.header .text-box p {
  text-align: left;
}

/* Animación de desvanecimiento y subida */
@keyframes fadeInSlide {
  0% {
    opacity: 0;
    transform: translateY(50px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}

.animated-title {
  font-size: 3em;
  text-align: center;
  animation: fadeInSlide 2s ease-out;
}

/* Botones en el header */
.hero-btn {
  display: inline-block;
  text-decoration: none;
  color: white;
  border: 1px solid white;
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

/* Estilo de los botones dentro del contenedor */
.headerbtn-container .hero-btn a {
  color: #fff;
  border: 1px solid #fff;
  text-align: left;
}

/* Media Queries */
/* Mi pantalla */

@media (max-width: 768px) {
  .text-box h1 {
    font-size: 2.5em;
  }
  .text-box {
    width: 90%;
  }
  .header {
    height: 80vh; /* Reducir la altura en móviles */
  }
  .numbers {
    font-size: 1.5rem;
  }
}
</style>
