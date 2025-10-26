<template>
  <div class="espacios">
    <div class="row-espacios">
      <div class="text-content">
        <h1>{{ title }}</h1>
        <p>{{ description }}</p>
        <div class="btn-container">
          <a :href="buttonLink" class="hero-btn">{{ buttonText }}</a>
        </div>
      </div>
      <div class="cards-container">
        <div
          class="espacio-col"
          v-for="(espacio, index) in espacios"
          :key="index"
        >
          <div class="image-wrapper">
            <img :src="espacio.image" :alt="espacio.alt" />
          </div>
          <div class="card-text">
            <h3>{{ espacio.title }}</h3>
            <p>{{ espacio.description }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import espacioPrueba1 from "../assets/img/espacioPrueba.jpg";
import espacioPrueba2 from "../assets/img/espacioPrueba2.jpg";
import espacioPrueba3 from "../assets/img/espacioPrueba3.jpg";

export default {
  name: "EspaciosCont",
  data() {
    return {
      title: "Explora nuestros Espacios Universitarios",
      description: `Explora nuestros espacios universitarios diseñados para potenciar tu conocimiento y desarrollo profesional en diversas áreas.`,
      buttonText: "Explorar ⇀",
      buttonLink: "#",
      espacios: [
        {
          image: espacioPrueba1,
          alt: "Espacio universitario 1",
          title: "MARKETING DIGITAL Y RRSS",
          description: "Aprende estrategias digitales para potenciar marcas.",
        },
        {
          image: espacioPrueba2,
          alt: "Espacio universitario 2",
          title: "ECOGRAFIA PULMONAR",
          description: "Domina el diagnóstico por ultrasonido pulmonar.",
        },
        {
          image: espacioPrueba3,
          alt: "Espacio universitario 3",
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

.espacios {
  width: 80%;
  margin: auto;
  text-align: center;
  padding-top: 50px;
  padding-bottom: 100px;
}

.row-espacios {
  margin-top: 5%;
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
}

.text-content {
  flex-basis: 30%;
  text-align: left;
}

.text-content h1 {
  font-weight: 700;
  margin-bottom: 20px;
  font-size: 2rem;
}

.text-content p {
  font-size: 18px;
  line-height: 1.6;
  margin-bottom: 30px;
  color: #333;
}

.hero-btn {
  display: inline-block;
  text-decoration: none;
  color: #000000;
  border: 1px solid #000000;
  padding: 12px 34px;
  font-size: 14px;
  background: transparent;
  cursor: pointer;
  border-radius: 50px;
  transition: all 0.3s ease;
}

.hero-btn:hover {
  background: #01695b;
  color: white;
  border-color: #01695b;
}

.cards-container {
  flex-basis: 65%;
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  justify-content: space-between;
}

.espacio-col {
  position: relative;
  flex-basis: calc(33.333% - 20px);
  text-align: left;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
  border-radius: 8px;
  transition: box-shadow 0.3s ease;
  background: white;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  height: 400px; /* Altura fija para consistencia */
}

.espacio-col:hover {
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
  transform: translateY(-5px);
}

.image-wrapper {
  width: 100%;
  height: 200px; /* Altura fija para las imágenes */
  overflow: hidden;
}

.espacio-col img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.espacio-col:hover img {
  transform: scale(1.05);
}

.card-text {
  padding: 20px;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.card-text h3 {
  font-size: 16px;
  margin-bottom: 10px;
  color: #000000;
  font-weight: 700;
  text-align: left;
  line-height: 1.3;
}

.card-text p {
  font-size: 14px;
  color: #333;
  text-align: left;
  line-height: 1.4;
  margin: 0;
}

/* Responsive */
@media (max-width: 1024px) {
  .espacios {
    width: 90%;
  }
  
  .row-espacios {
    flex-direction: column;
    gap: 40px;
  }
  
  .text-content,
  .cards-container {
    flex-basis: 100%;
  }
  
  .espacio-col {
    flex-basis: calc(50% - 15px);
  }
}

@media (max-width: 768px) {
  .espacios {
    width: 95%;
    padding-top: 30px;
    padding-bottom: 50px;
  }
  
  .cards-container {
    gap: 20px;
  }
  
  .espacio-col {
    flex-basis: 100%;
    height: auto;
    min-height: 350px;
  }
  
  .text-content h1 {
    font-size: 1.5rem;
  }
  
  .text-content p {
    font-size: 16px;
  }
}
</style>