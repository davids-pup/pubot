# Description:
#   beer effect on hubot.
#
# Commands:
#   any chat containing the word beer - will trigger response from hubot.
beerReplies = ["heck!! you just reminded me to booze", "hey hey, do you want me to work or not?", "you drunkards!!", "you humans, thinking about getting drunk all the time", "doctor says beer is not healthy for you", "yes, lets get some beer"]

module.exports = (robot) ->
	robot.hear /beer/i, (res) ->
		res.send res.random beerReplies