import Vue from 'vue'
import App from './App.vue'
import router from './router'
import titleMixin from './mixins/titleMixin'
import VueGtag from "vue-gtag"


Vue.config.productionTip = false
Vue.mixin(titleMixin)
Vue.use(VueGtag, {
  config: { id: "UA-278706947-1" },
  router
})


new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
