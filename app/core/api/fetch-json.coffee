###
  Same interface as the normal fetch API, except that:
  
  * credentials are 'same-origin' by default
  * if a "json" option is included, the options are set up to
    properly submit the value as JSON data.
  * if the response is json, it's parsed
  * if the response is an error, an error (plain) object is thrown
###
  
fetchWrapper = (url, options={}) ->
  if options.json
    options.headers ?= {}
    options.headers['content-type'] = 'application/json'
    options.body = JSON.stringify(options.json)
    delete options.json
  options.credentials ?= 'same-origin'
  
  return fetch(url, options).then (res) ->
    isJson = _.string.startsWith(res.headers.get('content-type'), 'application/json')
    if (res.status >= 400)
      if (isJson)
        # should be a standard server error response, see /server/commons/errors.coffee for schema
        return Promise.reject(res.json())
      else
        # old style (handler) raw text response. Wrap it in an object.
        return res.text().then (message) -> Promise.reject({message, code: res.status })
    return if isJson then res.json() else res.text()    
  
module.exports = fetchWrapper
