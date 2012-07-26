class Game
	constructor: ()->
		@fps = 60
		@canvas = document.getElementById('battlefield')
		@context = @canvas.getContext('2d')
		@context_width = @canvas.width
		@context_height = @canvas.height
		@level = 1
		@player = new Player(@)
		@bullets = []
		@enemies = [new Enemy(@)]
		@explosions = []

		window.setInterval ()=>
			@updateAll()
			@drawAll()
		, 1000 / @fps
		
		###
		$(window).on 'keydown', (e)=>
			if e.which is 13 # enter
				window.clearInterval()
				window.game = new Game()
		###

	updateAll: ()->
		@player.update() if @player
		for enemy, i in @enemies
			enemy.update()
			#Check for collisions and create explosion
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
		@drawRectangle('#9AACAA', 0, 0, @context_width, @context_height)
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
		
	over: ()->
		@explosions.push(new Explosion(@,@player.x,@player.y,80))
		delete @player
		$('#gameover').show()
	