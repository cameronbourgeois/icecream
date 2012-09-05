class Sprite
	@x
	@y
	@destroyed = false
	constructor: (handle,level)->
		@handle = handle
		@level = level
		@sprite = window.getImage(handle)
		@width = @sprite.width
		@height = @sprite.height
	draw: ()->
		@level.context.drawImage(@sprite,@x,@y)
	destroy: ()->
		@destroyed = true