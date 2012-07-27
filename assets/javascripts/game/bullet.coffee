class Bullet extends Sprite
	constructor: (level)->
		super('bullet',level)
		
		@level = level
		@x = @level.player.x + (@level.player.width / 2) - 3
		@y = @level.player.y
		@width = 2
		@height = 4
		@colour = '#ff0'
		@xAcceleration = 0
		@yAcceleration = -8

	update: ()->
		if @y + @yAcceleration > 0 and @y + @yAcceleration + @height < @level.context_height
			@y = @y + @yAcceleration
		else
			@destroy()
		if @x + @xAcceleration > 0 and @x + @xAcceleration + @width < @level.context_height
			@x = @x + @xAcceleration
		else
			@destroy()