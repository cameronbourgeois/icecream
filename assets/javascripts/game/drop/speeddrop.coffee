class SpeedDrop extends Drop
	constructor: (level)->
		super('speeddrop',level)
		@speedModifier = 1.75
	apply: ()->
		@level.speedModifier = @speedModifier * @level.speedModifier
		window.setTimeout ()=>
			@level.speedModifier = @level.speedModifier / @speedModifier
		, 3000