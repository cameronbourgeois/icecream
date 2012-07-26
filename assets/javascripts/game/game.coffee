class Game
	constructor: ()->
		@fps = 70
		@canvas = document.getElementById('battlefield')
		@context = @canvas.getContext('2d')
		@context_width = @canvas.width
		@context_height = @canvas.height
		@level = 1
		@player = new Player(@)
		@bullets = []
		@enemies = [new Enemy(@)]
		@explosions = []
		
		@bg = new Image()
		@bg.src = $('#bg-sky').attr('src')

		window.setInterval ()=>
			@updateAll()
			@drawAll()
		, 1000 / @fps
		
		#window.setInterval ()=>
		#	@enemies.push new Enemy(@)
		#, 1200

	updateAll: ()->
		@player.update() if @player
		for enemy, i in @enemies
			enemy.update()
			#Check for collisions and create explosions
			for bullet in @bullets
				if ( bullet.x > enemy.x and bullet.x < enemy.x + enemy.width ) and ( bullet.y < enemy.y + enemy.height and bullet.y > enemy.y )
					@level++
					@enemies.push(new Enemy(@))
					bullet.destroyed = true
					enemy.destroyed = true
					@explosions.push(new Explosion(@,bullet.x,bullet.y,enemy.width))
			@enemies.splice(i,1) if enemy.destroyed
		for bullet, i in @bullets
			bullet.update()
			@bullets.splice(i,1) if bullet.destroyed
		for explosion, i in @explosions
			explosion.update()
			@explosions.splice(i,1) if explosion.destroyed

	drawAll: ()->
		$('#status').html(@level)
		# draw the background
		@drawBG()
		@player.draw() if @player
		enemy.draw() for enemy in @enemies
		bullet.draw() for bullet in @bullets
		explosion.draw() for explosion in @explosions

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
		@explosions.push(new Explosion(@,@player.x,@player.y,80))
		delete @player
		alert @level
		$('#gameover').show()
	