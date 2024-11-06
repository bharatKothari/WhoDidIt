extends Control

var is_flipped = false
var card_details: Dictionary
var card_size: Vector2
var offset: Vector2

var Constants = preload("res://constants/Constants.gd")

func _ready() -> void:
	position = offset
	$CardButton/FrontInfo.text = card_details["name"]
	var text = ""
	for key in card_details["details"].keys():
		text += str(key) + ": " + str(card_details["details"][key]) + "\n"
	$CardButton/BackInfo.text = text
	$CardButton.size = card_size
	$CardButton/BackInfo.visible = is_flipped


func _on_info_card_pressed():
	#print($FrontButton.visible, $BackButton.visible)
	is_flipped = !is_flipped
	var tween = get_tree().create_tween()
	
	# Scale Down
	tween.parallel().tween_property(self, "scale",
		Vector2(0, 1), Constants.FLIP_ANIMATION_SPEED)
	tween.parallel().tween_property(self, "position",
		Vector2(offset.x + card_size.x / 2, offset.y + 20), Constants.FLIP_ANIMATION_SPEED)
	
	_toggle_content_visibility()
	
	# Scale Up
	tween.tween_property(self, "scale", 
		Vector2(1, 1), Constants.FLIP_ANIMATION_SPEED)
	tween.parallel().tween_property(self, "position", 
		offset, Constants.FLIP_ANIMATION_SPEED)


func _toggle_content_visibility():
	$CardButton/FrontInfo.visible = not is_flipped
	$CardButton/BackInfo.visible = is_flipped
