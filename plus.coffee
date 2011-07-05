https = require 'https'

# return the url corresponding the user info (About tab)
module.exports.infoUrl = (profileId) ->
	infoUrl = '/_/profiles/get/' + profileId

# return the url for user's circle lising (View all on user's circles)
module.exports.circleUrl = (profileId) ->
	circleUrl = '/_/socialgraph/lookup/visible/?o=[null,null,"' + profileId + '"]'

# an https GET request
# and some crappy response data manipulation
module.exports.get = (plusPath, profileId, callback) ->
	https.get {
		host: 'plus.google.com',
		path: plusPath
	}, (res) ->
		buffer = ''
		res.on 'data', (d) ->
			buffer += d.toString()
		res.on 'end', () ->
			singleline = buffer.replace(/\n/g, '')
			js = singleline.substring(4) # strip the security? stuff
			data = eval(js)
			callback profileId, data

