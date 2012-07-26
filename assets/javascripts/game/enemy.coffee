class Enemy extends Entity
	constructor: (game)->
		@game = game
		
		
		@sprite = new Image()
		@sprite.src = $('#baddie-banana-pop').attr('src')
		
		@width = @sprite.width
		@height = @sprite.height
		@x = Math.floor( Math.random() * ( @game.context_width - @width ) + 1 ) # Randomise entry
		@y = 0
		@colour = '#008F7C'
		@xAcceleration = 0
		@yAcceleration = @game.level

	update: ()->
		# Make sure you're still within the bounds of the canvas
		if @y + @yAcceleration > 0 and @y + @yAcceleration + @height < @game.canvas.height
			@y = @y + @yAcceleration
		else
			# Game Over
	 		@game.over()
	 		@destroyed = true
###
	draw: ()->
		#@game.context.globalAlpha = 0.5
		@game.context.drawImage(@sprite,@x,@y)
		#@game.context.globalAlpha = 1
		
		###