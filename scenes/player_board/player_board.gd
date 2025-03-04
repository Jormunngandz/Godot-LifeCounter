extends PanelContainer
var start_scroll_position

func _on_scroll_container_gui_input(event: InputEvent) -> void:
	#print(event.pressure)
	if event is InputEventScreenTouch:

		if event.is_pressed() and not start_scroll_position:
			start_scroll_position = get_viewport().get_mouse_position()
		if not event.is_pressed() and start_scroll_position:
			var drag_distance =  start_scroll_position.direction_to(get_viewport().get_mouse_position()).normalized()
			print(drag_distance)
			start_scroll_position = null
