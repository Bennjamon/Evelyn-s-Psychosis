extends Area2D

export var itemName: String
export var texture: String
export var size: Vector2
export var pos: Vector2
export var interact: String 
export var groupsInteract: PoolStringArray
var colision = false
var jugador
onready var E = get_parent().get_parent().get_node("E")
func _ready():
	position = pos
	var img = ImageTexture.new()
	img.load(texture)
	img.set_size_override(size)
	$Sprite.texture = img
	var rectangle = RectangleShape2D.new()
	rectangle.extents = size
	$CollisionShape2D.shape = rectangle
	$CollisionShape2D.position -= Vector2(size.x/2, size.y/2)

func _on_Item_body_entered(body: Node):
	if body.is_in_group("Player"):
		colision = true
		jugador = body
		E.position = global_position - Vector2(0, (size.y/4)*3)
		E.show()
	elif body.is_in_group("MapObject"):
		for i in range(len(groupsInteract)):
			if body.is_in_group(groupsInteract[i]):
				body.call(interact)

func _on_Item_body_exited(body):
	colision = false
	E.hide()

func _process(delta):
	if colision and Input.is_key_pressed(KEY_E):
		if jugador.get_node("PopupMenu").add(texture, itemName):
			queue_free() 
