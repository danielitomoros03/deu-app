// Vue solo se carga cuando se necesita (Rails tradicional)
import { createApp } from 'vue'

// Importar componentes Vue
import Home from './components/home.vue'
// import ContactForm from './components/ContactForm.vue'
// import ImageSlider from './components/ImageSlider.vue'

// Función para montar componentes Vue específicos
function mountVueComponents() {
  // Montar componente Home si existe el contenedor
  const homeContainer = document.getElementById('vue-home')
  if (homeContainer) {
    const app = createApp(Home)
    app.mount('#vue-home')
  }

  // Montar otros componentes según sea necesario
  // const contactFormContainer = document.getElementById('vue-contact-form')
  // if (contactFormContainer) {
  //   const app = createApp(ContactForm)
  //   app.mount('#vue-contact-form')
  // }
}

// Ejecutar cuando el DOM esté listo
document.addEventListener('DOMContentLoaded', mountVueComponents)

// También ejecutar si el script se carga después del DOM
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', mountVueComponents)
} else {
  mountVueComponents()
}
