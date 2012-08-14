class LevelThree extends Level
	constructor: (game)->
		super('levelthree',game)
		@baseSpeed = 4
		@dropLikelyhood = 0.998
		@baddieLikelyhood = 0.96
		@addBaddie()

	checkPassed: ()->
		@points > 100

	addBaddie: ()->
		if Math.random() > 0.5
			@baddies.push(new StrawberryConeBaddie(@))
		else
			@baddies.push(new StrawberryPopBaddie(@))

	addDrop: ()->
		@drops.push new PoisonDrop(@)