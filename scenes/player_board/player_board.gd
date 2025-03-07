extends PanelContainer
@onready var commander_damage_menu_class: PackedScene = preload("res://scenes/commander_damage_menu/panel_container.tscn")
@onready var scroll_container: ScrollContainer = %ScrollContainer
var selected_label
@onready var controller_add = %ControllerAdd
@onready var controller_sub = %ControllerSub
@onready var item_change_label = %DIFF
var current_value = 0
var diff_timer: SceneTreeTimer
var player_number : int = 0
var cd_menu: PanelContainer
@export var flipped: int = 0
func _ready() -> void:
	
	player_number = get_tree().get_nodes_in_group("player_board").find(self, 0) + 1
	%player_label.text = str(player_number)
	$Timer.timeout.connect(reset_current)
	scroll_container.item_changed.connect(new_item_changed)
	scroll_container.set_v_scroll(0)
	call_deferred("flip_check")
				
func flip_check():
	if flipped:
		
		pivot_offset = size / 2
		set_rotation_degrees(flipped)

func change_diff(value):
	item_change_label.modulate = Color(1,1,1,1)
	current_value += value
	item_change_label.text = str(current_value)
	$Timer.start()
	
func reset_current():
	item_change_label.modulate = Color(1,1,1,0)
	current_value = 0

func new_item_changed(new_label):
	selected_label = new_label
	selected_label.property_changed.connect(change_diff)
	controller_add.controlled_item = selected_label
	controller_sub.controlled_item = selected_label


func _on_button_button_up() -> void:
	if not cd_menu:
		cd_menu = commander_damage_menu_class.instantiate()
		add_child(cd_menu)
	else:
		cd_menu.visible = true
