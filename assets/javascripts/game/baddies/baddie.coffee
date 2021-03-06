class Baddie extends Sprite
	constructor: (handle,level)->
		super(handle,level)

		@width = @sprite.width
		@height = @sprite.height
		@x = Math.floor( Math.random() * ( @level.context_width - @width ) + 1 ) # Randomise entry point
		@y = 0
		@xAcceleration = 0
		@yAcceleration = @level.baseSpeed
		@points = @level.baseSpeed

	update: ()->
		if @level.speedModifier isnt 1
			ySpeed =  @yAcceleration * @level.speedModifier
		else
			ySpeed = @yAcceleration
		# Make sure you're still within the bounds of the canvas
		if @y + ySpeed > 0 and @y + ySpeed + @height < @level.ground
			@y = @y + ySpeed
		else
	 		@level.player.damageHealth()
	 		@level.effects.push new Explosion(@level,@x,@y)
	 		@destroy()
	 		
	destroy: ()->
		super()
		@level.effects.push new Explosion(@level,@x,@y)