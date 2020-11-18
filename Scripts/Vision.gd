extends Area2D

var key;
var keys = [
	{
		"name": "Q", 
		"key":KEY_Q
	},
	{
		"name": "W",
		"key": KEY_W
	},
	{
		"name": "E",
		"key": KEY_E
	},
	{
		"name": "A",
		"key": KEY_A
	},
	{
		"name": "S",
		"key": KEY_D
	},
	{
		"name": "D",
		"key": KEY_D
	}
]
var init = false
var time: float
var velocity = 150
var player: KinematicBody2D
var paused = false

func _ready():
	randomize()
	$Timer.wait_time = 10
	key = keys[floor(rand_range(0, len(keys)))]
	player = get_parent().get_node("Jugador")


func _on_Vision_body_entered(body):
	if body.is_in_group("Player"):
		position = Vector2(0, 0)
		
		$Timer.start(-1)
		player.vel_mov = 0
		init = true

func _process(delta):
	seguir(delta)
	if init and Input.is_key_pressed(key.key):
		init = false
		player.vel_mov = 300
		$Timer.stop()
	elif init:
		print("press '" + key.name + "' ||  " + str($Timer.time_left))

func seguir(delta):
	if player != null and not init:
		var distance = player.position - position
		position += distance.normalized()*delta*velocity

func _on_Timer_timeout():
	get_tree().quit()
