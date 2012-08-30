class LevelTwo extends Level
	constructor: (game)->
		super('leveltwo',game)
		@baseSpeed = 4
		@dropLikelyhood = 0.998
		@baddieLikelyhood = 0.97
		@addBaddie()
		
	checkPassed: ()->
		@points > 2500

	addBaddie: ()->
		if Math.random() > 0.5
			@baddies.push(new PistachioConeBaddie(@))
		else
			@baddies.push(new PistachioPopBaddie(@))

	addDrop: ()->
		if Math.random() < 0.7
			@drops.push new HealthDrop(@)	
		else
  			@drops.push new PoisonDrop(@)