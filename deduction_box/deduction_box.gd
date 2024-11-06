extends Node2D

@export var DeductionCell: PackedScene = preload("res://deduction_cell/deduction_cell.tscn")

const Constants = preload("res://constants/Constants.gd")


func create_deduction_box(box_size: int):
	for row in range(box_size):
		for column in range(box_size):
			var cell_instance = DeductionCell.instantiate()

			cell_instance.position = Vector2(column * Constants.CELL_SIZE, row * Constants.CELL_SIZE)
			cell_instance.row = row
			cell_instance.column = column
			
			cell_instance.connect(Constants.MARKED_SIGNAL, _on_cell_marked)
			add_child(cell_instance)


func _on_cell_marked(mark: String ,marked_row: int, marked_column: int):
	for cell in get_children():
		if (cell.row == marked_row or cell.column == marked_column) and !(cell.row == marked_row and cell.column == marked_column):
			if mark==Constants.CHECK_MARK_STATE:
				cell.change_mode(Constants.DERIVED_WRONG_STATE)
			elif mark==Constants.BLANK_STATE:
				cell.change_mode(Constants.BLANK_STATE)
