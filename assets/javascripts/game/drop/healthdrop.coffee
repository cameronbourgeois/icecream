class HealthDrop extends Drop
	constructor: (level)->
		super('healthdrop',level)
	apply: ()->
		super()
		@level.player.replenishHealth()