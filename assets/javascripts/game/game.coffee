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
		@levelNum = 1
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
			if @levelNum is 1
				@level = new LevelOne(@)
			@level.start()
			
	nextLevel: ()->
		delete @level
		if @levelNum is 2
			@level = new LevelTwo(@)
		@level.start()
			
	showMenu: ()->
		$('#menu').removeClass 'hidden'
		
	hideMenu: ()->
		$('#menu').addClass 'hidden'
		
	showHUD: ()->
		$('#hud').removeClass 'hidden'
	
	hideHUD: ()->
		$('#hud').addClass 'hidden'