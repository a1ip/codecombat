###
  Same interface as the normal fetch API, except that:
  
  * credentials are 'same-origin' by default
  * if a "json" option is included, the options are set up to
    properly submit the value as JSON data.
###
  
fetchWrapper = (url, options={}) ->
  if options.json
    options.headers ?= {}
    options.headers['content-type'] = 'application/json'
    options.body = JSON.stringify(options.json)
    delete options.json
  options.credentials ?= 'same-origin'
  return fetch(url, options)
  
module.exports = fetchWrapper
