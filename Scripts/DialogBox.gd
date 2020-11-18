extends RichTextLabel

var dialogo = ["Dialogo 1","Dialogo 2","Dialogo 3"]
var pagina = 0

func _ready():
	set_bbcode(dialogo[pagina])
	set_visible_characters(0)
	set_process_input(true)
func _process(delta):
	inputs()

func inputs():
	if Input.is_action_just_pressed("e"):
		if get_visible_characters() > get_total_character_count():
			if pagina < dialogo.size()-1:
				pagina += 1
				set_bbcode(dialogo[pagina])
				set_visible_characters(0)

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
