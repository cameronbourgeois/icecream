class Explosion
	constructor: (level, x, y, maxsize, addSubExplosion = true)->
		@level = level
		@x = x
		@y = y
		@maxsize = maxsize
		@diameter = 1
		@colour = @level.colour
		@destroyed = false
		
		if (addSubExplosion)
			randomNum = Math.random()			
			if randomNum > 0.5 
				randomX = x + Math.floor( Math.random() * -20 )	
			else 
				randomX = x + Math.floor( Math.random() * 20 )
			randomNum = Math.random()
			if randomNum > 0.5 
				randomY = y + Math.floor( Math.random() * -20 )	
			else 
				randomY = y + Math.floor( Math.random() * 20 )
			@level.explosions.push new Explosion(@level, randomX, randomY, @maxsize / 2, false)

	update: ()->
		@.destroyed = true if @diameter > @maxsize
		@diameter = @diameter + 2

	draw: ()->	
		@level.drawCircle(@colour, @x, @y, @diameter)