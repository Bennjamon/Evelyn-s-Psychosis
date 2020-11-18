extends Area2D

export var texture: Texture

func _ready():
	$Sprite.texture = texture
