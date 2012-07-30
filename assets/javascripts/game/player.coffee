class Player extends Sprite
	constructor: (level)->
		super('player',level)
		
		@lives = 6
		@updateLives()
		
		@killStreak = 0
		
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
		#if @level.speedModifier isnt 1
		#	speed =  @accelerationRate * @level.speedModifier
		#else
		speed = @accelerationRate
		@x = @x - speed if @leftPressed and ( @x - speed ) >= 0
		@x = @x + speed if @rightPressed  and ( @x + speed + @width ) <= @level.context_width
		
	incrementKillStreak: ()->
		@killStreak++	
		
	addLife: (num=1)->
		@lives = @lives + num
		@lives = 6 if @lives > 6
		@updateLives()
		
	removeLife: (num=1)->
		@killStreak = 0
		@lives = @lives - num
		@level.over() if @lives is 0
		@updateLives()
		
	updateLives: ()->
		$('#lives').removeClass().addClass('lives_'+@lives)