class ChocolateConeBaddie extends Baddie
	constructor: (level)->
		super('chocolateconebaddie',level)
		@yAcceleration = @yAcceleration * 1.5
		@points = @yAcceleration