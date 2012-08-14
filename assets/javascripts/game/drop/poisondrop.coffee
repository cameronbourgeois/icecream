class PoisonDrop extends Drop
	constructor: (level)->
		super('poisondrop',level)
	apply: ()->
		super()
		@level.player.damageHealth()