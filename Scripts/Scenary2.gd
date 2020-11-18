extends Node2D

var room

func _physics_process(delta):
	if room != null:
		room.move($KinematicBody2D.velocidad.normalized()*$KinematicBody2D.vel_mov*delta)

func _ready():
	change_room("Banio")

func change_room(name):
	if len($Node2D.get_children()) == 1:
		$Node2D.remove_child($Node2D.get_child(0))
	room = Room.new("Banio")
	$Node2D.add_child(room)
	print($Node2D.get_child(0).get_child_count())
