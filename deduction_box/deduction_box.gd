class_name DeductionBox
extends Node2D

var level_details: JSON

@export var DeductionCell: PackedScene
@export var grid_size: int = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_deduction_grid()

func create_deduction_grid():
	var cell_size = Vector2(64, 64)
	for row in range(grid_size):
		for column in range(grid_size):
			var cell_instance = DeductionCell.instantiate()
			
			var x_pos = column * cell_size.x
			var y_pos = row * cell_size.y
			cell_instance.position = Vector2(x_pos, y_pos)
			
			cell_instance.row = row
			cell_instance.column = column
			
			cell_instance.connect("marked", _on_cell_marked)
			add_child(cell_instance)

func _on_cell_marked(mark:String ,marked_row: int, marked_column: int):
	for cell in get_children():
		if (cell.row == marked_row or cell.column == marked_column) and !(cell.row == marked_row and cell.column == marked_column):
			if mark=="check":
				cell.change_mode("derived_wrong")
			elif mark=="default":
				cell.change_mode("default")
