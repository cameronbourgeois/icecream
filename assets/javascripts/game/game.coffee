class Game
	constructor: ()->
		@fps = 60
		@levelNum = 0
		
		@canvas = document.getElementById('battlefield')
		@context = @canvas.getContext('2d')
		
		@bg = window.assets.getAsset(window.asset_map['background'])		

		@reset()

		$('#start_game').on 'click', @startGame

	reset: ()->
		@levelNum = 0
		delete @level
		@drawBG()
		@showMenu()
		
	drawBG: ()->
		@context.drawImage(@bg,0,0)

	startGame: (e)=>
		e.preventDefault()
		@playing = true
		@hideMenu()
		@nextLevel()
			
	nextLevel: ()->
		@levelNum++
		delete @level
		switch @levelNum
			when 1 then @level = new LevelOne(@)
			when 2 then @level = new LevelTwo(@)	
			when 3 then @level = new LevelThree(@)
			when 4 then @level = new LevelFour(@)
			when 5 then @level = new LevelFive(@)
		@level.start()
			
	showMenu: ()->
		$('#menu').removeClass 'hidden'
		
	hideMenu: ()->
		$('#menu').addClass 'hidden'
		
	showHUD: ()->
		$('#hud').removeClass 'hidden'
	
	hideHUD: ()->
		$('#hud').addClass 'hidden'