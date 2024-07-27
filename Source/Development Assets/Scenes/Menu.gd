extends Node2D

var cena_a_carregar : String = "res://Scenes/game.tscn"


func _ready():
	$start.connect("pressed", Callable(self, "_on_BotaoCarregarCena_pressed"))
	$exit.connect("pressed", Callable(self, "_on_BotaoFecharJogo_pressed"))

func _on_BotaoCarregarCena_pressed():
	var nova_cena = load(cena_a_carregar)
	get_tree().change_scene_to_packed(nova_cena)

func _on_BotaoFecharJogo_pressed():
	get_tree().quit()
