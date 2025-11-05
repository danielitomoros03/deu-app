<template>
  <div class="card-section">
    <div class="row-cards">
      <div class="text-content">
        <h1>{{ title }}</h1>
        <p>{{ description }}</p>
        <div class="btn-container" v-if="buttonText && buttonLink">
          <a :href="buttonLink" class="hero-btn">{{ buttonText }}</a>
        </div>
      </div>
      <div class="cards-container">
        <div
          class="card-col"
          v-for="(item, index) in items"
          :key="index"
        >
          <div class="image-wrapper">
            <img :src="item.image" :alt="item.alt" />
          </div>
          <div class="card-text">
            <h3>{{ item.title }}</h3>
            <p>{{ item.description }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "CardSection",
  props: {
    title: {
      type: String,
      required: true,
    },
    description: {
      type: String,
      required: true,
    },
    buttonText: {
      type: String,
      default: "",
    },
    buttonLink: {
      type: String,
      default: "#",
    },
    items: {
      type: Array,
      required: true,
      validator: (items) => {
        return items.every(
          (item) =>
            item.hasOwnProperty("image") &&
            item.hasOwnProperty("alt") &&
            item.hasOwnProperty("title") &&
            item.hasOwnProperty("description")
        );
      },
    },
  },
};
</script>

<style scoped>
* {
  font-family: museo-sans;
}

.card-section {
  width: 80%;
  margin: auto;
  text-align: center;
  padding-top: 50px;
  padding-bottom: 100px;
}

.row-cards {
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

.card-col {
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
  height: 400px;
}

.card-col:hover {
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
  transform: translateY(-5px);
}

.image-wrapper {
  width: 100%;
  height: 200px;
  overflow: hidden;
}

.card-col img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.card-col:hover img {
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
  .card-section {
    width: 90%;
  }
  
  .row-cards {
    flex-direction: column;
    gap: 40px;
  }
  
  .text-content,
  .cards-container {
    flex-basis: 100%;
  }
  
  .card-col {
    flex-basis: calc(50% - 15px);
  }
}

@media (max-width: 768px) {
  .card-section {
    width: 95%;
    padding-top: 30px;
    padding-bottom: 50px;
  }
  
  .cards-container {
    gap: 20px;
  }
  
  .card-col {
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
