class LicoriceConeBaddie extends Baddie
	constructor: (level)->
		super('licoriceconebaddie',level)
		@yAcceleration = @yAcceleration * 1.5
		@points = @yAcceleration