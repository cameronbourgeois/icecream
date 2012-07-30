class SlowDrop extends Drop
	constructor: (level)->
		super('slowdrop',level)
		@yAcceleration = 10
		@speedModifier = 0.5
	apply: ()->
		#if @level.speedModifier is 1
		@level.speedModifier = @speedModifier * @level.speedModifier
		window.setTimeout ()=>
			@level.speedModifier = @level.speedModifier / @speedModifier
		, 3000