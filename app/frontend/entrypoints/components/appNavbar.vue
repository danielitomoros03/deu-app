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
            <a class="nav-link" href="/about">Nosotros</a>
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
                <a class="dropdown-item" href="/programas2">Programas Regionales</a>
              </li>
              <li>
                <a class="dropdown-item" href="/programas3">Proyectos, Productos y Servicios</a>
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
                <a class="dropdown-item" href="/departamentos1">Relaciones Interinstitucionales</a>
              </li>
              <li>
                <a class="dropdown-item" href="/departamentos2">Extensión Social Universitaria</a>
              </li>
              <li>
                <a class="dropdown-item" href="/departamentos3">Educacíon Continua y Permanente</a>
              </li>
              <li>
                <a class="dropdown-item" href="/programas1">Division Programas y Proyectos</a>
              </li>
            </ul>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="/grupos">Grupos Extensión</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/espacios">Espacios</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/certificaciones">Certificaciones</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/contactos">Contáctanos</a>
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
