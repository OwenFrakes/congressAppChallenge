extends Button

@onready var scoreLabel = $"../ScoreLabel"
@onready var handLabel = $"../HandLabel"
@onready var blackjack = $"../BlackJackMaster"

func _on_pressed() -> void:
	blackjack.hit()
	scoreLabel.text = blackjack.updateLabel()[0]
	handLabel.text = blackjack.updateLabel()[1]
