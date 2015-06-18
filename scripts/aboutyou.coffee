# Description:
#   tells where it is running from
#
# Commands:
#   hubot where are you from - tells host name
#   hubot where do you come from - tells host name
os = require 'os'

module.exports = (robot) ->
  robot.respond /(where are you|where do you come) from/i, (msg) ->
  	msg.send 'my hostname - ' + os.hostname()