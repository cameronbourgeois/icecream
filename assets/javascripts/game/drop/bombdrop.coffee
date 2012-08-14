class BombDrop extends Drop
	constructor: (level)->
		super('bombdrop',level)
	apply: ()->
		super()
		for baddie in @level.baddies
			baddie.destroy()