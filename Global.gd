extends Node
var selected_layout: PackedScene = preload("res://scenes/playboard_presets/for_four_player/grid_container.tscn")
func change_scene_to(scene: PackedScene):
	selected_layout = scene
	get_tree().reload_current_scene()
