extends Button

@export var selected_scene: PackedScene




func _on_button_up() -> void:
	Global.change_scene_to(selected_scene)
