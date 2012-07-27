class Level
	constructor: (handle,game)->
		@game = game
		@bg = window.assets.getAsset(window.asset_map['levelone'])
		@game.showHUD()
		@fps = game.fps
		
		@context = game.context
		@context_width = game.canvas.width
		@context_height = game.canvas.height
		
		@player = new Player(@)
		@bullets = []
		@explosions = []
		@drops = []
		@baddies = []
		
	start: ()->
		@loop = window.setInterval ()=>
			@updateAll()
			@drawAll()
			@drops.push new LifeDrop(@) if Math.random() > @dropLikelyhood
		, 1000 / @fps
		
	updateAll: ()->
		@player.update() if @player
		
		for baddie, i in @baddies
			baddie.update()
			#Check for collisions and create explosions
			for bullet in @bullets
				if @haveCollided(bullet,baddie)
					@addBaddie()
					bullet.destroy()
					baddie.destroy()
					@explosions.push(new Explosion(@,bullet.x,bullet.y,baddie.width))
			@baddies.splice(i,1) if baddie.destroyed
			
		for bullet, i in @bullets
			bullet.update()
			@bullets.splice(i,1) if bullet.destroyed
			
		for explosion, i in @explosions
			explosion.update()
			@explosions.splice(i,1) if explosion.destroyed
			
		for drop, i in @drops
			if @haveCollided(drop,@player)
				drop.apply()
				drop.destroy()
			drop.update()
			@drops.splice(i,1) if drop.destroyed
			
	haveCollided: (sprite1,sprite2)->
		return ( sprite1.x < sprite2.x + sprite2.width ) and ( sprite1.x + sprite1.width > sprite2.x ) and ( sprite1.y < sprite2.y + sprite2.height ) and ( sprite1.y + sprite1.height > sprite2.y )
	
	drawAll: ()->
		@drawBG()
		@player.draw() if @player
		baddie.draw() for baddie in @baddies
		bullet.draw() for bullet in @bullets
		explosion.draw() for explosion in @explosions
		drop.draw() for drop in @drops
	
	drawRectangle: (color, x, y, width, height)->
		@context.fillStyle = color
		@context.fillRect(x, y, width, height)
		
	drawCircle: (color, x, y, diameter)->
		@context.fillStyle = color
		@context.beginPath();
		@context.arc(x, y, diameter, 0, Math.PI*2, true); 
		@context.closePath();
		@context.fill();
		
	drawBG: ()->
		@context.drawImage(@bg,0,0)
		
	over: ()->
		window.clearInterval(@loop)
		@game.hideHUD()
		@game.reset()