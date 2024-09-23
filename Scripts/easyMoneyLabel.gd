extends Label

func _ready() -> void:
	theme = load("res://Resources/Themes/LabelThemes/LabelGeneralTheme.tres")

func _process(_delta: float) -> void:
	await get_tree().create_timer(0.01).timeout
	text = "Player Money: " + str(StaticPlayerVariables.globalPlayerMoney)
