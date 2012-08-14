class LevelFive extends Level
	constructor: (game)->
		super('levelfive',game)
		@baseSpeed = 4
		@dropLikelyhood = 0.998
		@baddieLikelyhood = 0.96
		@addBaddie()

	checkPassed: ()->
		@points > 100

	over: ()->
		@stop()
		@game.reset()

	addBaddie: ()->
		if Math.random() > 0.5
			@baddies.push(new LicoriceConeBaddie(@))
		else
			@baddies.push(new LicoricePopBaddie(@))

	addDrop: ()->
		@drops.push new PoisonDrop(@)