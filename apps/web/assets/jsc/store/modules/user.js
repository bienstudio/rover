const state = {
  user: {}
};

const getters = {
  user: state => state.user,
  loggedIn: state => state.user != {}
};

const mutations = {
  setUser (state, user) {
    state.user = user;
  }
};

const actions = {
  setUser ({ dispatch }, user) {
    dispatch('SET_USER', user)
  }
};

export default {
  state,
  getters,
  mutations,
  actions
};
