import Vue from 'vue';
import Vuex from 'vuex';

import mobile from './modules/mobile';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: [mobile],
  strict: true
});
