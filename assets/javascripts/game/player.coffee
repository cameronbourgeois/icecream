class Player extends Sprite
	constructor: (level)->
		super('player',level)
		
		@lives = 6
		@updateLives()
		
		@x = @level.context_width / 2
		@y = @level.context_height - 100
		@colour = '#6f46ff'
		@accelerationRate = 8
		@leftPressed = false
		@rightPressed = false
		@moving = true

		$(window).on 'keydown', (e)=>
			if e.which is 39 # left
				@rightPressed = true
			else if e.which is 37 # right
				@leftPressed = true
			else if e.which is 32 # space
				@level.bullets.push(new Bullet(@level))
				
		$(window).on 'keyup', (e)=>
			if e.which is 39 # left
				@rightPressed = false
			else if e.which is 37 # right
				@leftPressed = false

	update: ()->
		@y = @y - @accelerationRate if @upPressed and ( @y - @accelerationRate ) > ( 0 - @accelerationRate )
		@y = @y + @accelerationRate if @downPressed and ( @y + @accelerationRate + @height) <= ( @level.context_height + @accelerationRate ) 
		@x = @x - @accelerationRate if @leftPressed and ( @x - @accelerationRate ) >= 0
		@x = @x + @accelerationRate if @rightPressed  and ( @x + @accelerationRate + @width ) <= @level.context_width
		
		
	addLife: (num=1)->
		@lives = @lives + num
		@lives = 6 if @lives > 6
		@updateLives()
		
	removeLife: (num=1)->
		@lives = @lives - num
		@level.over() if @lives is 0
		@updateLives()
		
	updateLives: ()->
		$('#lives').removeClass().addClass('lives_'+@lives)