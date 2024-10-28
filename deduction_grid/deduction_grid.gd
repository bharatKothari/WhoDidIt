extends Node2D

@export var DeductionBox: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var file = "res://assets/level_details.json"
	var level_text = FileAccess.get_file_as_string(file)
	var level_details = JSON.parse_string(level_text)
	var no_of_boxes = level_details.size()
	create_deduction_box(no_of_boxes)


func create_deduction_box(boxes: int):
	var deductionBox1 = DeductionBox.instantiate()
	deductionBox1.grid_size = 4
	var deductionBox2 = DeductionBox.instantiate()
	deductionBox2.grid_size = 4
	var deductionBox3 = DeductionBox.instantiate()
	deductionBox3.grid_size = 4
	
	deductionBox2.position = Vector2(0,deductionBox2.grid_size*64)
	deductionBox3.position = Vector2(deductionBox2.grid_size*64,0)
	
	add_child(deductionBox1)
	add_child(deductionBox2)
	add_child(deductionBox3)
	
