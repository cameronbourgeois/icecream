class LifeDrop extends Drop
	constructor: (level)->
		super('lifedrop',level)
		@yAcceleration = 12
	apply: ()->
		@level.player.addLife()