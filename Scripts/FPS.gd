extends Node2D
var rt = 0
var ur = 0
var fps = 0

func _process(delta):
	rt += delta
	fps += 1
	if rt - ur > 1:
		ur = rt
		$CanvasLayer/Label.text = str(fps) + " FPS"
		fps = 0
