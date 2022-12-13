extends TextureRect

onready var back = $MarginContainer/VBoxContainer4/VBoxContainer3/back

func _ready():
	back.connect("pressed", self, "_on_back_pressed")
	
func _on_back_pressed():
	get_tree().change_scene("res://UI/MainMenu.tscn")
