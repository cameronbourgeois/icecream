class LevelTwo extends Level
	constructor: (game)->
		super('leveltwo',game)
		@baseSpeed = 6
		@dropLikelyhood = 0.998
		@baddieLikelyhood = 0.93
		@bottomOfLevel = @context_height - 26
		@colour = '#add3c6'
		@addBaddie()
		
	checkPassed: ()->
		@points > 1000
		
	over: ()->
		@stop()
		@game.reset()

	addBaddie: ()->
		if Math.random() > 0.5
			@baddies.push(new PistachioConeBaddie(@))
		else
			@baddies.push(new PistachioPopBaddie(@))

	addDrop: ()->
		random = Math.random()
		if random > 0.9
			@drops.push new LifeDrop(@)
		else if Math.random() > 0.5 # and @speedModifier is 1
			@drops.push new SpeedDrop(@)
		else # if @speedModifier is 1
			@drops.push new SlowDrop(@)