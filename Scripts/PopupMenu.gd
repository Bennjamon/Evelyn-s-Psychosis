extends Sprite

export (PackedScene) var Slot
var pressed = false
var hand

func _ready():
	global_position = Vector2(512, 300)
	var img = ImageTexture.new()
	img.load("res://sprites/inv/inv.png")
	img.set_size_override(Vector2(550, 450))
	texture = img
	for i in range(4):
		for j in range(5):
			var slot = Slot.instance()
			slot.rect_position = Vector2(45*j + 5 - 137.5, 45*i + 5 - 80)
			$Area2D.add_child(slot)
	add("res://icon.png", "Icon")

func _process(delta):
	if Input.is_key_pressed(KEY_TAB):
		if !pressed:
			pressed = true
			visible = !visible
			if !visible and MainSingleton.item != null:
				add(MainSingleton.item.texture, MainSingleton.item.name)
				MainSingleton.item = null
				$CanvasLayer/Sprite.texture = ImageTexture.new()
	else:
		pressed = false
	if visible:
		if MainSingleton.item != null:
			if hand != MainSingleton.item.texture:
				hand = MainSingleton.item.texture
				var img = ImageTexture.new()
				img.load(MainSingleton.item.texture)
				img.set_size_override(Vector2(100, 100))
				$CanvasLayer/Sprite.texture = img
		elif MainSingleton.item == null:
			hand = ""
			$CanvasLayer/Sprite.texture = ImageTexture.new()
	$CanvasLayer/Sprite.global_position = get_global_mouse_position()

func add(texture, itemName):
	for i in range(len($Area2D.get_children())):
		if $Area2D.get_child(i).empty:
			$Area2D.get_child(i).llenar(texture, itemName)
			return true
	if $Panel/Slot.empty:
		$Panel/Slot.llenar(texture, itemName)
		return true
	else:
		return false
