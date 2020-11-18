extends KinematicBody2D

class_name Player

var vel_mov = 300
var velocidad = Vector2()

var col_arriba: bool
var col_abajo: bool
var col_izquierda: bool
var col_derecha: bool

var lastItem


func get_input():
	velocidad = Vector2()
#	print(col_abajo or col_arriba or col_izquierda or col_derecha)
	if Input.is_action_pressed('ui_right'):
		velocidad.x += 1
	if Input.is_action_pressed('ui_left'):
		velocidad.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocidad.y += 1
	if Input.is_action_pressed('ui_up'):
		velocidad.y -= 1
	velocidad = velocidad.normalized() * vel_mov

func anim():
	if velocidad.x > 0:
		$AnimatedSprite.animation = "Walk"
		$AnimatedSprite.flip_h = false
	if velocidad.y > 0:
		$AnimatedSprite.animation = "Walk"
		$AnimatedSprite.flip_h = false
	if velocidad.y < 0:
		$AnimatedSprite.animation = "Walk"
		$AnimatedSprite.flip_h = false
	if velocidad.x < 0:
		$AnimatedSprite.animation = "Walk"
		$AnimatedSprite.flip_h = true
	if velocidad.x == 0 and velocidad.y == 0:
		$AnimatedSprite.animation = "Idle"
		$AnimatedSprite.flip_h = false


func _physics_process(delta):
	if not $PopupMenu.visible:
		get_input()
		anim()
#		if not $PopupMenu/Panel/Slot.empty:
#			lastItem = $PopupMenu/Panel/Slot.name

func _ready():
	reset()

func reset():
	position = OS.get_real_window_size()/2
	col_arriba = false
	col_abajo = false
	col_izquierda = false
	col_derecha = false

func _on_arriba_area_entered(area: Area2D):
	if area.is_in_group("colision"):
		col_arriba = true

func _on_arriba_area_exited(area: Area2D):
	if area.is_in_group("colision"):
		col_arriba = false

func _on_abajo_area_entered(area: Area2D):
	if area.is_in_group("colision"):
		col_abajo = true

func _on_abajo_area_exited(area: Area2D):
	if area.is_in_group("colision"):
		col_abajo = false

func _on_izquierda_area_entered(area: Area2D):
	if area.is_in_group("colision"):
		col_izquierda = true

func _on_izquierda_area_exited(area: Area2D):
	if area.is_in_group("colision"):
		col_izquierda = false

func _on_derecha_area_entered(area: Area2D):
	if area.is_in_group("colision"):
		col_derecha = true

func _on_derecha_area_exited(area: Area2D):
	if area.is_in_group("colision"):
		col_derecha = true
