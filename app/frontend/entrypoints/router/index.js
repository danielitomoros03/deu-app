import { createRouter, createWebHashHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView
  },
  {
    path: "/about",
    name: "about",
    component: () => import("../views/AboutView.vue"),
    },
    {
      path: "/departamentos1",
      name: "departamentos1",
      component: () => import("../views/Departamento1View.vue"),
      }
  /* Add more routes here ,
  {
    path: "/departamentos2",
    name: "departamentos2",
    component: () => import("../views/Departamento2View.vue"),
  },
  {
    path: "/departamentos3",
    name: "departamentos3",
    component: () => import("../views/Departamento3View.vue"),
  },
  {
    path: "/programas1",
    name: "programas1",
    component: () => import("../views/Programas1View.vue"),
  },
  {
    path: "/programas2",
    name: "programas2",
    component: () => import("../views/Programas2View.vue"),
  },
  {
    path: "/programas3",
    name: "programas3",
    component: () => import("../views/Programas3View.vue"),
  },
  {
    path: "/contactos",
    name: "contactos",
    component: () => import("../views/ContactoView.vue"),
  },
  */
];

const router = createRouter({
  history: createWebHashHistory(),
  routes,
});

export default router;
