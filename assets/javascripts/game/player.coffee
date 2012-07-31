class Player extends Sprite
	constructor: (level)->
		super('player',level)
		
		@spriterocket = window.assets.getAsset(window.asset_map[@handle+'-rocket'])
		
		@health = 6
		@updateHealth()
		
		@killStreak = 0
		
		@x = @level.context_width / 2
		@y = @level.ground - @height
		@colour = '#6f46ff'
		@xAcceleration = 8
		@yAcceleration = 0
		@upPressed = false
		@leftPressed = false
		@rightPressed = false

		$(window).on 'keydown', (e)=>
			switch e.which
				when 38 then @upPressed = true #up
				when 39 then @rightPressed = true #left
				when 37 then @leftPressed = true #right
				when 32 then @level.bullets.push(new Bullet(@level)) #space
				
		$(window).on 'keyup', (e)=>
			switch e.which
				when 38 then @upPressed = false #up
				when 39 then @rightPressed = false #right
				when 37 then @leftPressed = false #left

	update: ()->
		@x = @x - @xAcceleration if @leftPressed and ( @x - @xAcceleration ) >= 0
		@x = @x + @xAcceleration if @rightPressed  and ( @x + @xAcceleration + @width ) <= @level.context_width
		if @upPressed and @yAcceleration < 10
			@yAcceleration++
		else 
			@yAcceleration-- if @yAcceleration > -10
		console.log @yAcceleration
		@y = @y - @yAcceleration if ( @y - @yAcceleration ) > 0 and ( @y - @yAcceleration ) + @height < @level.ground
		
	draw: ()->
		if @upPressed
			sprite = @spriterocket
		else
			sprite = @sprite
		@level.context.drawImage(sprite,@x,@y)	
		
	incrementKillStreak: ()->
		@killStreak++
		
	resetKillStreak: ()->
		@killStreak = 0
		
	replenishHealth: (amount=1)->
		@health = @health + amount if @health < 6
		@updateHealth()
		
	damageHealth: (amount=1)->
		@resetKillStreak()
		@health = @health - amount
		@level.over() if @health is 0
		@updateHealth()
		
	updateHealth: ()->
		$('#health').removeClass().addClass('health_'+@health)