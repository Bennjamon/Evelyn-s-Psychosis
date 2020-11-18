extends Node2D

class_name Room

var json
var texture

func _init(roomName: String):
	var file = File.new()
	file.open("res://Mapas/" + roomName + ".json", File.READ)
	json = JSON.parse(file.get_as_text()).result
	print(file.file_exists(json.tilesets[0].image))
	var img = Image.new()
	img.load(json.tilesets[0].image)
	img.resize(500, 500)
	texture = ImageTexture.new()
	texture.create_from_image(img)

func _ready():
	var sprite = Sprite.new()
	sprite.name = "Sprite"
	add_child(sprite)
	var area2d = Area2D.new()
	area2d.name = "Colisiones"
	add_child(area2d)
	$Sprite.texture = texture
	for layer in json.layers:
		if layer.name == "colisiones":
			for shape in layer.objects:
				var colision: CollisionPolygon2D
				if shape.height == 0 and shape.width == 0:
					colision = CollisionPolygon2D.new()
					for pos in shape.polygon:
						colision.polygon.append(Vector2(pos.x, pos.y))
					draw_polygon(colision.polygon, PoolColorArray([Color(255, 0, 0)]))
				var area = Area2D.new()
				area.position = Vector2(shape.x, shape.y)
				area.add_child(colision)
				area.add_to_group("colision")
				area.connect("body_entered", self, "col")
				$Colisiones.add_child(area)

func move(vel: Vector2):
	move2($".", vel)

func move2(child: Node, vel: Vector2):
	for child2 in child.get_children():
		move2(child2, vel)
	child.position -= vel

func col(b):
	print(b.name)
