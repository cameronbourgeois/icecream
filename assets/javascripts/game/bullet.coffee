class Bullet
	constructor: (game)->
		@game = game
		@x = @game.player.x + (@game.player.width / 2)
		@y = @game.player.y
		@width = 2
		@height = 4
		@colour = '#ff0'
		@xAcceleration = 0
		@yAcceleration = -8
		@destroyed = false

	update: ()->
		if @y + @yAcceleration > 0 and @y + @yAcceleration + @height < @game.canvas.height
			@y = @y + @yAcceleration
		else
			@destroyed = true
		if @x + @xAcceleration > 0 and @x + @xAcceleration + @width < @game.canvas.height
			@x = @x + @xAcceleration
		else
			@destroyed = true

	draw: ()->
		@game.drawRectangle(@colour, @x, @y, @width, @height)