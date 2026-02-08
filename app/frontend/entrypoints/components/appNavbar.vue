<template>
  <nav
    class="navbar navbar-expand-md navbar-dark"
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
            <router-link class="nav-link" to="/about">Sobre Nosotros</router-link>
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
            <router-link class="nav-link" to="/grupos-de-extension"
              >Grupos Extensión</router-link
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/espacios-universitarios">Espacios Universitarios</router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/certificaciones-y-avales"
              >Certificaciones y Avales</router-link
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
/* Base Styles (Mobile first) */
.navbar {
  padding: 1rem 0;
}

.navbar-nav .nav-item {
  margin-right: 0;
  margin-bottom: 8px;
  text-align: center;
}

.nav-link {
  font-size: 1rem;
  transition: color 0.3s ease;
}

.dropdown-menu {
  background-color: #1a1a1a;
  border: 1px solid #333;
  text-align: center;
}

.dropdown-item {
  color: #fff;
  font-size: 0.95rem;
  padding: 8px 20px;
}

.dropdown-item:hover {
  background-color: #01695b;
  color: #fff;
}

/* BREAKPOINTS */

/* Mobile Small */
@media (max-width: 480px) {
  .nav-link {
    font-size: 0.9rem;
  }
  
  .dropdown-item {
    font-size: 0.85rem;
  }
}

/* Tablet and up */
@media (min-width: 768px) {
  .navbar-nav .nav-item {
    margin-bottom: 5px;
  }
  
  .nav-link {
    font-size: 1.05rem;
  }
}

/* Laptop and up */
@media (min-width: 1024px) {
  .navbar-nav {
    align-items: center;
  }
  
  .navbar-nav .nav-item {
    margin-right: 20px;
    margin-bottom: 0;
  }
  
  .nav-link {
    font-size: 1rem;
  }
  
  .dropdown-menu {
    text-align: left;
  }
}

/* Desktop and up */
@media (min-width: 1200px) {
  .navbar-nav .nav-item {
    margin-right: 35px;
  }
  
  .nav-link {
    font-size: 1.1rem;
  }
}
</style>
