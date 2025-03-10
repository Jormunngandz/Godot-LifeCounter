extends SubViewportContainer
@onready var cur_offset
@export var focus_value: int
@export var default_value: String
@onready var label: Label = %Label
@onready var gradient_obj: GradientTexture2D
signal property_changed(diff)
func _ready() -> void:
	label.text = default_value
	gradient_obj = get_material().get_shader_parameter("gradient")

	#void set_offset(point: int, offset: float)
	cur_offset = 0.2
	gradient_obj.gradient.set_offset(1, cur_offset)
	#cur_offset = gradient_obj.get_fill_from()

func select_on() -> void:
	label.text = str(focus_value)
	
func select_off() -> void:
	label.text = default_value

func change_focus_value(value):
	if 10 >= focus_value + value and focus_value + value >= 0:
		focus_value += value
		property_changed.emit(value)
		label.text = str(focus_value)
		value = float(value) / 14.5
		cur_offset = clamp(cur_offset + value, 0.2, 1.0)

		
		gradient_obj.gradient.set_offset(1, cur_offset)
	
