import Vue from 'vue'
import App from './App.vue'
import router from './router'
import titleMixin from './mixins/titleMixin'
import VueAnalytics from 'vue-analytics';


Vue.config.productionTip = false
Vue.mixin(titleMixin)
//and then use it in main.js
Vue.use(VueAnalytics, {
    id: 'UA-278706947-1',
    router
}

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
