class Entity
	@x
	@y
	@sprite
	@destroyed = false
	draw: ()->
		@game.context.drawImage(@sprite,@x,@y)