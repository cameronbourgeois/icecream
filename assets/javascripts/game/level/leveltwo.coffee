class LevelTwo extends Level
	constructor: (game)->
		super('leveltwo',game)
		@baseSpeed = 4
		@dropLikelyhood = 0.998
		@baddieLikelyhood = 0.96
		@addBaddie()
		
	checkPassed: ()->
		@points > 100

	addBaddie: ()->
		if Math.random() > 0.5
			@baddies.push(new PistachioConeBaddie(@))
		else
			@baddies.push(new PistachioPopBaddie(@))

	addDrop: ()->
		@drops.push new PoisonDrop(@)