class Game
	constructor: ()->
		
		@fps = 60
		@levelNum = 1
		
		@canvas = document.getElementById('battlefield')
		@context = @canvas.getContext('2d')
		
		@bg = window.assets.getAsset(window.asset_map['background'])		

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
			@level = new LevelOne(@)
			@level.start()
			
	showMenu: ()->
		$('#menu').removeClass 'hidden'
		
	hideMenu: ()->
		$('#menu').addClass 'hidden'
		
	showHUD: ()->
		$('#hud').removeClass 'hidden'
	
	hideHUD: ()->
		$('#hud').addClass 'hidden'