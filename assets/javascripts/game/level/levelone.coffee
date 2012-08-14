class LevelOne extends Level
	constructor: (game)->
		super('levelone',game)
		@baseSpeed = 3
		@dropLikelyhood = 0.997
		@baddieLikelyhood = 0.97
		@addBaddie()
		
	checkPassed: ()->
		@points > 10000
	
	addBaddie: ()->
		if Math.random() > 0.5
			@baddies.push(new BananaConeBaddie(@))
		else
			@baddies.push(new BananaPopBaddie(@))
			
	addDrop: ()->
		@drops.push new BombDrop(@)
		
		###
		if Math.random() > 0.7
			@drops.push new HealthDrop(@)
		else
			@drops.push new SlowDrop(@)
			###