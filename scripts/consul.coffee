# Description:
#   Consul Pubot
#
# Commands:
#   hubot consul datacenters - Show Datacenters
#   hubot consul services - Show Services
#   hubot consul service <servicename> - Show Detailed info about a service
#
module.exports = (robot) ->

   # Datacenters
   robot.hear /consul datacenters/i, (msg) ->
     msg.http("http://consul.dc0.pageuppeople.com:8500/v1/catalog/datacenters").get() (err, res, body) ->
        try
          json = JSON.parse(body)
          for dc in json
            msg.send "#{dc}\n"
        catch error
          msg.reply "I'm afraid I can't let you do that."

   # Services
   robot.hear /consul services/i, (msg) ->
     msg.http("http://consul.dc0.pageuppeople.com:8500/v1/catalog/services").get() (err, res, body) ->
        try
          #msg.send "#{body}\n"
          json = JSON.parse(body)
          for key, val of json
            msg.send "#{key}\n"
          #msg.send "#{json}\n"
        catch error
          msg.reply "I'm afraid I can't let you do that."

   # Detailed Info about services
   robot.hear /consul service (.*)/i, (msg) ->
     service = escape(msg.match[1])
     msg.http("http://consul.dc0.pageuppeople.com:8500/v1/catalog/service/#{service}").get() (err, res, body) ->
        try
          #msg.send "#{body}\n"
          json = JSON.parse(body)
          for item in json
            for k, v of item
              msg.send "#{k} : #{v}"
        catch error
          msg.reply "I'm afraid I can't let you do that."
