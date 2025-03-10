extends HBoxContainer

@onready var poison_container: CenterContainer = %PoisonContainer
@onready var energy_container: CenterContainer = %EnergyContainer
@onready var energy_label: Label = %Energy
@onready var poison_label: Label = %Poison

var to_show_color: Color = Color(1,1,1,1)
var to_hide_color: Color = Color(1,1,1,0)

func _ready() -> void:
	modulate_stat(poison_container, to_hide_color)
	modulate_stat(energy_container, to_hide_color)
	
func change_stat(label):
	if label.default_value == "Energy":
		change_label_value(label.text, energy_label)
	if label.default_value == "Poison":
		
		change_label_value(label.text, poison_label)

		
func modulate_stat(container:CenterContainer, color: Color):
	container.modulate = color

func change_label_value(value: String, label: Label):
	label.text = value
	if int(value) == 0:
		print("hide!")
		modulate_stat(label.get_parent().get_parent(), to_hide_color)
	else:
		modulate_stat(label.get_parent().get_parent(), to_show_color)
	
