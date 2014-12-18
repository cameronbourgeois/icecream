class BananaConeBaddie extends Baddie
	constructor: (level)->
		super('bananaconebaddie',level)
		@yAcceleration = @yAcceleration * 1.5
		@points = @yAcceleration