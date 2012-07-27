class Enemy extends Entity
	constructor: (level)->
		@level = level
		
		@sprite = new Image()
		@sprite.src = $(window.assets.getAsset('/assets/images/game/baddie-banana-pop.png')).attr('src')
		
		@width = @sprite.width
		@height = @sprite.height
		@x = Math.floor( Math.random() * ( @level.context_width - @width ) + 1 ) # Randomise entry
		@y = 0
		@colour = '#008F7C'
		@xAcceleration = 0
		@yAcceleration = 3

	update: ()->
		# Make sure you're still within the bounds of the canvas
		if @y + @yAcceleration > 0 and @y + @yAcceleration + @height < @level.context_height
			@y = @y + @yAcceleration
		else
			# Game Over
	 		@level.over()
	 		@destroyed = true
###
	draw: ()->
		#@game.context.globalAlpha = 0.5
		@game.context.drawImage(@sprite,@x,@y)
		#@game.context.globalAlpha = 1
		
		###