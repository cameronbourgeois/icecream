class LevelOne extends Level
	constructor: (game)->
		super('levelone',game)
		@baseSpeed = 4
		@dropLikelyhood = 0.998
		@baddieLikelyhood = 0.95
		@bottomOfLevel = @context_height - 26
		@colour = '#e0ca75'
		@addBaddie()
		
	checkPassed: ()->
		@points > 1000
	
	addBaddie: ()->
		if Math.random() > 0.5
			@baddies.push(new BananaConeBaddie(@))
		else
			@baddies.push(new BananaPopBaddie(@))
			
	addDrop: ()->
		random = Math.random()
		if random > 0.9
			@drops.push new LifeDrop(@)
		else if Math.random() > 0.5 # and @speedModifier is 1
			@drops.push new SpeedDrop(@)
		else # if @speedModifier is 1
			@drops.push new SlowDrop(@)