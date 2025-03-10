extends Label
@export var focus_value: int
@export var default_value: String
@export var min_value: int = -999
@export var max_value: int = 999
signal property_changed(label, diff)
func _ready() -> void:
	text = default_value
	
func select_on() -> void:
	text = str(focus_value)
	
func select_off() -> void:
	text = default_value
	
func change_focus_value(diff:int) -> void:
	if focus_value + diff >= min_value and focus_value + diff <= max_value:
		focus_value += diff
		text = str(focus_value)
		property_changed.emit(self, diff)
	
