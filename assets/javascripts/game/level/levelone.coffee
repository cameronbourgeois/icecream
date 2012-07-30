class LevelOne extends Level
	constructor: (game)->
		super('levelone',game)
		@baseSpeed = 3
		@dropLikelyhood = 0.998
		@baddieLikelyhood = 0.96
		@colour = '#e0ca75'
		@addBaddie()
		
	checkPassed: ()->
		@points > 10000
	
	addBaddie: ()->
		if Math.random() > 0.5
			@baddies.push(new BananaConeBaddie(@))
		else
			@baddies.push(new BananaPopBaddie(@))
			
	addDrop: ()->
		if Math.random() > 0.7
			@drops.push new HealthDrop(@)
		else if Math.random() > 0.5 # and @speedModifier is 1
			@drops.push new SpeedDrop(@)
		else # if @speedModifier is 1
			@drops.push new SlowDrop(@)