extends Button
@export var change_value: int
@onready var controlled_item
var pressed_btn: bool = false
var been_pressed: bool = false


func _on_button_up() -> void:
	pressed_btn = false
	if not been_pressed:
		controlled_item.change_focus_value(change_value)
	been_pressed = false
	$Timer.wait_time = 1

func _on_button_down() -> void:
	pressed_btn = true
	$Timer.start()


func _on_timer_timeout() -> void:
	if pressed_btn:
		if been_pressed:
			$Timer.wait_time = 0.5
		been_pressed = true
		controlled_item.change_focus_value(change_value * 10)
		$Timer.start()
