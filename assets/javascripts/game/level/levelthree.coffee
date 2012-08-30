class LevelThree extends Level
	constructor: (game)->
		super('levelthree',game)
		@baseSpeed = 5
		@dropLikelyhood = 0.997
		@baddieLikelyhood = 0.95
		@addBaddie()

	checkPassed: ()->
		@points > 2500

	addBaddie: ()->
		if Math.random() > 0.5
			@baddies.push(new StrawberryConeBaddie(@))
		else
			@baddies.push(new StrawberryPopBaddie(@))

	addDrop: ()->
		if Math.random() < 0.7
			@drops.push new HealthDrop(@)
		else
			@drops.push new BombDrop(@)