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
		if @level.speedModifier isnt 1
			ySpeed =  @yAcceleration * @level.speedModifier
		else
			ySpeed = @yAcceleration
		if @y + ySpeed > 0 and @y + ySpeed + @height < @level.context_height
			@y = @y + ySpeed
		else
			@destroy()