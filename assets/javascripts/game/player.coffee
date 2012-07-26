class Player
	constructor: (game)->
		@game = game
		@width = 10
		@height = 10
		@x = @game.context_width / 2
		@y = @game.context_height - 20
		@colour = '#6f46ff'
		@accelerationRate = 8
		@xAcceleration = 0
		@yAcceleration = 0
		@upPressed = false
		@downPressed = false
		@leftPressed = false
		@rightPressed = false
		@moving = true
		@lives = 3

		$(window).on 'keydown', (e)=>
			if e.which is 38 # up
				@upPressed = true
			else if e.which is 40 # down
				@downPressed = true
			else if e.which is 39 # left
				@rightPressed = true
			else if e.which is 37 # right
				@leftPressed = true
			else if e.which is 32 # space
				@game.bullets.push(new Bullet(@game))
				
				
		$(window).on 'keyup', (e)=>
			if e.which is 38 # up
				@upPressed = false
			else if e.which is 40 # down
				@downPressed = false
			else if e.which is 39 # left
				@rightPressed = false
			else if e.which is 37 # right
				@leftPressed = false
		
		###
				
		@momentumloop = setInterval(()=>
			@loseMomentum()
		, @game.fps)
		
		###

	###
	accelerateUp: ()->
		@yAcceleration = @yAcceleration - @accelerationRate
		
	accelerateDown: ()->
		@yAcceleration = @yAcceleration + @accelerationRate
		
	accelerateLeft: ()->
		@xAcceleration = @xAcceleration - @accelerationRate
		
	accelerateRight: ()->
		@xAcceleration = @xAcceleration + @accelerationRate
	###

	update: ()->
		@y = @y - @accelerationRate if @upPressed and ( @y - @accelerationRate ) > ( 0 - @accelerationRate )
		@y = @y + @accelerationRate if @downPressed and ( @y + @accelerationRate + @height) <= ( @game.canvas.height + @accelerationRate ) 
		@x = @x - @accelerationRate if @leftPressed and ( @x - @accelerationRate ) >= 0
		@x = @x + @accelerationRate if @rightPressed  and ( @x + @accelerationRate + @width ) <= @game.canvas.width
		
		###
		# MOMENTUM BASED MOVEMENT
		@accelerateUp() if @upPressed
		@accelerateDown() if @downPressed
		@accelerateLeft() if @leftPressed
		@accelerateRight() if @rightPressed
		
		# Make sure you're still within the bounds of the canvas			
		if ( ( @y + @yAcceleration ) > 0 ) and ( ( @y + @yAcceleration + @height ) < @game.canvas.height )
			@y = @y + @yAcceleration
		else
			@yAcceleration = 0
		if ( ( @x + @xAcceleration ) > 0 ) and ( ( @x + @xAcceleration + @width ) < @game.canvas.width )
			@x = @x + @xAcceleration
		else
			@xAcceleration = 0
		###

	###

	loseMomentum: ()->
		if @yAcceleration > 0
			@yAcceleration--
		else if @yAcceleration < 0
			@yAcceleration++
		if @xAcceleration > 0
			@xAcceleration--
		else if @xAcceleration < 0
			@xAcceleration++
			
	###

	draw: ()-> 
		@game.drawRectangle(@colour, @x, @y, @width, @height)