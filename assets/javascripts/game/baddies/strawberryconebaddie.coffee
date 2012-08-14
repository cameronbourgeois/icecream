class StrawberryConeBaddie extends Baddie
	constructor: (level)->
		super('strawberryconebaddie',level)
		@yAcceleration = @yAcceleration * 1.5
		@points = @yAcceleration