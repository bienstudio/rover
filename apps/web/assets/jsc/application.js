import Vue from 'vue';

import store from './store';

import App from './components/app.vue';
import TripTile from './components/trip-tile.vue';
import Trip from './components/trip.vue';

Vue.component('app');
Vue.component('trip-tile');
Vue.component('trip');

const root = new Vue({
  el: '#app',
  store,
  components: { App, TripTile, Trip }
});

root.$mount('#app');
