class PistachioConeBaddie extends Baddie
	constructor: (level)->
		super('pistachioconebaddie',level)
		@yAcceleration = @yAcceleration * 1.5
		@points = @yAcceleration