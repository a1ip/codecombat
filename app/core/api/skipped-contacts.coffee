fetch = require './fetch'

module.exports = {
  fetchAll: (options) ->
    fetch('/db/skipped-contact', options)

  put: (skippedContact, options) ->
    fetch("/db/skipped-contact/#{skippedContact._id}", _.assign({}, options, {
      method: 'PUT'
      json: skippedContact
    }))
}
