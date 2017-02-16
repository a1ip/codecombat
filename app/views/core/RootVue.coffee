RootView = require('./RootView')
store = require('core/store')

module.exports = class RootVue extends RootView
  VueComponent: null # set this
  vuexModule: null

  afterRender: ->
    if @vueComponent
      throw new Error('Do not render RootVue more than once.')

    if @vuexModule
      unless _.isFunction(@vuexModule)
        throw new Error('@vuexModule should be a function')
      store.registerModule('page', @vuexModule())
      
    @vueComponent = new @VueComponent({
      el: @$el.find('#site-content-area')[0]
      store
    })
    super(arguments...)

  destroy: ->
    store.unregisterModule('page')
