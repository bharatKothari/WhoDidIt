extends Node2D

@export var DeductionBox: PackedScene = preload("res://deduction_box/deduction_box.tscn")

const Constants = preload("res://constants/Constants.gd")


func create_deduction_grid(dimensions: int, box_size: int):
	for i in range(dimensions - 1):
		for j in range(dimensions - i - 1):
			var deductionBox = DeductionBox.instantiate()
			deductionBox.position = Vector2(j * box_size * Constants.CELL_SIZE, i * box_size * Constants.CELL_SIZE)
			deductionBox.create_deduction_box(box_size)
			add_child(deductionBox)
