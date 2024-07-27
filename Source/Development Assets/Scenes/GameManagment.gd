extends Node

@onready var score_label = $Score

var score = 0

func add_point(points):
	score = score + points
	if score == 2:
		score_label.text = "Coins: Max \n END GAME!" 
	elif score > 0 :
		score_label.text = "Coins: 1" 
	else:
		score_label.text =  "Coins: X"
		

