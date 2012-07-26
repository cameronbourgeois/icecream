class Enemy
	constructor: (game)->
		@game = game
		@width = Math.floor( Math.random() * 61 + 20 )
		@height = @width
		@x = Math.floor( Math.random() * ( @game.context_width - @width ) + 1 ) # Randomise entry
		@y = 0
		@colour = '#008F7C'
		@xAcceleration = 0
		@yAcceleration = @game.level
		@destroyed = false

	update: ()->
		# Make sure you're still within the bounds of the canvas
		if @y + @yAcceleration > 0 and @y + @yAcceleration + @height < @game.canvas.height
			@y = @y + @yAcceleration
		else
			# Game Over
	 		@game.over()
	 		@destroyed = true

	draw: ()->
		@game.drawRectangle(@colour, @x, @y, @width, @height)