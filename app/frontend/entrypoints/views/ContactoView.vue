<template>
  <div style="min-height: 100vh; width: 100%">
    <section class="sub-header">
      <h1>Contacto</h1>
    </section>
    <AppNavbar />
    <section class="link-section">
      <nav class="breadcrumbs">
        <ul>
          <li>
            <router-link to="/"><span>🚀</span></router-link>
          </li>
          <li><router-link to="/contactos">Contacto</router-link></li>
        </ul>
      </nav>
    </section>
    <section class="section-container">
      <div class="mision-vision">
        <h1 class="titulo">
          Contáctanos
          <span class="icon">🚀 </span>
        </h1>
      </div>
    </section>
    <ContactForm />
  </div>
</template>

<script>
import ContactForm from "../components/ContactForm.vue";
import AppNavbar from "../components/appNavbar.vue";

export default {
  name: "Departamento1View",
  components: {
    ContactForm,
    AppNavbar,
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
  line-height: 1.6; /* Interlineado ajustado */
  text-align: justify; /* Justificar texto para mejor lectura */
  margin-bottom: 20px;
}

h3 {
  text-align: center;
  font-weight: 100;
  margin: 10px 0;
}
/* */
.row-about {
  display: flex;
  justify-content: center;
  gap: 100px;
}

.objetivos {
  width: 70%;
  margin: auto;
  padding-top: 150px;
  padding-bottom: 150px;
}

.about-col {
  flex-basis: 40%;
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

.drawer-enter, .drawer-leave-to /* .drawer-leave-active in <2.1.8 */ {
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
.image {
  max-width: 300px;
  margin-left: 20px;
  padding-right: 20px;
  padding-bottom: 50px;
}

.organigrama {
  width: 90%;
  height: 90%;
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

/** */
.valores {
  font-weight: 700;
  line-height: 1em;
  font-family: "museo-sans";
  padding-bottom: 20px;
  margin: 0 auto; /* Centra el contenido */
  padding-bottom: 50px; /* Espacio entre el título y la línea */
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
  width: 23%; /* Ajusta al 23% para que quepan 4 cards horizontalmente */
  background-color: #e7e7e7; /* Cambia el color si lo deseas */
  padding: 20px;
  border-radius: 15px; /* Borde más redondeado */
  text-align: center;
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Sombra más suave */
  transition: transform 0.3s ease, box-shadow 0.3s ease; /* Transiciones suaves */
  overflow: hidden;
  display: flex;
  flex-direction: column; /* Asegura que los elementos estén en columna */
  justify-content: space-between; /* Espacio distribuido entre los elementos */
}

.card:hover {
  transform: translateY(-10px); /* Efecto de elevar la tarjeta */
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3); /* Sombra más prominente */
}

.card .icon {
  flex-shrink: 0; /* No permite que el icono se reduzca */
}

.card .icon img {
  width: 40px; /* Tamaño ligeramente mayor para los iconos */
  height: 40px;
  object-fit: contain;
  transition: transform 0.3s ease;
}

.card .icon img:hover {
  transform: scale(1.1); /* Efecto de agrandar el icono al hacer hover */
}

.card .title {
  font-size: 20px; /* Título más grande */
  font-weight: 600;
  margin-bottom: 10px;
  color: black; /* Color de título más oscuro */
  flex-grow: 0; /* Evita que el título se estire */
}

.card .text {
  font-size: 14.5px;
  color: black; /* Color de texto un poco más suave */
  text-align: left;
  line-height: 1.5; /* Mayor altura de línea para mejor legibilidad */
  flex-grow: 1; /* Permite que el texto ocupe el espacio restante */
}
/**** */
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
