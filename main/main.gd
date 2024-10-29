extends Node

@export var DimensionIcon: PackedScene = preload("res://dimension_icons/dimension_icon.tscn")
const Constants = preload("res://constants/Constants.gd")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var level_details = get_level_details()
	var dimensions = level_details[Constants.DIMENSIONS].size()
	var box_size = level_details[Constants.DIMENSIONS][Constants.SUSPECTS].size()
	
	add_deduction_grid(dimensions, box_size)
	add_dimension_icons(dimensions, box_size, level_details)
	
func add_deduction_grid(dimensions: int, box_size: int):
	get_child(0).create_deduction_grid(dimensions, box_size)
	
func add_dimension_icons(dimensions: int, box_size: int, level_details: Dictionary):
	var pos = 0
	for i in range(dimensions - 1):
		var dimension = level_details[Constants.DIMENSIONS][Constants.DIMENSION_LIST[i]]
		for object in dimension:
			add_dimension_icon(object.name, Vector2($DeductionGrid.position.x + pos * Constants.CELL_SIZE, $DeductionGrid.position.y - Constants.CELL_SIZE))
			pos += 1
	
	pos = 0
	for i in range(dimensions - 1, 0, -1):
		var dimension = level_details[Constants.DIMENSIONS][Constants.DIMENSION_LIST[i]]
		for object in dimension:
			add_dimension_icon(object.name, Vector2($DeductionGrid.position.x - Constants.CELL_SIZE, $DeductionGrid.position.y + pos * Constants.CELL_SIZE))
			pos += 1


func add_dimension_icon(text: String, position: Vector2) -> void:
	var di = DimensionIcon.instantiate()
	di.get_child(0).text = text
	di.position = position
	add_child(di)

func get_level_details() -> Dictionary:
	var file = "res://assets/level_details.json"
	var level_text = FileAccess.get_file_as_string(file)
	return JSON.parse_string(level_text)
