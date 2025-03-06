extends Label
@export var change_value: int
@onready var controlled_item


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if not event.is_pressed():
			controlled_item.change_focus_value(change_value)
