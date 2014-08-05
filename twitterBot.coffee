Twit     = require 'twit'
minimist = require 'minimist'

argv = minimist process.argv.slice(2), default:
	verbose: false
	config: './config.json'

getConfig = (path) ->
	if path[0] != '/' and path[0..1] != './'
		path = './' + path
	require(path)

respondToTweet = (T, status, tweet) ->
	console.log "responding to the tweet " + tweet.text
	console.log "response is " + status
	if status != "-1"
		T.post 'statuses/update', {status: status, in_reply_to_status_id:tweet.id_str}, (err) -> 
			console.log "tweet posted"

processTweet = (tweet) ->
	tweetTextIsOfWrongFormat = isOfWrongFromat tweet.text
	if tweetTextIsOfWrongFormat == true
		return "-1" 
	else
		solution = solve tweet.text
		response = "@" + tweet.user.screen_name + " " + solution
		console.log "processTweet response is " + response
		return response.substr 0,140

solve = (tweetText) ->
	# todo the actual function
	return ""

isOfWrongFromat = (tweetText) ->
	# todo check if the tweet text format is the one you are expecting, by default it returns false
	return false

main = ->
	config = getConfig argv.config
	T = new Twit config.account
	me = config.nick
	stream = T.stream 'user', {track: me}, (err) ->
		console.log err if err
	stream.on 'tweet', (tweet) ->
		console.log "stream tweet event"
		console.log tweet
		response = processTweet tweet # response must start with the twitter handle of the author of the tweet we are responding to
		respondToTweet T, response, tweet
	stream.on 'warning', (err) ->
		console.log "stream warning event"
	stream.on 'connect', (err) ->
		console.log "stream connect event"
	stream.on 'reconnect', (err) ->
		console.log "stream reconnect event"
	stream.on 'connected', (err) ->
		console.log "stream connected event"
	stream.on 'error', (err) ->
		console.log "stream error event"

if require.main == module
	main()

exports.main = main
exports.processTweet = processTweet
exports.respondToTweet = respondToTweet
exports.isOfWrongFromat = isOfWrongFromat
exports.solve = solve
exports.getConfig = getConfig