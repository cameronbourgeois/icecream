class Baddie extends Sprite
	constructor: (handle,level)->
		super(handle,level)

		@width = @sprite.width
		@height = @sprite.height
		@x = Math.floor( Math.random() * ( @level.context_width - @width ) + 1 ) # Randomise entry
		@y = 0
		@xAcceleration = 0
		@yAcceleration = 10

	update: ()->
		# Make sure you're still within the bounds of the canvas
		if @y + @yAcceleration > 0 and @y + @yAcceleration + @height < @level.context_height
			@y = @y + @yAcceleration
		else
	 		@level.player.removeLife()
	 		@level.addBaddie()
	 		@destroy()
###
Remember this for opacity
	draw: ()->
		#@game.context.globalAlpha = 0.5
		@game.context.drawImage(@sprite,@x,@y)
		#@game.context.globalAlpha = 1
###