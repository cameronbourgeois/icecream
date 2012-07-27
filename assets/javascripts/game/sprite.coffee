class Sprite
	@x
	@y
	@destroyed = false
	constructor: (handle,level)->
		@level = level
		@sprite = window.assets.getAsset(window.asset_map[handle])
		@width = @sprite.width
		@height = @sprite.height
	draw: ()->
		@level.context.drawImage(@sprite,@x,@y)
	destroy: ()->
		@destroyed = true