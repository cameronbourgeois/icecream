class LevelFour extends Level
	constructor: (game)->
		super('levelfour',game)
		@baseSpeed = 6
		@dropLikelyhood = 0.993
		@baddieLikelyhood = 0.96
		@addBaddie()

	checkPassed: ()->
		@points > 5000

	addBaddie: ()->
		if Math.random() > 0.5
			@baddies.push(new ChocolateConeBaddie(@))
		else
			@baddies.push(new ChocolatePopBaddie(@))

	addDrop: ()->
		if Math.random() < 0.7
			@drops.push new HealthDrop(@)
		else if Math.random() > 0.5
			@drops.push new SlowDrop(@)
		else
			@drops.push new BombDrop(@)