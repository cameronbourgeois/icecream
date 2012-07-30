class Drop extends Sprite
	constructor: (handle,level)->
		super(handle,level)

		@width = @sprite.width
		@height = @sprite.height
		@x = Math.floor( Math.random() * ( @level.context_width - @width ) + 1 ) # Randomise entry
		@y = 0

	update: ()->
		if @level.speedModifier isnt 1
			ySpeed =  @yAcceleration * @level.speedModifier
		else
			ySpeed = @yAcceleration
		if @y + ySpeed > 0 and @y + ySpeed + @height < @level.bottomOfLevel
			@y = @y + ySpeed
		else
	 		@destroy()