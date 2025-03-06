extends ScrollContainer
@onready var item_container: VBoxContainer = %VBoxContainer
@onready var selected_label = %HP
@onready var player_heals = %HP
signal item_changed(new_label)

func _ready() -> void:
	selected_label.select_on()
	call_deferred("asd")

func asd():
	item_changed.emit(selected_label)
func _on_scroll_ended() -> void:
	var scrolled_items = round(get_v_scroll() / selected_label.size.y)
	var new_selected_label = item_container.get_child(scrolled_items)
	var scroll_to = scrolled_items * new_selected_label.size.y
	var scroll_tween = get_tree().create_tween()
	scroll_tween.tween_property(self, "scroll_vertical", scroll_to, 0.3).set_trans(Tween.TRANS_CUBIC)
	await scroll_tween.finished

	if selected_label != new_selected_label:
		selected_label.select_off()
		selected_label = new_selected_label
		item_changed.emit(new_selected_label)
		selected_label.select_on()
