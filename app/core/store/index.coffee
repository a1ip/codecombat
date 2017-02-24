store = new Vuex.Store({
  strict: not application.isProduction()
  state: {
    pageErrors: []
  }
  mutations: {
    addPageError: (state, error) -> state.pageErrors.push(error)
    clearPageErrors: (state) -> state.pageErrors = []
  }
  modules: {
    me: require('./modules/me')
  }
})

module.exports = store
