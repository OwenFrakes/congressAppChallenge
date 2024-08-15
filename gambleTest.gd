extends Button

@onready var label = $"../Label"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	var gamble = randi_range(1,10)
	if(gamble > 5):
		label.text = "Gamble Won!"
	else:
		label.text = "Gamble Lost :("
