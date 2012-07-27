class Drop extends Sprite
	constructor: (handle,level)->
		super(handle,level)

		@width = @sprite.width
		@height = @sprite.height
		@x = Math.floor( Math.random() * ( @level.context_width - @width ) + 1 ) # Randomise entry
		@y = 0

	update: ()->
		# Make sure you're still within the bounds of the canvas
		if @y + @yAcceleration > 0 and @y + @yAcceleration + @height < @level.context_height
			@y = @y + @yAcceleration
		else
	 		@destroy()