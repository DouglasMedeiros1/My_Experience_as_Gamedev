extends Node

@onready var score_label = $Score
@onready var died_label = $Died


var score = 0

func add_point(points):
	if points > 0:
		score_label.text = "Coins: Max" 

func deadline():
	died_label.text = "YOU DIED"

func revive():
	died_label.text = ""
