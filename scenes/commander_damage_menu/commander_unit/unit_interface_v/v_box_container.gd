extends VBoxContainer
@onready var commander_damage: Label = %CD
@onready var controll_add: Button = %ContorllerAdd
@onready var controll_sub: Button = %ContorllerSub
var controlled_op_hp: Label

func _ready() -> void:
	commander_damage.select_on()
	#player_number.text = get_index() + 1 if get_parent().player_number != get_index() + 1 else 
	controll_add.controlled_item = commander_damage
	controll_sub.controlled_item = commander_damage
	commander_damage.property_changed.connect(change_opponent_hp)


func change_opponent_hp(label, diff):
	controlled_op_hp.change_focus_value(-1 * diff)
