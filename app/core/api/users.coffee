fetch = require './fetch'

module.exports = {
  getByHandle: (handle, options) ->
    fetch("/db/user/#{handle}", options)
}
