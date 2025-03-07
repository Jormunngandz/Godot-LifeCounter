extends PanelContainer
@onready var option_class: PackedScene = preload("res://scenes/board_menu/panel_container.tscn")

func _ready() -> void:
	var players_layout = Global.selected_layout.instantiate()
	if DisplayServer.screen_get_orientation() != players_layout.layout_orientation:
		print('change screen orientation')
		DisplayServer.screen_set_orientation(players_layout.layout_orientation)
		get_viewport().size = Vector2(get_viewport().size.y, get_viewport().size.x)
		var timer = get_tree().create_timer(1)
		await timer.timeout
	#
	add_child(players_layout)
	move_child(players_layout, 0)


func _on_texture_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		%PanelContainer.visible = true
