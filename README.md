# In-memory-URL-shortener
Simple url shortener written in ruby &amp; sinatra. Just backend, nothing else.

## API
`POST /shorten`

Parameters: Parameter link should contain the link to shorten.
Returns: Id for the shortened link in text/plain format.

`GET /{id}`

Returns: 301 redirects the user agent to a previously stored URL. 404 error if no link stored with given id.
