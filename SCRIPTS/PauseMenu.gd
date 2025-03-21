extends Control

onready var play = $VBoxContainer/play
onready var credits = $VBoxContainer/credits
onready var exit = $VBoxContainer/exit

func _ready():
	play.connect("pressed", self, "_on_play_pressed")
	credits.connect("pressed", self, "_on_credits_pressed")
	exit.connect("pressed", self, "_on_exit_pressed")

func _on_play_pressed():
	get_tree().change_scene("res://LEVELS/LEVEL_3.tscn")
	
func _on_credits_pressed():
	print("Credits")
	pass

func _on_exit_pressed():
	get_tree().quit()
