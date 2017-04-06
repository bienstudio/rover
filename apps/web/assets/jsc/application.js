import Vue from 'vue';

import AppNav from './components/app-nav.vue';
import AppFooter from './components/app-footer.vue';
import Trip from './components/trip.vue';

Vue.component('app-nav');
Vue.component('app-footer');
Vue.component('trip');

const app = new Vue({
  components: { AppNav, AppFooter, Trip }
});

app.$mount('#app');
