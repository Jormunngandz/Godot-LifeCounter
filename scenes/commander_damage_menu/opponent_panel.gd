extends PanelContainer
@export var opponent_board: PanelContainer
@onready var board: GridContainer = %GridContainer
@onready var commander_unit_menu_class: PackedScene = preload("res://scenes/commander_damage_menu/commander_unit/v_box_container.tscn")

func _ready() -> void:
	for i in range(3):
		board.add_child(commander_unit_menu_class.instantiate())
