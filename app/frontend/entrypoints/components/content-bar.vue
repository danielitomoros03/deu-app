<template>
  <transition
    name="slide"
    @before-enter="beforeEnter"
    @enter="enter"
    @leave="leave"
  >
    <div class="content-bar" v-if="isVisible">
      <button class="close-button" @click="$emit('close')">X</button>
      <h2>{{ title }}</h2>
      <p
        class="description"
        v-html="formattedDescription"
        :style="{ columnCount: descriptionColumnCount }"
      ></p>
    </div>
  </transition>
</template>

<script>
export default {
  name: "ContentBar",
  props: {
    title: {
      type: String,
      required: true,
    },
    description: {
      type: String,
      required: true,
    },
    isVisible: {
      type: Boolean,
      required: true,
    },
  },
  computed: {
    formattedDescription() {
      return this.description
        .replace(/(\.\s+)/g, '.<br><span class="highlight-symbol">•</span> ') // Reemplaza puntos seguidos de espacio por el símbolo y salto
        .replace(/(\.\s*)$/, "."); // Asegura que el último punto no tenga salto de línea extra
    },
    descriptionColumnCount() {
      // Puedes simplificar la lógica para el column-count si siempre quieres 1 en pantallas pequeñas
      if (window.innerWidth <= 768) {
        return 1;
      } else {
        const threshold = 500; // Ajusta este valor para pantallas grandes
        return this.description.length > threshold ? 2 : 1;
      }
    },
  },
  methods: {
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
  },
};
</script>

<style scoped>
* {
  font-family: museo-sans;
}

.content-bar {
  position: fixed;
  top: 0;
  right: 0;
  width: 60%;
  height: 100%;
  background-image: url("../assets/img/fondo.png");
  box-shadow: -2px 0 5px rgba(0, 0, 0, 0.5);
  padding: 20px;
  overflow-y: auto;
  z-index: 1000;
  transform: translateX(100%);
  color: black;
}

/* Transición para apertura y cierre */
.slide-enter-active,
.slide-leave-active {
  transition: transform 0.3s ease-in-out;
}

.slide-enter,
.slide-leave-to /* .slide-leave-active en <2.1.8 */ {
  transform: translateX(0);
}

.slide-leave,
.slide-enter-to /* .slide-enter-active en <2.1.8 */ {
  transform: translateX(100%);
}

.close-button {
  position: absolute;
  top: 10px;
  left: 10px;
  font-size: 30px;
  border: none;
  cursor: pointer;
  background-color: #01695b;
  width: 50px;
  height: 50px;
  color: white;
  font-family: sans-serif;
}

.content-bar h2 {
  margin-top: 40px;
  padding-top: 40px;
  margin-bottom: 20px;
  padding-bottom: 30px;
  padding-left: 40px;
  border-bottom: 2px solid #000000;
  text-align: left;
  font-weight: 700;
}

.description {
  /* El column-count se controla dinámicamente o por el @media query */
  column-gap: 30px; /* Espacio entre las columnas (cuando hay 2) */
  padding: 20px;
  color: black;
  text-align: left;
}

@media (max-width: 768px) {
  .content-bar {
    width: 100%;
  }

  .description {
    column-count: 1; /* En pantallas pequeñas, la descripción siempre será de una sola columna */
  }
}

.content-bar p:first-of-type::before {
  content: "• "; /* Punto antes del primer párrafo */
  color: black;
}
</style>
