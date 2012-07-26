class Player extends Entity
	constructor: (game)->
		@game = game
		
		@sprite = new Image()
		@sprite.src = $('#player').attr('src')
		
		@width = @sprite.width
		@height = @sprite.height
		
		@x = @game.context_width / 2
		@y = @game.context_height - 100
		@colour = '#6f46ff'
		@accelerationRate = 8
		@leftPressed = false
		@rightPressed = false
		@moving = true
		@lives = 3
		


		$(window).on 'keydown', (e)=>
			if e.which is 39 # left
				@rightPressed = true
			else if e.which is 37 # right
				@leftPressed = true
			else if e.which is 32 # space
				@game.bullets.push(new Bullet(@game))
				
				
		$(window).on 'keyup', (e)=>
			if e.which is 39 # left
				@rightPressed = false
			else if e.which is 37 # right
				@leftPressed = false

	update: ()->
		@y = @y - @accelerationRate if @upPressed and ( @y - @accelerationRate ) > ( 0 - @accelerationRate )
		@y = @y + @accelerationRate if @downPressed and ( @y + @accelerationRate + @height) <= ( @game.canvas.height + @accelerationRate ) 
		@x = @x - @accelerationRate if @leftPressed and ( @x - @accelerationRate ) >= 0
		@x = @x + @accelerationRate if @rightPressed  and ( @x + @accelerationRate + @width ) <= @game.canvas.width