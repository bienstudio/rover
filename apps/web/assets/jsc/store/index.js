import Vue from 'vue';
import Vuex from 'vuex';

import mobile from './modules/mobile';
import user from './modules/user';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: [mobile, user],
  strict: true
});
