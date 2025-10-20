# DEU-APP - Ruby on Rails + Vue.js Boilerplate

Aplicación web construida con Ruby on Rails en el backend y Vue.js en el frontend, integrados mediante Vite Rails.

## Tecnologías Principales

- **Backend**: Ruby on Rails 7.2.2
- **Frontend**: Vue.js 3 (Composition API)
- **Build Tool**: Vite (via vite_rails gem)

## Arquitectura del Proyecto

\`\`\`
deu-app/
├── app/
│   ├── controllers/          # Controladores Rails
│   ├── models/              # Modelos Rails
│   ├── views/
│   │   └── layouts/
│   │       └── application.html.erb  # Layout principal con Vite
│   └── frontend/entrypoints # Aplicación Vue.js
│       └── components/      # Componentes Vue reutilizables
├── config/
│   └── vite.json           # Configuración de Vite Rails
├── vite.config.js          # Configuración de Vite
└── package.json            # Dependencias Node.js
\`\`\`

## Instalación y Setup

### Prerrequisitos

- Ruby 3.1.2
- Node.js 18+ y npm
- PostgreSQL

### Pasos de Instalación

1. **Clonar el repositorio**
   \`\`\`bash
   git clone https://github.com/danielitomoros03/deu-app.git
   cd deu-app
   \`\`\`

2. **Instalar dependencias de Ruby**
   \`\`\`bash
   bundle install
   \`\`\`

3. **Instalar dependencias de Node.js**
   \`\`\`bash
   npm install
   \`\`\`

4. **Configurar base de datos**
   \`\`\`bash
   rake db:create
   rake db:migrate
   \`\`\`

5. **Iniciar servidores de desarrollo**
   
   En una terminal:
   \`\`\`bash
   bin/vite dev
   \`\`\`
   
   En otra terminal:
   \`\`\`bash
   rails server o rails s
   Alternativa: bundle exec rails server
   \`\`\`

6. **Acceder a la aplicación**
   
   Abre tu navegador en `http://localhost:3000`

## Desarrollo

### Estructura del Frontend

El código Vue.js estará en `app/frontend/`:

- **entrypoints/**: Archivos de entrada que Vite procesa
- **components/**: Componentes reutilizables 

### Agregar Nuevos Componentes Vue

1. Crea tu componente en `app/frontend/components/`
2. Impórtalo donde lo necesites
3. Los cambios se reflejan automáticamente con HMR

Ejemplo:
\`\`\`vue
<!-- app/frontend/components/MyButton.vue -->
<template>
  <button class="px-4 py-2 bg-blue-500 text-white rounded">
    <slot />
  </button>
</template>
\`\`\`


## Comandos Útiles

\`\`\`bash
# Desarrollo
bin/vite dev              # Inicia Vite dev server
rails server              # Inicia Rails server

# Build para producción
bin/vite build            # Compila assets de Vue

# Testing
rails test                # Tests de Rails
npm run test              # Tests de Vue (si están configurados)

# Linting
npm run lint              # ESLint para código Vue
\`\`\`

## Despliegue

### Preparación para Producción

1. **Compilar assets de Vue**
   \`\`\`bash
   bin/vite build
   \`\`\`

2. **Precompilar assets de Rails**
   \`\`\`bash
   rails assets:precompile
   \`\`\`

3. **Variables de entorno**
   
   Asegúrate de configurar:
   - `DATABASE_URL`
   - `SECRET_KEY_BASE`
   - Cualquier API key necesaria


### Vite no compila cambios

\`\`\`bash
# Reinicia el servidor de Vite
# Ctrl+C y luego:
bin/vite dev
\`\`\`


### Assets no cargan en producción

Asegúrate de ejecutar `bin/vite build` antes de desplegar.

## Recursos

- [Documentación de Vite Rails](https://vite-ruby.netlify.app/)
- [Vue.js 3 Docs](https://vuejs.org/)
- [Vue Router](https://router.vuejs.org/)
- [Pinia](https://pinia.vuejs.org/)
- [Rails Guides](https://guides.rubyonrails.org/)
