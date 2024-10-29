extends Node

signal marked(mark, row, column)

const Constants = preload("res://constants/Constants.gd")

var current_mode = Constants.BLANK_STATE
var row: int
var column: int

var clickable_modes = [Constants.BLANK_STATE, Constants.WRONG_MARK_STATE, Constants.CHECK_MARK_STATE]

func _on_button_pressed() -> void:
	var curr = clickable_modes.find(current_mode)
	if curr >= 0:
		var new_mode = clickable_modes[(curr + 1)%clickable_modes.size()]
		change_mode(new_mode)
		marked.emit(new_mode, row, column)

func change_mode(new_mode: String):
	current_mode = new_mode
	match new_mode:
		Constants.CHECK_MARK_STATE: 
			$AnimatedSprite2D.play(Constants.CHECK_MARK_STATE)
		Constants.WRONG_MARK_STATE:
			$AnimatedSprite2D.play(Constants.WRONG_MARK_STATE)
		Constants.DERIVED_WRONG_STATE:
			$AnimatedSprite2D.play(Constants.DERIVED_WRONG_STATE)
		_:
			$AnimatedSprite2D.play(Constants.BLANK_STATE)
