extends PanelContainer
@export var opponent_board: PanelContainer
@onready var board: HBoxContainer = %HBoxContainer
@onready var commander_unit_menu_class: PackedScene = preload("res://scenes/commander_damage_menu/commander_unit/commander_unit.tscn")

func _ready() -> void:
	for player_board in get_tree().get_nodes_in_group("player_board"):
		if player_board.player_number != get_parent().player_number:
			var cd_unit = commander_unit_menu_class.instantiate()
			cd_unit.controlled_op_hp = player_board.scroll_container.player_heals
			board.add_child(cd_unit)
			cd_unit.player_number.text = str(player_board.player_number)


func _on_button_button_up() -> void:
	visible = false
	Global.cd_menu_revoked.emit()
