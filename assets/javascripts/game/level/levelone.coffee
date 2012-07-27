class LevelOne extends Level
	constructor: (game)->
		super('levelone',game)
		@dropLikelyhood = 0.99
		@addBaddie()
		
	addBaddie: ()->
		if Math.random() > 0.5
			@baddies.push(new BananaConeBaddie(@))
		else
			@baddies.push(new BananaPopBaddie(@))