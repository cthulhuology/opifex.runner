Opifex = require 'Opifex'
Opifex.facit = (command) ->
	console.log "Got command #{command}"
Opifex('amqp://dave:test@blog.dloh.org:5672//test-exchange/test-queue/#')

