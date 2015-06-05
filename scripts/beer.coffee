beerReplies = ["heck man!! you just reminded me to booze", "hey hey hey, do you want me to work or not?", "you drunkards!!", "you humans, thinking about getting drunk all the time"]

module.exports = (robot) ->
	robot.hear /beer/i, (res) ->
		res.send res.random beerReplies