extends Node

signal marked(mark, row, column)
var current_mode: String = "default"
var row: int
var column: int

var clickable_modes = ["default", "cross", "check"]

func _on_button_pressed() -> void:
	var curr = clickable_modes.find(current_mode)
	if curr >= 0:
		var new_mode = clickable_modes[(curr + 1)%clickable_modes.size()]
		change_mode(new_mode)
		marked.emit(new_mode, row, column)

func change_mode(new_mode: String):
	current_mode = new_mode
	match new_mode:
		"check": 
			$AnimatedSprite2D.play("check")
		"cross":
			$AnimatedSprite2D.play("cross")
		"derived_wrong":
			$AnimatedSprite2D.play("derived_wrong")
		_:
			$AnimatedSprite2D.play("default")

func _on_cell_marked(mark:int ,marked_row: int, marked_column: int):
	print(mark, marked_row, marked_column)
