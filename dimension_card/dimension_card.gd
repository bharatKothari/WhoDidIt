extends Control

var is_flipped = false
var card_details: Dictionary
var card_size: Vector2 = Vector2(300, 300)
var offset = Vector2(150, 150)

func _ready() -> void:
	print("here")
	position = offset
	#$FrontButton/FrontInfo.text = card_details["name"]
	#var text = ""
	#for key in card_details["details"].keys():
		#text += str(key) + ": " + str(card_details["details"][key]) + "\n"
	#$BackButton/BackInfo.text = text
	$FrontButton.size = card_size
	$BackButton.size = card_size
	$BackButton.visible = is_flipped

func _on_info_card_pressed():
	print($FrontButton.visible, $BackButton.visible)
	is_flipped = !is_flipped
	var tween = get_tree().create_tween()
	tween.parallel().tween_property(self, "scale", Vector2(0, 1), 0.25)
	tween.parallel().tween_property(self, "position", Vector2(offset.x + card_size.x / 2, offset.y + 20), 0.25)
	_toggle_content_visibility()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.25)
	tween.parallel().tween_property(self, "position", offset, 0.25)

func _toggle_content_visibility():
	$FrontButton.visible = not is_flipped
	$BackButton.visible = is_flipped
