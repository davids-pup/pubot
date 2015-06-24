# Description:
#   pick a scapegoat
#
# Commands:
#   hubot pick a scapegoat for blaming from name1, name2, name3 - returns a random name
#   hubot pick a sacrifice for retro from name1, name2, name3 - returns a random name
module.exports = (robot) ->
	robot.respond /pick a (scapegoat|sacrifice) for ([^\s]+) from (.*)/i, (res) ->

		res.send res.random res.match[3].split(',')
