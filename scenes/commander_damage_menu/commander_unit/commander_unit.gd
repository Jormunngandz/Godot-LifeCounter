extends PanelContainer
#@onready var commander_damage: Label = %CD
var controlled_op_hp: Label
@onready var player_number: Label = %player_number
@onready var h_interface: PackedScene = preload("res://scenes/commander_damage_menu/commander_unit/unit_interface_h/h_box_container.tscn")
@onready var v_interface: PackedScene = preload("res://scenes/commander_damage_menu/commander_unit/unit_interface_v/v_box_container.tscn")

#@onready var controll_add: Label = $VBoxContainer/ContorllerAdd
#@onready var controll_sub: Label = $VBoxContainer/ContorllerSub

func _ready() -> void:
	var new_interface
	if len(get_tree().get_nodes_in_group("player_board")) > 2:
		new_interface = v_interface.instantiate()
	else:
		new_interface = h_interface.instantiate()
	new_interface.controlled_op_hp = controlled_op_hp
	add_child(new_interface)
#func _ready() -> void:
	#commander_damage.select_on()
	##player_number.text = get_index() + 1 if get_parent().player_number != get_index() + 1 else 
	#controll_add.controlled_item = commander_damage
	#controll_sub.controlled_item = commander_damage
	#commander_damage.property_changed.connect(change_opponent_hp)
	
	#change_focus_value


	
