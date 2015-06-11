# Description:
#   A simple placebo effect .
#
# Commands:
#   hubot i want to <query> - does it for you.
#   hubot can you <query> - does it for you.
module.exports = (robot) ->
  robot.respond /i want to (.*)/i, (msg) ->
  	msg.send 'Done, anything for you!'

  robot.respond /can you (.*)/i, (msg) ->
  	msg.send 'just for you, finishing rightaway!'