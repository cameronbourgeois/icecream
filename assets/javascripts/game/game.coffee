class Game
	constructor: ()->
		
		@fps = 60
		@levelNum = 1
		
		@canvas = document.getElementById('battlefield')
		@context = @canvas.getContext('2d')
		@context_width = @canvas.width
		@context_height = @canvas.height
		
		@bg = new Image()
		@bg.src = $(window.assets.getAsset('/assets/images/game/bg-sky.jpg')).attr('src')		

		@reset()

		$('#start_game').on 'click', @startGame

	reset: ()->
		delete @level
		@drawBG()
		@showMenu()
		
	drawBG: ()->
		@context.drawImage(@bg,0,0)

	startGame: (e)=>
		e.preventDefault()
		if !@level
			@hideMenu()
			@playing = true
			@level = new Level(@)
			
	showMenu: ()->
		$('#menu').removeClass 'hidden'
		
	hideMenu: ()->
		$('#menu').addClass 'hidden'