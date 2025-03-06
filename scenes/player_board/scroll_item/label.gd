extends Label
@export var focus_value: int
@export var default_value: String
signal property_changed(diff)
func _ready() -> void:
	text = default_value
	
func select_on() -> void:
	text = str(focus_value)
	
func select_off() -> void:
	text = default_value
	
func change_focus_value(diff:int) -> void:
	print(diff)
	focus_value += diff
	text = str(focus_value)
	property_changed.emit(diff)
	
