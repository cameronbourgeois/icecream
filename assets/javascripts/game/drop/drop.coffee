class Drop extends Sprite
	constructor: (handle,level)->
		super(handle,level)
		
		@yAcceleration = 5

		@width = @sprite.width
		@height = @sprite.height
		@x = Math.floor( Math.random() * ( @level.context_width - @width ) + 1 ) # Randomise entry
		@y = 0

	update: ()->
		if @level.speedModifier isnt 1
			ySpeed =  @yAcceleration * @level.speedModifier
		else
			ySpeed = @yAcceleration
		if @y + ySpeed > 0 and @y + ySpeed + @height < @level.ground
			@y = @y + ySpeed
		else
			@level.effects.push(new Explosion(@,@x,@y))
			@destroy()
	 		
	apply: ()->
		@level.effects.push(new DropGhost(@,@level))
	 		
	 		
class DropGhost extends Sprite
	constructor: (drop,level)->
		super(drop.handle+'-ghost',level)
		@drop = drop

		@yAcceleration = -3
		@opacity = 1

		@width = @sprite.width
		@height = @sprite.height
		@x = @drop.x
		@y = @drop.y
		
	update: ()->
		@opacity = @opacity - 0.025
		@destroy() if @opacity <= 0
		if @level.speedModifier isnt 1
			ySpeed =  @yAcceleration * @level.speedModifier
		else
			ySpeed = @yAcceleration
		if @y + ySpeed > 0 and @y + ySpeed + @height < @level.context_height
			@y = @y + ySpeed
		else
			@destroy()
			
	draw: ()->
		@level.context.globalAlpha = @opacity
		@level.context.drawImage(@sprite,@x,@y,@width,@height)
		@level.context.globalAlpha = 1