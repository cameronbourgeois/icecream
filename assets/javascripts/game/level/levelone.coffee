class LevelOne extends Level
	constructor: (game)->
		super('levelone',game)
		@baseSpeed = 3
		@dropLikelyhood = 0.996
		@baddieLikelyhood = 0.967
		@addBaddie()
		
	checkPassed: ()->
		@points > 2500
	
	addBaddie: ()->
		if Math.random() > 0.5
			@baddies.push(new BananaConeBaddie(@))
		else
			@baddies.push(new BananaPopBaddie(@))		
			
	addDrop: ()->
		if Math.random() < 0.5
			@drops.push new HealthDrop(@)
		else
			@drops.push new SlowDrop(@)
			
			
			