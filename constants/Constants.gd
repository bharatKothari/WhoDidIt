# Constants.gd

extends Node

# Deduction Cell Constants
const CELL_SIZE = 64

# Deduction Cell State Constants
const DERIVED_WRONG_STATE = "derived_wrong"
const CHECK_MARK_STATE = "check"
const WRONG_MARK_STATE = "wrong"
const BLANK_STATE = "blank"

# Deduction Cell Signal Constants
const MARKED_SIGNAL = "marked"

# Dimension Constants
const DIMENSIONS = "dimensions"
const SUSPECTS = "suspects"
const WEAPONS = "weapons"
const PLACES = "places"
const MOTIVES = "motives"
const DIMENSION_LIST = [SUSPECTS, WEAPONS, PLACES, MOTIVES]

# Dimension Card Constants
const CARD_SIZE = Vector2(300, 400)
const CARD_POSITION = Vector2(150, 150)
const CARD_PADDING = 30
const FLIP_ANIMATION_SPEED = 0.25
