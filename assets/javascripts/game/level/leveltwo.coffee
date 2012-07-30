class LevelTwo extends Level
	constructor: (game)->
		super('leveltwo',game)
		@baseSpeed = 5
		@dropLikelyhood = 0.998
		@baddieLikelyhood = 0.93
		@colour = '#add3c6'
		@addBaddie()
		
	checkPassed: ()->
		@points > 10000
		
	over: ()->
		@stop()
		@game.reset()

	addBaddie: ()->
		if Math.random() > 0.5
			@baddies.push(new PistachioConeBaddie(@))
		else
			@baddies.push(new PistachioPopBaddie(@))

	addDrop: ()->
		if Math.random() > 0.8
			@drops.push new HealthDrop(@)
		else if Math.random() > 0.5 # and @speedModifier is 1
			@drops.push new SpeedDrop(@)
		else # if @speedModifier is 1
			@drops.push new SlowDrop(@)