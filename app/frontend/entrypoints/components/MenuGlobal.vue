<template>
  <div>
    <div class="menu-global">
      <div class="pentagon">
        <div class="row">
          <div v-for="(item, index) in menuItems" :key="index" class="menu-col">
            <a :href="item.route" class="menu-link">
              <img :src="item.image" />
              <div class="layer">
                <div class="text-box">
                  <img :src="item.icon" class="icon" />
                  <h3>{{ item.title }}</h3>
                  <p>{{ item.description }}</p>
                </div>
              </div>
            </a>
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
* {
  font-family: "museo-sans";
}

.image-principal {
  width: 100%;
  height: auto;
}

.menu-global {
  width: 100%;
  margin: 0 auto;
  text-align: center;
  overflow: hidden;
  position: relative;
  margin-top: -92px;
  z-index: 2;
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
  );
}

.row {
  display: flex;
  justify-content: flex-start;
  width: 100%;
  margin: 0;
  padding: 0;
}

.row .menu-col {
  flex: 1 0 33.33%;
  margin: 0;
  position: relative;
  overflow: hidden;
  padding-left: 0;
  padding-right: 0;
  height: 75vh;
}

.menu-col img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.menu-col {
  position: relative;
  height: 85vh;
}

.layer {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  padding: 0;
}

.layer:hover {
  background: rgba(0, 0, 0, 0.527);
}

.layer .text-box {
  width: 100%;
  color: #fff;
  font-size: 14px;
  top: 35%;
  left: 50%;
  transform: translateX(-50%);
  position: absolute;
  opacity: 1;
  transition: 0.5s;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.layer img.icon {
  width: 50px;
  height: 50px;
  margin-bottom: 10px;
  opacity: 1;
  transition: transform 0.5s, opacity 0.5s;
}

.layer:hover .text-box {
  top: 28%;
  opacity: 1;
}

.layer:hover img.icon {
  transform: scale(1.1);
  opacity: 1;
}

h3 {
  text-align: center;
  font-weight: 600;
  margin: 5px 0;
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
@media (min-width: 1025px) {
  .menu-global {
    margin-top: -110px;
  }
  .text-box p {
    font-size: 1rem;
  }
}

@media (min-width: 1400px) {
  .menu-global {
    margin-top: -130px;
  }
}

@media (min-width: 1800px) {
  .menu-global {
    margin-top: -150px;
  }
}

@media (max-width: 1024px) {
  .menu-global {
    margin-top: 0;
  }
  .pentagon {
    clip-path: none;
  }
  .row {
    flex-direction: column;
  }
  .menu-col {
    flex-basis: 100%;
    height: 50vw;
  }
  .menu-col img {
    height: 100%;
  }
}

@media (max-width: 768px) {
  .menu-global {
    margin-top: 0;
  }
  .pentagon {
    clip-path: none;
  }
  .row {
    flex-direction: column;
  }
  .menu-col {
    flex-basis: 100%;
    aspect-ratio: 1 / 1;
  }
  .menu-col img {
    height: 100%;
  }
  .text-box {
    padding-left: 20px;
    padding-right: 20px;
  }
  .text-box p {
    font-size: 1rem;
  }
  .layer .text-box {
    top: 25%;
  }
  .layer:hover .text-box {
    top: 15%;
  }
}
</style>