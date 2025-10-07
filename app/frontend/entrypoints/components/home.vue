<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <button @click="count++">Clicks: {{ count }}</button>
  </div>
</template>

<script setup>
    import { ref } from 'vue'

    const message = ref('¡Hola desde Vue!')
    const count = ref(0)
</script>

<style scoped>
    .home {
        padding: 20px;
    }
</style>