class LevelFour extends Level
	constructor: (game)->
		super('levelfour',game)
		@baseSpeed = 4
		@dropLikelyhood = 0.998
		@baddieLikelyhood = 0.96
		@addBaddie()

	checkPassed: ()->
		@points > 100

	addBaddie: ()->
		if Math.random() > 0.5
			@baddies.push(new ChocolateConeBaddie(@))
		else
			@baddies.push(new ChocolatePopBaddie(@))

	addDrop: ()->
		@drops.push new PoisonDrop(@)