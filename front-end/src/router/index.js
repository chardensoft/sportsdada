import Vue from 'vue'
import VueRouter from 'vue-router'
import Content from '../views/Content.vue'
import About from '../views/About.vue'
import Powder from '../views/Powder.vue'
import PowderStats2021 from '../views/PowderStats2021.vue'
import PowderStats2022 from '../views/PowderStats2022.vue'
import Player2021 from '../views/Player2021.vue'
import Player2022 from '../views/Player2022.vue'
import Standings2021 from '../views/Standings2021.vue'
import Standings2022 from '../views/Standings2022.vue'
import Game2021 from '../views/Game2021.vue'
import Game2022 from '../views/Game2022.vue'
import The101 from '../views/The101.vue'
import TeamStat2021 from '../views/TeamStat2021.vue'
import TeamStat2022 from '../views/TeamStat2022.vue'
import ESPN from '../views/ESPN.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'About',
    component: About
  },
  {
    path: '/PowderStats',
    name: 'PowderStats2022',
    component: PowderStats2022
  },
  {
    path: '/Entries',
    name: 'Content',
    component: Content
  },
  {
    path: '/PowderStats2021',
    name: 'PowderStats2021',
    component: PowderStats2021
  },
  {
    path: '/Player2021',
    name: 'Player2021',
    component: Player2021
  },
  {
    path: '/Standings2021',
    name: 'Standings2021',
    component: Standings2021
  },
  {
    path: '/PowderStats2022',
    name: 'PowderStats2022',
    component: PowderStats2022
  },
  {
    path: '/Player2022',
    name: 'Player2022',
    component: Player2022
  },
  {
    path: '/Standings2022',
    name: 'Standings2022',
    component: Standings2022
  },
  {
    path: '/Powder',
    name: 'Powder',
    component: Powder
  },
  {
    path: '/Game2021',
    name: 'Game2021',
    component: Game2021
  },
  {
    path: '/Game2022',
    name: 'Game2022',
    component: Game2022
  },
  {
    path: '/The101',
    name: 'The101',
    component: The101
  },
  {
    path: '/TeamStat2021',
    name: 'TeamStat2021',
    component: TeamStat2021
  },
  {
    path: '/TeamStat2022',
    name: 'TeamStat2022',
    component: TeamStat2022
  },
  {
    path: '/ESPN',
    name: 'ESPN',
    component: ESPN
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
