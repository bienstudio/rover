import Vue from 'vue';

import store from './store';

import App from './components/app.vue';

import Dropdown from './components/dropdown.vue';

import Trip from './components/trip.vue';

import TripItem from './components/trip-item.vue';
import ActivityItem from './components/activity-item.vue';

import Panel from './components/panel.vue';

Vue.component('app');
Vue.component('dropdown');
Vue.component('trip');
Vue.component('trip-item');
Vue.component('activity-item');
Vue.component('panel');

const root = new Vue({
  el: '#app',
  store,
  components: { App, Dropdown, Trip, TripItem, ActivityItem, Panel }
});

root.$mount('#app');
