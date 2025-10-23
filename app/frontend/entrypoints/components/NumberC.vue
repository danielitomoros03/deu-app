<template>
  <section ref="counterSection" class="counter-container">
    <div class="counter-item">
      <h2>{{ courses }}</h2>
      <p>Con Fines de Lucro</p>
    </div>
    <div class="counter-item">
      <h2>{{ students }}</h2>
      <p>Sin Fines de Lucro</p>
    </div>
    <div class="counter-item">
      <h2>{{ teachers }}</h2>
      <p>Gran Total</p>
    </div>
  </section>
</template>

<script>
export default {
  data() {
    return {
      courses: 0,
      students: 0,
      teachers: 0,
      startCount: false,
    };
  },
  mounted() {
    this.observeSection();
  },
  methods: {
    observeSection() {
      const observer = new IntersectionObserver(
        (entries) => {
          if (entries[0].isIntersecting && !this.startCount) {
            this.startCount = true;
            this.animateCount("courses", 1285, 2000);
            this.animateCount("students", 9776, 2000);
            this.animateCount("teachers", 11061, 2000);
          }
        },
        { threshold: 0.5 }
      );

      if (this.$refs.counterSection) {
        observer.observe(this.$refs.counterSection);
      }
    },
    animateCount(property, endValue, duration) {
      let startTime = null;

      const animate = (timestamp) => {
        if (!startTime) startTime = timestamp;
        let progress = timestamp - startTime;
        let increment = Math.min(progress / duration, 1) * endValue;
        this[property] = Math.floor(increment);

        if (progress < duration) {
          requestAnimationFrame(animate);
        } else {
          this[property] = endValue;
        }
      };

      requestAnimationFrame(animate);
    },
  },
};
</script>

<style scoped>
.counter-container {
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  padding: 50px;
  text-align: center;
}

.counter-item {
  font-size: 24px;
  font-weight: bold;
  color: #01695b;
}

h2 {
  font-size: 40px;
  margin: 0;
  color: #014d43;
}
@media (max-width: 768px) {
  .counter-item {
    font-size: 1rem;
  }
  h2 {
    font-size: 1.5rem;
  }
  .counter-container {
    flex-direction: column;
    padding: 10px;
  }
}
</style>
