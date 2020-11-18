extends Node2D

var puerta = false
var baniera = false
var inodoro = false

func _ready():
	$E.hide()

func _process(delta):
	if puerta:
		if Input.is_action_pressed("e"):
			get_tree().change_scene("res://Escenas/Animación.tscn")
	if baniera:
		if Input.is_action_pressed("e"):
			get_tree().change_scene("res://Escenas/Animación.tscn")
	if inodoro:
		if Input.is_action_pressed("e"):
			get_tree().change_scene("res://Escenas/Animación.tscn")

func _on_Puerta_body_entered(body):
	if body.is_in_group("Player"):
		$E.position = $Puerta.global_position
		$E.show()
		puerta = true

func _on_Puerta_body_exited(body):
	if body.is_in_group("Player"):
		$E.hide()
		puerta = false

func _on_Baniera_body_entered(body):
	if body.is_in_group("Player"):
		$E.position = $Baniera.global_position
		$E.show()
		baniera = true

func _on_Baniera_body_exited(body):
	if body.is_in_group("Player"):
		$E.hide()
		baniera = false

func _on_Inodoro_body_entered(body):
	if body.is_in_group("Player"):
		$E.position = $Inodoro.global_position
		$E.show()
		inodoro = true

func _on_Inodoro_body_exited(body):
	if body.is_in_group("Player"):
		$E.hide()
		inodoro = false
