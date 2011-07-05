plus = require './plus'
db = require './db/schema'

CRAWL_REST_TIME = 2 * 1000 # in milliseconds

# lets start with Mr. Zuckerberg (not sure if Google's fav or really #1)
crawlList = ['104560124403688998123']
crawledId = {}

# find the friends of a user and push them to crawlList
handleCircle = (profileId, data) ->
	crawledId[profileId] = true # yup, for practical purposes; considered

	# circle member info
	for cmi in data[0][2]
		csv = cmi.toString().split(',')
		id = csv[2].toString()
		name = csv[4].toString()

		console.log '[INFO] found ' + name
		crawlList.push id # push it hard
		saveUserInfo id

# handle the user's about data
handleInfo = (profileId, data) ->
	# full name
	info = data[1][2][4][3]
	# not sure if picasaweb album or (meme) gone wild
	if data[1][2][11][0][0]
		info += '; ' + data[1][2][11][0][0][1]
	db.plus.find {plusId: profileId}, (err, r) ->
		if r.length is 0
			i = new db.plus({plusId: profileId, info: info})
			i.save()

crawlFriends = (profileId) ->
	plus.get plus.circleUrl(profileId), profileId, handleCircle

saveUserInfo = (profileId) ->
	plus.get plus.infoUrl(profileId), profileId, handleInfo


crawlStep = () ->
	id = crawlList.shift()
	if not id
		console.log '[WARN] nothing left to crawl'
	if not crawledId[id]
		console.log '[INFO] crawling ' + id
		crawlFriends id

# crawlTrigger
setInterval crawlStep, CRAWL_REST_TIME
console.log 'crawling will begin'

