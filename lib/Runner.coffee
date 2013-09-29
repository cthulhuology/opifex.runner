# Runner.coffee
#
#	© 2013 Dave Goehrig <dave@dloh.org>
#

Opifex = require 'Opifex'
spawn = (require 'child_process').spawn

Runner = (Url) ->
	Opifex(Url).run = (command, args...) ->
		proc = spawn(command,args)
		proc.stdout.on 'data', (data) -> 
			console.log "stdout: #{data}"
		proc.stderr.on 'data', (data) -> 
			console.log "stderr: #{data}"
		proc.on 'close', (code) -> 
			console.log "#{command} exited: #{code}"

module.exports = Runner
