class LevelFive extends Level
	constructor: (game)->
		super('levelfive',game)
		@baseSpeed = 7
		@dropLikelyhood = 0.993
		@baddieLikelyhood = 0.97
		@addBaddie()

	checkPassed: ()->
		@points > 5000

	over: ()->
		@stop()
		@game.reset()

	addBaddie: ()->
		if Math.random() > 0.5
			@baddies.push(new LicoriceConeBaddie(@))
		else
			@baddies.push(new LicoricePopBaddie(@))

	addDrop: ()->
		if Math.random() < 0.7
			@drops.push new HealthDrop(@)
		else if Math.random() > 0.5
			@drops.push new SlowDrop(@)
		else
			@drops.push new BombDrop(@)