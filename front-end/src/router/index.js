import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Content from '../views/Content.vue'
import About from '../views/About.vue'
import Powder from '../views/Powder.vue'
import PowderStats from '../views/PowderStats.vue'
import Player from '../views/Player.vue'
import Team from '../views/Team.vue'
import Game from '../views/Game.vue'

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
    path: '/PowderStats',
    name: 'PowderStats',
    component: PowderStats
  },
  {
    path: '/Player',
    name: 'Player',
    component: Player
  },
  {
    path: '/Team',
    name: 'Team',
    component: Team
  },
  {
    path: '/Powder',
    name: 'Powder',
    component: Powder
  },
  {
    path: '/Game',
    name: 'Game',
    component: Game
  },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
