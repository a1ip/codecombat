RootView = require('./RootView')
store = require('core/store')

module.exports = class RootVue extends RootView
  VueComponent: null # set this

  afterRender: ->
    @vueComponent = new @VueComponent({
      el: @$el.find('#site-content-area')[0]
      store
    })
    super(arguments...)
