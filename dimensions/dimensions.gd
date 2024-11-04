extends Node2D

var items: Array
var Constants = preload("res://constants/Constants.gd")
@export var dimension_card: PackedScene

func _ready():
	var x = 1
	for item in items:
		var item_card = dimension_card.instantiate()
		item_card.card_details = item
		item_card.offset = Vector2(x*Constants.CELL_SIZE*4, Constants.CELL_SIZE*2)
		x = x+1
		add_child(item_card)

func _on_back_button_pressed():
	var main_scene = get_tree().root.get_node("Main")  # Update with the actual path if different
	main_scene.show()

	# Remove the current suspect details scene from the tree
	queue_free()
