class Bullet extends Entity
	constructor: (level)->
		@level = level
		@x = @level.player.x + (@level.player.width / 2) - 3
		@y = @level.player.y
		@width = 2
		@height = 4
		@colour = '#ff0'
		@xAcceleration = 0
		@yAcceleration = -8
		@sprite = new Image()
		@sprite.src = $(window.assets.getAsset('/assets/images/game/bullet-red.png')).attr('src')

	update: ()->
		if @y + @yAcceleration > 0 and @y + @yAcceleration + @height < @level.context_height
			@y = @y + @yAcceleration
		else
			@destroyed = true
		if @x + @xAcceleration > 0 and @x + @xAcceleration + @width < @level.context_height
			@x = @x + @xAcceleration
		else
			@destroyed = true