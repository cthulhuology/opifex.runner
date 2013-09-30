# Runner.coffee
#
#	© 2013 Dave Goehrig <dave@dloh.org>
#

spawn = (require 'child_process').spawn

Runner = () ->
	this.run = (command, args...) ->
		proc = spawn(command,args)
		proc.stdout.on 'data', (data) -> 
			console.log "stdout: #{data}"
		proc.stderr.on 'data', (data) -> 
			console.log "stderr: #{data}"
		proc.on 'close', (code) -> 
			console.log "#{command} exited: #{code}"

module.exports = Runner
