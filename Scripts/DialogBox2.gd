extends RichTextLabel

var saying = false
var pressed = false

func _ready():
	say('hola')

func say(dialog):
	print(typeof(dialog) == TYPE_STRING)
	print(typeof(dialog) == TYPE_ARRAY)
	get_parent().show()
	saying = true
	text = dialog
	set_visible_characters(0)
	$Timer.start()

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	if get_visible_characters() < len(text):
		$Timer.start()
	else: 
		saying = false

func _process(delta):
	if Input.is_key_pressed(KEY_E):
		if not pressed:
			pressed = true
			if saying:
				saying = false
				set_visible_characters(len(text))
			else:
				text = ''
				get_parent().hide()
	else:
		pressed = false
