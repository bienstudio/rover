const state = {
  mobile: true
};

const getters = {
  mobile () { return state.mobile; }
};

const mutations = {
  handleResize (state) {
    state.mobile = document.documentElement.clientWidth <= 960;
  }
};

const actions = {
  handleResize (context) {
    context.commit('handleResize');
  }
};

export default {
  state,
  getters,
  mutations,
  actions
};
