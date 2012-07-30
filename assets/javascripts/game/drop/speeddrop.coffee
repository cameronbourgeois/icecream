class SpeedDrop extends Drop
	constructor: (level)->
		super('speeddrop',level)
		@yAcceleration = 10
		@speedModifier = 1.75
	apply: ()->
		#if @level.speedModifier is 1
		@level.speedModifier = @speedModifier * @level.speedModifier
		window.setTimeout ()=>
			@level.speedModifier = @level.speedModifier / @speedModifier
		, 3000