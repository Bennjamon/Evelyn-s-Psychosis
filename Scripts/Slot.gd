extends TextureButton

var empty = true
var itemName
var texture
var item

func _on_Slot_mouse_entered():
	if !empty:
		$CanvasLayer/Panel.visible = true

func llenar(Argtexture: String, ArgitemName: String):
	var textureImg = ImageTexture.new()
	textureImg.load(Argtexture)
	textureImg.set_size_override(Vector2(40, 40))
	$".".texture_normal = textureImg
	$".".texture_hover = textureImg
	$CanvasLayer/Panel/Label.text = ArgitemName
	$CanvasLayer/Panel.rect_size = $CanvasLayer/Panel/Label.rect_size
	empty = false
	itemName = ArgitemName
	texture = Argtexture

func _ready():
	reset()

func reset():
	var textureImg = ImageTexture.new()
	textureImg.load("res://sprites/slot/slot normal.png")
	textureImg.set_size_override(Vector2(40, 40))
	$".".texture_normal = textureImg
	var textureImgHover = ImageTexture.new()
	textureImgHover.load("res://sprites/slot/slot hover.png")
	textureImgHover.set_size_override(Vector2(40, 40))
	$".".texture_hover = textureImgHover

func _process(delta):
	if $CanvasLayer/Panel.visible:
		$CanvasLayer/Panel.rect_position = get_global_mouse_position() + Vector2(15, 0)
	if !get_parent().get_parent().visible:
		$CanvasLayer/Panel.visible = false

func _on_Slot_mouse_exited():
	$CanvasLayer/Panel.visible = false

func _on_Slot_pressed():
	if !empty and MainSingleton.item != null:
		var tt = texture
		var nt = itemName
		llenar(MainSingleton.item.texture, MainSingleton.item.name)
		MainSingleton.item = {
			"name": nt,
			"texture": tt
		}
	elif !empty:
		MainSingleton.item = {
			"name": itemName,
			"texture": texture
		}
		empty = true
		reset()
	elif MainSingleton.item != null:
		llenar(MainSingleton.item.texture, MainSingleton.item.name)
		MainSingleton.item = null
