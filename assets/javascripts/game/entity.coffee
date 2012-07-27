class Entity
	@x
	@y
	@sprite
	@destroyed = false
	draw: ()->
		@level.context.drawImage(@sprite,@x,@y)