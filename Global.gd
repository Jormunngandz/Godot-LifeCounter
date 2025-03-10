extends Node
var selected_layout: PackedScene = preload("res://scenes/playboard_presets/for_four_player/grid_container.tscn")
signal cd_menu_evoked
signal cd_menu_revoked
func change_scene_to(scene: PackedScene):
	selected_layout = scene
	get_tree().reload_current_scene()

func _ready() -> void:
	cd_menu_evoked.connect(show_player_labels)
	cd_menu_revoked.connect(hide_player_labels)
	
	
func show_player_labels():
	var playerboard = get_tree().get_nodes_in_group("player_board")
	for board in playerboard:
		board.player_number_label.modulate = Color(1,1,1,1)
	
	
func hide_player_labels():
	var playerboard = get_tree().get_nodes_in_group("player_board")
	for board in playerboard:
		if board.cd_menu and board.cd_menu.visible:
			return
	for board in playerboard:
		board.player_number_label.modulate = Color(1,1,1,0)
