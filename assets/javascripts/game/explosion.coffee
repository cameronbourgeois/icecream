class Explosion extends Sprite
	constructor: (level,x,y)->
		super('explosion',level)
		
		@level = level
		@x = x
		@y = y
		@xAcceleration = 0
		@yAcceleration = -1
		@opacity = 1
		@sizeMod = 0
	
	update: ()->
		@opacity = @opacity - 0.05
		@destroy() if @opacity <= 0
		if Math.random() > 0.5 then @sizeMod = 1 else @sizeMod = -2 
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
		@level.context.drawImage(@sprite,@x,@y,@width+@sizeMod,@height+@sizeMod)
		@level.context.globalAlpha = 1