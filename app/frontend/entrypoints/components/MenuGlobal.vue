<template>
  <div>
    <div class="menu-global">
      <div class="pentagon">
        <div class="row">
          <div v-for="(item, index) in menuItems" :key="index" class="menu-col">
            <router-link :to="item.route" class="menu-link">
              <img :src="item.image" />
              <div class="layer">
                <div class="text-box">
                  <img :src="item.icon" class="icon" />
                  <h3>{{ item.title }}</h3>
                  <p>{{ item.description }}</p>
                </div>
              </div>
            </router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "MenuGlobal",
  props: {
    menuItems: {
      type: Array,
      required: true,
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

.image-principal {
  width: 100%;
  height: auto; /* Ajusta la altura según sea necesario */
}

.menu-global {
  width: 100%;
  margin: 0 auto; /* Centra horizontalmente */
  text-align: center;
  overflow: hidden;
  position: relative;
  margin-top: -92px; /* Margen negativo por defecto. Ajusta este valor para un tamaño base */
  z-index: 2; /* Asegura que esté por encima de la imagen */
}

.pentagon {
  display: flex;
  justify-content: center;
  position: relative;
  clip-path: polygon(
    50% 0%,
    100% 18%,
    100% 100%,
    0% 100%,
    0% 18%
  ); /* Forma de pentágono */
}

.row {
  display: flex;
  justify-content: flex-start; /* Alinea las columnas a la izquierda */
  width: 100%;
  margin: 0; /* Elimina el margen */
  padding: 0; /* Asegúrate de que no haya padding */
}

.row .menu-col {
  flex: 1 0 33.33%; /* Crece para llenar el espacio, ocupando 1/3 del contenedor */
  margin: 0; /* Elimina el margen entre las columnas */
  position: relative;
  overflow: hidden;
  padding-left: 0;
  padding-right: 0;
  height: 75vh;
}

.menu-col img {
  width: 100%;
  height: 100%; /* Asegúrate de que se ajuste a tu imagen principal */
  object-fit: cover;
}

.menu-col {
  position: relative;
  height: 85vh; /* Ajusta según sea necesario */
}

.layer {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  padding: 0; /* Asegúrate de que no haya padding que esté afectando la posición */
}

.layer:hover {
  background: rgba(0, 0, 0, 0.527);
}

.layer .text-box {
  width: 100%;
  color: #fff;
  font-size: 14px;
  top: 35%; /* Ajustar según sea necesario para mover todo el contenedor de texto más arriba */
  left: 50%;
  transform: translateX(-50%);
  position: absolute;
  opacity: 1;
  transition: 0.5s;
  display: flex;
  flex-direction: column;
  align-items: center;
}

/* El icono ahora se mantiene siempre visible y se posiciona arriba del título y párrafo */
.layer img.icon {
  width: 50px; /* Tamaño del icono */
  height: 50px;
  margin-bottom: 10px; /* Espacio entre el icono y el título */
  opacity: 1; /* Icono siempre visible */
  transition: transform 0.5s, opacity 0.5s;
}

.layer:hover .text-box {
  top: 28%; /* Ajusta aquí también para que se mueva durante el hover */
  opacity: 1;
}

.layer:hover img.icon {
  transform: scale(1.1); /* Pequeña animación de aumento en hover */
  opacity: 1; /* Asegura que el icono siga visible en hover */
}

h3 {
  text-align: center;
  font-weight: 600;
  margin: 5px 0; /* Reducimos el margen para acercar más el título al icono */
  font-size: 20px;
}

p {
  color: #fff;
  font-size: 14px;
  font-weight: 300;
  line-height: 22px;
  padding: 10px;
}

.text-box {
  padding-left: 70px;
  padding-right: 70px;
}

/* Estilos responsivos */
/* Ajuste para pantallas grandes */
@media (min-width: 1025px) {
  .menu-global {
    margin-top: -110px; /* Ajusta este valor para pantallas de escritorio grandes */
  }
  .text-box p {
    font-size: 1rem;
  }
}

/* Ajuste para pantallas muy grandes */
@media (min-width: 1400px) {
  .menu-global {
    margin-top: -130px; /* Ajusta este valor para pantallas más grandes aún */
  }
}

/* Ajuste para pantallas extra grandes */
@media (min-width: 1800px) {
  .menu-global {
    margin-top: -150px; /* Ajusta este valor para pantallas extra grandes */
  }
}

/* Ajuste para iPad y pantallas medianas (ya existente, con una ligera modificación) */
@media (max-width: 1024px) {
  .menu-global {
    margin-top: 0; /* Elimina el margen negativo para que el menú no esté sobre la imagen */
  }

  .pentagon {
    clip-path: none; /* Elimina la forma de pentágono en pantallas más pequeñas */
  }

  .row {
    flex-direction: column;
  }

  .menu-col {
    flex-basis: 100%; /* Las columnas ocupan el 100% del ancho */
    height: 50vw; /* Mantén las columnas cuadradas usando ancho y alto iguales */
  }

  .menu-col img {
    height: 100%; /* Asegúrate de que las imágenes cubran completamente las cajas */
  }
}

@media (max-width: 768px) {
  /* Ajuste para móviles */
  .menu-global {
    margin-top: 0; /* Asegura que el menú no esté sobre la imagen */
  }

  .pentagon {
    clip-path: none; /* Elimina la forma de pentágono en móviles */
  }

  .row {
    flex-direction: column;
  }

  .menu-col {
    flex-basis: 100%; /* Ajusta a 100% en móviles */
    aspect-ratio: 1 / 1; /* Mantiene cuadrados los items en móviles */
  }

  .menu-col img {
    height: 100%; /* Asegúrate de que las imágenes cubran completamente las cajas */
  }
  .text-box {
    padding-left: 20px;
    padding-right: 20px;
  }
  .text-box p {
    font-size: 1rem;
  }
  .layer .text-box {
    top: 25%; /* Ajustar según sea necesario para mover todo el contenedor de texto más arriba */
  }
  .layer:hover .text-box {
    top: 15%; /* Ajusta aquí también para que se mueva durante el hover */
  }
}
</style>
