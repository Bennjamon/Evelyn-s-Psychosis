extends ColorRect

var distance = 66.666
var rgb = 1
var velocity = 3
var advanced = 0
var start = false
var dir = 0
var finish = false
func _process(delta):
	if not finish:
		if $Sprite.position.x < 512:
			if dir == -1 and start:
				$Sprite.position.x = 512
				finish = true
			dir = 1
			if advanced < distance:
				start = true
				$Sprite.position.x += distance*delta*velocity
				advanced += distance*delta*velocity
			elif round($Sprite.position.x) <= -99 and start:
				start = false
				advanced = 0
				distance += 133.333
				$Sprite.position.x = 1123
			else:
				$Sprite.position.x -= distance*delta*velocity
		elif $Sprite.position.x > 512:
			if dir == 1 and start:
				$Sprite.position.x = 512
				finish = true
			dir = -1
			if advanced < distance:
				start = true
				$Sprite.position.x -= distance*delta*velocity
				advanced += distance*delta*velocity
			elif round($Sprite.position.x) >= 1123 and start:
				start = false
				advanced = 0
				distance += 133.333
				$Sprite.position.x = -99
			else:
				$Sprite.position.x += distance*delta*velocity
	elif rgb > 0:
		rgb -= delta
		$Label.set("custom_colors/font_color",Color(rgb, rgb, rgb))
	else:
		get_tree().change_scene("res://Escenas/Casa Evelyn/Banio Evelyn.tscn")
