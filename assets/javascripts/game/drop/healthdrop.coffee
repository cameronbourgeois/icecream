class HealthDrop extends Drop
	constructor: (level)->
		super('healthdrop',level)
	apply: ()->
		@level.player.replenishHealth()