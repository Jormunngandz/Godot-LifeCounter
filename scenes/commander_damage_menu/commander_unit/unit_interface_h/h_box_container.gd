extends HBoxContainer
@onready var commander_damage: Label = %CD
@onready var controll_add: Label = %ContorllerAdd
@onready var controll_sub: Label = %ContorllerSub
var controlled_op_hp: Label

func _ready() -> void:
	commander_damage.select_on()
	controll_add.controlled_item = commander_damage
	controll_sub.controlled_item = commander_damage
	commander_damage.property_changed.connect(change_opponent_hp)


func change_opponent_hp(diff):
	controlled_op_hp.change_focus_value(-1 * diff)
