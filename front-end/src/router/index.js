import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Content from '../views/Content.vue'
import About from '../views/About.vue'
import Powder from '../views/Powder.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Content',
    component: Content
  },
  {
    path: '/About',
    name: 'About',
    component: About
  },
  {
    path: '/Content',
    name: 'Content',
    component: Content
  },
  {
    path: '/Powder',
    name: 'Powder',
    component: Powder
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
