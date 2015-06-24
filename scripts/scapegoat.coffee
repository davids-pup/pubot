# Description:
#   pick a scapegoat
#
# Commands:
#   hubot pick a scapegoat from name1, name2, name3 - returns a random name
#   hubot pick a sacrifice from name1, name2, name3 - returns a random name
module.exports = (robot) ->
	robot.respond /pick a (scapegoat|sacrifice) from (.*)/i, (res) ->
    
		res.send res.random res.match[2].split(',')
