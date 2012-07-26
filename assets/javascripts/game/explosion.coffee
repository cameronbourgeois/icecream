class Explosion
	constructor: (game, x, y, maxsize, addSubExplosion = true)->
		@game = game
		@x = x
		@y = y
		@maxsize = maxsize
		@diameter = 1
		@colour = '#FF0000'
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
			@game.explosions.push new Explosion(@game, randomX, randomY, @maxsize / 2, false)

	update: ()->
		@.destroyed = true if @diameter > @maxsize
		@diameter = @diameter + 2

	draw: ()->	
		@game.drawCircle(@colour, @x, @y, @diameter)