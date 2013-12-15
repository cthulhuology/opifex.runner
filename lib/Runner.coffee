# Runner.coffee
#
#	© 2013 Dave Goehrig <dave@dloh.org>
#

spawn = (require 'child_process').spawn

Runner = () ->
	self = this
	this.run = (command, args...) ->
		proc = spawn(command,args)
		proc.stdout.on 'data', (data) ->
			console.log "stdout: #{data}"
			self.send [ "stdout", data.toString() ]
		proc.stderr.on 'data', (data) ->
			console.log "stderr: #{data}"
			self.send [ "stderr", data.toString() ]
		proc.on 'close', (code) ->
			console.log "#{command} exited: #{code}"
			self.send [ "exit", code ]

module.exports = Runner
