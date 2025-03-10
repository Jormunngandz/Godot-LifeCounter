extends PanelContainer
@onready var commander_damage_menu_class: PackedScene = preload("res://scenes/commander_damage_menu/panel_container.tscn")
@onready var scroll_container: ScrollContainer = %ScrollContainer
var selected_label
@onready var controller_add = %ControllerAdd
@onready var controller_sub = %ControllerSub
@onready var item_change_label = %DIFF
@onready var player_number_label = %player_label
@onready var player_status_bar = %player_status_bar
@export var player_status_HE: SizeFlags = SIZE_SHRINK_END
var current_value = 0
var diff_timer: SceneTreeTimer
var player_number : int = 0
var cd_menu: PanelContainer
@export var flipped: int = 0

func _ready() -> void:
	
	player_number = get_tree().get_nodes_in_group("player_board").find(self, 0) + 1
	player_number_label.text = str(player_number)
	
	$Timer.timeout.connect(reset_current)
	scroll_container.item_changed.connect(new_item_changed)
	selected_label = scroll_container.selected_label
	for scroll_item in scroll_container.item_container.get_children():
		scroll_item.property_changed.connect(change_diff)
	controller_add.controlled_item = selected_label
	controller_sub.controlled_item = selected_label
	scroll_container.set_v_scroll(0)
	call_deferred("flip_check")
	player_status_bar.set_h_size_flags(player_status_HE)

				
func flip_check():
	if flipped:
		
		pivot_offset = size / 2
		set_rotation_degrees(flipped)

func change_diff(label, diff):
	item_change_label.modulate = Color(1,1,1,1)
	current_value += diff
	item_change_label.text = str(current_value)
	player_status_bar.change_stat(label)
	$Timer.start()
	
func reset_current():
	item_change_label.modulate = Color(1,1,1,0)
	#item_change_label = 
	current_value = 0

func new_item_changed(new_label):
	if new_label != selected_label:
		reset_current()
		selected_label = new_label

		controller_add.controlled_item = selected_label
		controller_sub.controlled_item = selected_label


func _on_button_button_up() -> void:
	if not cd_menu:
		cd_menu = commander_damage_menu_class.instantiate()
		add_child(cd_menu)
	else:
		cd_menu.visible = not cd_menu.visible
	Global.cd_menu_evoked.emit()
