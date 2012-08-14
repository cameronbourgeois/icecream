class SlowDrop extends Drop
	constructor: (level)->
		super('slowdrop',level)
		@speedModifier = 0.5
	apply: ()->
		super()
		@level.speedModifier = @speedModifier * @level.speedModifier
		window.setTimeout ()=>
			@level.speedModifier = @level.speedModifier / @speedModifier
		, 3000