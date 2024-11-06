extends Node2D

var items: Array
@export var dimension_card: PackedScene = preload("res://dimension_card/dimension_card.tscn")

var Constants = preload("res://constants/Constants.gd")


func _ready():
	var x = 0
	var x_scale = float(3) / items.size()
	#var x_scale = 1
	for item in items:
		var item_card = dimension_card.instantiate()
		item_card.card_details = item
		item_card.card_size = Constants.CARD_SIZE * Vector2(x_scale, 1)
		var card_x = Constants.CARD_POSITION.x + x * x_scale * Constants.CARD_SIZE.x + x * Constants.CARD_PADDING
		item_card.offset = Vector2(card_x, Constants.CARD_POSITION.y)
		x = x + 1
		add_child(item_card)


func _on_back_button_pressed():
	var main_scene = get_tree().root.get_node("Main")
	main_scene.show()
	
	# Remove the current suspect details scene from the tree
	queue_free()
