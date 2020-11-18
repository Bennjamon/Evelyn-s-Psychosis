extends Area2D

export var texture: Texture

func _ready():
	$Sprite.texture = texture
	$Sprite.scale.x = 3.591
	$Sprite.scale.y = 3.591
