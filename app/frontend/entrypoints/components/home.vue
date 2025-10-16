<template>
  <div>
    <!-- MenuGlobal con los datos de DEUWEB -->
    <MenuGlobal :menuItems="menuItems" />
    
    <!-- DiplomadosCont -->
    <DiplomadosCont />
    
    <!-- Sección de números -->
    <section>
      <h1 class="numbers">Deu en Números</h1>
      <NumberC />
    </section>
  </div>
</template>

<script>
import MenuGlobal from './MenuGlobal.vue'
import DiplomadosCont from './DiplomadosCont.vue'
import NumberC from './NumberC.vue'

export default {
  name: 'Home',
  components: {
    MenuGlobal,
    DiplomadosCont,
    NumberC,
  },
  data() {
    return {
      menuItems: [
        {
          image: "/assets/L.png",
          icon: "/assets/lista.png",
          title: "ESPACIOS UNIVERSITARIOS",
          description: "Descubre cómo acceder y hacer uso de nuestras instalaciones para actividades académicas, culturales y recreativas, fomentando un entorno de aprendizaje e integración.",
          route: "/espacios-universitarios",
        },
        {
          image: "/assets/D.png",
          icon: "/assets/organizacion.png",
          title: "ESTRUCTURA ORGANIZATIVA",
          description: "Conoce la organización y funcionamiento de nuestra institución, diseñada para garantizar una gestión eficiente y una mejor experiencia académica y administrativa.",
          route: "/departamentos1",
        },
        {
          image: "/assets/P.png",
          icon: "/assets/proyecto.png",
          title: "CERTIFICACIONES Y AVALES",
          description: "Obtén reconocimientos oficiales que validan tu formación y experiencia, respaldados por nuestra institución y aliados estratégicos.",
          route: "/certificaciones-avales",
        },
      ],
    }
  }
}
</script>

<style scoped>
  .numbers {
    font-weight: 700;
    text-align: center;
    padding: 20px 0;
  }
</style>