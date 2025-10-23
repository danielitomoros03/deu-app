<template>
  <div class="diplomados">
    <div class="row-diplo">
      <div class="text-content">
        <h1>{{ title }}</h1>
        <p>{{ description }}</p>
        <div class="btn-container">
          <a :href="buttonLink" class="hero-btn">{{ buttonText }}</a>
        </div>
      </div>
      <div class="cards-container">
        <div
          class="diplo-col"
          v-for="(diplomado, index) in diplomados"
          :key="index"
        >
          <img :src="diplomado.image" :alt="diplomado.alt" />
          <div class="card-text">
            <h3>{{ diplomado.title }}</h3>
            <p>{{ diplomado.description }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "DiploCont",
  data() {
    return {
      title: "Conoce Nuestros Diplomados",
      description: `Explora nuestra oferta académica diseñada para potenciar tu conocimiento y desarrollo profesional en diversas áreas.`,
      buttonText: "Explorar ⇀",
      buttonLink: "#",
      diplomados: [
        {
          image: require("../assets/img/marketing.png"),
          alt: "Descripción de la imagen de marketing",
          title: "MARKETING DIGITAL Y RRSS",
          description: "Aprende estrategias digitales para potenciar marcas.",
        },
        {
          image: require("../assets/img/medicine.jpeg"),
          alt: "Descripción de la imagen de medicina",
          title: "ECOGRAFIA PULMONAR",
          description: "Domina el diagnóstico por ultrasonido pulmonar.",
        },
        {
          image: require("../assets/img/programer.jpeg"),
          alt: "Descripción de la imagen de programación",
          title: "COMPUTACION DE ALTO RENDIMIENTO",
          description: "Optimiza el rendimiento de sistemas computacionales.",
        },
      ],
    };
  },
};
</script>

<style scoped>
* {
  font-family: museo-sans;
}
h1 {
  font-weight: 700;
}
a {
  color: #000000;
}
p {
  font-size: 20px;
}
.diplomados {
  width: 80%;
  margin: auto;
  text-align: center;
  padding-top: 50px;
  padding-bottom: 100px;
}

.row-diplo {
  margin-top: 5%;
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
}

.text-content {
  flex-basis: 30%;
  text-align: left;
}
.hero-btn {
  border: 1px solid black;
  padding: 5px 23px;
}

.cards-container {
  flex-basis: 65%;
  display: flex;
  flex-wrap: wrap;
  gap: 2%;
}

.diplo-col {
  position: relative;
  flex-basis: 30%;
  text-align: left;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
  border-radius: 8px;
  transition: box-shadow 0.3s ease;
  background: white;
  overflow: hidden;
}
.diplo-col:hover {
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
}
.diplo-col img {
  width: 100%;
  object-fit: cover;
  height: 30vh;
}

.card-text {
  padding: 15px;
  text-align: center;
}

.card-text h3 {
  font-size: 15px;
  margin-bottom: 10px;
  color: #000000;
  font-weight: 700;
  text-align: left;
}

.card-text p {
  font-size: 14px;
  color: black;
  text-align: left;
  line-height: 1.4;
}

@media (max-width: 1024px) {
  .row-diplo {
    flex-direction: column;
    gap: 30px;
  }
  .text-content,
  .cards-container {
    flex-basis: 100%;
  }
  .diplo-col {
    flex-basis: 100%;
  }
}
@media (max-width: 768px) {
  .cards-container {
    gap: 30px;
  }
  .row-diplo {
    flex-direction: column;
    gap: 30px;
  }
  .text-content,
  .cards-container {
    flex-basis: 100%;
  }
  .diplo-col {
    flex-basis: 100%;
  }
  h1 {
    font-size: 1.5rem;
  }
  p {
    font-size: 1rem;
  }
}
</style>
