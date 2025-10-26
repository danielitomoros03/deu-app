<template>
  <nav
    class="navbar navbar-expand-lg navbar-dark"
    style="background-color: #000000"
  >
    <div class="container-fluid">
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNavDropdown"
        aria-controls="navbarNavDropdown"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div
        class="collapse navbar-collapse justify-content-center"
        id="navbarNavDropdown"
      >
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Inicio</a>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/about">Nosotros</router-link>
          </li>
          <!-- Dropdown PROGRAMAS -->
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdownProgramas"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              Programas
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdownProgramas">
              <li>
                <router-link class="dropdown-item" to="/programas2"
                  >Programas Regionales</router-link
                >
              </li>
              <li>
                <router-link class="dropdown-item" to="/programas3"
                  >Proyectos, Productos y Servicios</router-link
                >
              </li>
            </ul>
          </li>

          <!-- Dropdown DEPARTAMENTOS -->
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdownDepartamentos"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              Departamentos
            </a>
            <ul
              class="dropdown-menu"
              aria-labelledby="navbarDropdownDepartamentos"
            >
              <li>
                <router-link class="dropdown-item" to="/departamentos1"
                  >Relaciones Interinstitucionales</router-link
                >
              </li>
              <li>
                <router-link class="dropdown-item" to="/departamentos2"
                  >Extensión Social Universitaria</router-link
                >
              </li>
              <li>
                <router-link class="dropdown-item" to="/departamentos3"
                  >Educacíon Continua y Permanente</router-link
                >
              </li>
              <li>
                <router-link class="dropdown-item" to="/departamentos4"
                  >Division Programas y Proyectos</router-link
                >
              </li>
            </ul>
          </li>

          <li class="nav-item">
            <router-link class="nav-link" to="/grupos"
              >Grupos Extensión</router-link
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/espacios-universitarios">Espacios Universitarios</router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/certificaciones"
              >Certificaciones</router-link
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/contactos"
              >Contáctanos</router-link
            >
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
import { onMounted } from "vue";

export default {
  name: "AppNavbar",
  setup() {
    onMounted(() => {
      import("bootstrap/dist/js/bootstrap.bundle.min.js");
    });
  },
};
</script>

<style scoped>
/* Estilos para el logo */
.logo-navbar {
  height: 50px; /* Ajusta el tamaño del logo */
  width: auto;
  padding-left: 10%;
}
/* Espaciado entre los ítems de la barra de navegación */
.navbar-nav .nav-item {
  margin-right: 40px; /* Ajusta este valor según el espacio deseado */
}

/* Espaciado entre los ítems del menú desplegable */
.dropdown-menu .dropdown-item {
  margin-bottom: 10px; /* Ajusta este valor según el espacio deseado */
}

/* Ajusta el espaciado en dispositivos móviles también */
@media (max-width: 991.98px) {
  .navbar-nav .nav-item {
    margin-bottom: 10px; /* Ajusta este valor según el espacio deseado */
  }
}
</style>
