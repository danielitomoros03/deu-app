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
    
    <CardSection
      :title="diplomadosData.title"
      :description="diplomadosData.description"
      :buttonText="diplomadosData.buttonText"
      :buttonLink="diplomadosData.buttonLink"
      :items="diplomadosData.items"
    />
    
    <section>
      <h1 class="numbers">DEU en Números</h1>
      <NumberC />
    </section>
  </div>
</template>

<script>
import MenuGlobal from "../components/MenuGlobal.vue";
import CardSection from "../components/CardSection.vue";
import NumberC from "../components/NumberC.vue";

import mercy3 from "../assets/img/mercy3.jpeg";
import L from "../assets/img/L.png";
import lista from "../assets/img/lista.png";
import Dimg from "../assets/img/D.png";
import org from "../assets/img/organizacion.png";
import Pimg from "../assets/img/P.png";
import pro from "../assets/img/proyecto.png";

import marketingImg from "../assets/img/marketing.png";
import medicineImg from "../assets/img/medicine.jpeg";
import programerImg from "../assets/img/programer.jpeg";

export default {
  name: "HomeView",
  components: {
    MenuGlobal,
    CardSection,
    NumberC,
  },
  data() {
    return {
      // Datos estáticos para diplomados
      diplomadosData: {
        title: "Conoce Nuestros Diplomados",
        description: "Explora nuestra oferta académica diseñada para potenciar tu conocimiento y desarrollo profesional en diversas áreas.",
        buttonText: "Explorar ⇀",
        buttonLink: "#",
        items: [
          {
            image: marketingImg,
            alt: "Descripción de la imagen de marketing",
            title: "MARKETING DIGITAL Y RRSS",
            description: "Aprende estrategias digitales para potenciar marcas.",
          },
          {
            image: medicineImg,
            alt: "Descripción de la imagen de medicina",
            title: "ECOGRAFIA PULMONAR",
            description: "Domina el diagnóstico por ultrasonido pulmonar.",
          },
          {
            image: programerImg,
            alt: "Descripción de la imagen de programación",
            title: "COMPUTACION DE ALTO RENDIMIENTO",
            description: "Optimiza el rendimiento de sistemas computacionales.",
          },
        ],
      },
      // Imágenes para los menús (estáticas)
      menuImages: {
        view1: L,
        view2: Dimg,
        view3: Pimg
      },
      menuIcons: {
        view1: lista,
        view2: org,
        view3: pro
      },
      // Menu items se cargarán desde los datos de Rails
      dynamicMenuItems: []
    };
  },
  mounted() {
    this.loadMenuData();
  },

  methods: {
    
loadMenuData() {
  console.log("=== CARGANDO DATOS DESDE RAILS ===");
  
  // Obtener datos de Rails
  const inicioPages = window.gon?.inicio_pages || [];
  console.log("Páginas recibidas:", inicioPages);

  // Si tenemos exactamente 3 páginas, usarlas
  if (inicioPages.length >= 3) {
    console.log("✓ Usando datos dinámicos de Rails (3 páginas encontradas)");
    
    // Ordenar por subgroup para asegurar el orden correcto
    const sortedPages = inicioPages.sort((a, b) => {
      const order = { 'view1': 1, 'view2': 2, 'view3': 3 };
      return order[a.subgroup] - order[b.subgroup];
    });
    
    this.dynamicMenuItems = sortedPages.map(page => {
      let image, icon, route;
      
      switch(page.subgroup) {
        case 'view1':
          image = this.menuImages.view1;
          icon = this.menuIcons.view1;
          route = "/espacios-universitarios";
          break;
        case 'view2':
          image = this.menuImages.view2;
          icon = this.menuIcons.view2;
          route = "/departamentos1";
          break;
        case 'view3':
          image = this.menuImages.view3;
          icon = this.menuIcons.view3;
          route = "/certificaciones-y-avales";
          break;
        default:
          image = this.menuImages.view1;
          icon = this.menuIcons.view1;
          route = "#";
      }
      
      return {
        image: image,
        icon: icon,
        title: page.name,
        description: page.short_description,
        route: route
      };
    });
  } else {
    console.log("✗ Datos incorrectos, usando valores por defecto. Páginas recibidas:", inicioPages.length);
    this.dynamicMenuItems = this.getDefaultMenuItems();
  }
  
  console.log("Menu items finales:", this.dynamicMenuItems);
},
    
    getDefaultMenuItems() {
      return [
        {
          image: this.menuImages.view1,
          icon: this.menuIcons.view1,
          title: "ESPACIOS UNIVERSITARIOS",
          description: "Descubre cómo acceder y hacer uso de nuestras instalaciones...",
          route: "/espacios-universitarios",
        },
        {
          image: this.menuImages.view2,
          icon: this.menuIcons.view2,
          title: "ESTRUCTURA ORGANIZATIVA",
          description: "Conoce la organización y funcionamiento de nuestra institución, diseñada para garantizar una gestión eficiente y una mejor experiencia académica y administrativa.",
          route: "/departamentos1",
        },
        {
          image: this.menuImages.view3,
          icon: this.menuIcons.view3,
          title: "CERTIFICACIONES Y AVALES",
          description: "Obtén reconocimientos oficiales que validan tu formación y experiencia, respaldados por nuestra institución y aliados estratégicos.",
          route: "/certificaciones-y-avales",
        },
      ];
    }
  },
};
</script>

<style>
/* Tus estilos existentes se mantienen igual */
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
@media (max-width: 768px) {
  .text-box h1 {
    font-size: 2.5em;
  }
  .text-box {
    width: 90%;
  }
  .header {
    height: 80vh;
  }
  .numbers {
    font-size: 1.5rem;
  }
}
</style>