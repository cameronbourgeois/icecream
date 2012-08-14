class Level
	constructor: (handle,game)->
		@game = game
		@handle = handle
		@playing = false
		@bg = window.assets.getAsset(window.asset_map[@handle+'-bg'])
		@game.showHUD()
		@fps = game.fps
		@speedModifier = 1
		
		@context = game.context
		@context_width = game.canvas.width
		@context_height = game.canvas.height
		
		@ground = @context_height - 30
		
		@player = new Player(@)
		@points = 0
		@bullets = []
		@effects = []
		@drops = []
		@baddies = []
		
	start: ()->
		if not @playing
			$('#messages').html('')
			$('#messages').append('<div id="level_header" class="level_'+@game.levelNum+'"></div>')
			$('#messages').removeClass 'hidden'
			window.setTimeout ()=>
				$('#messages').addClass 'hidden'
				@playing = true
				@loop = window.setInterval @loopFunc, 1000 / @fps
			, 2000
			@playing = true
		
	loopFunc: ()=>
		@over() if @checkPassed()
		@updateAll()
		@drawAll()
		@addDrop() if Math.random() > @dropLikelyhood
		@addBaddie() if Math.random() > @baddieLikelyhood
		
	updateAll: ()->
		@player.update() if @player
		
		for baddie, i in @baddies
			if baddie
				baddie.update()
				# Check for collisions and create explosions
				for bullet in @bullets
					if @haveCollided(bullet,baddie)
						@player.incrementKillStreak()
						@points = Math.floor( @points + ( baddie.points * @player.killStreak ) )
						bullet.destroy()
						baddie.destroy()
				@baddies.splice(i,1) if baddie.destroyed
			
		for bullet, i in @bullets
			if bullet
				bullet.update()
				@bullets.splice(i,1) if bullet.destroyed					
			
		for effect, i in @effects
			if effect
				effect.update()
				@effects.splice(i,1) if effect.destroyed
			
		for drop, i in @drops
			if drop
				if @haveCollided(drop,@player)
					drop.apply()
					drop.destroy()
				drop.update()
				@drops.splice(i,1) if drop.destroyed
			
	haveCollided: (sprite1,sprite2)->
		return ( sprite1.x < sprite2.x + sprite2.width ) and ( sprite1.x + sprite1.width > sprite2.x ) and ( sprite1.y < sprite2.y + sprite2.height ) and ( sprite1.y + sprite1.height > sprite2.y )
	
	drawAll: ()->
		$('#points').html(@points)
		@drawBG()
		@player.draw() if @player
		baddie.draw() for baddie in @baddies
		bullet.draw() for bullet in @bullets
		effect.draw() for effect in @effects
		drop.draw() for drop in @drops
		
	drawBG: ()->
		@context.drawImage(@bg,0,0)
		
	addDrop: ()->
		# Undefined
		
	addBaddie: ()->
		# Undefined	
		
	stop: ()->
		@playing = false
		window.clearInterval(@loop)
		@game.hideHUD()
		
	over: ()->
		@stop()
		if @checkPassed()
			@game.nextLevel()
		else
			@game.reset()