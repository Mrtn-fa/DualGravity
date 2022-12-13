extends MarginContainer

onready var resume = $VBoxContainer/Resume
onready var mainMenu = $VBoxContainer/MainMenu
onready var exit = $VBoxContainer/Exit

func _ready():
	resume.connect("pressed", self, "_on_resume_pressed")
	mainMenu.connect("pressed", self, "_on_mainMenu_pressed")
	exit.connect("pressed", self, "_on_exit_pressed")
	visible = false

func _input(event):
	if event.is_action_pressed("pause"):
		visible = !visible
		get_tree().paused = visible
		

func _on_resume_pressed():
	get_tree().paused = false
	visible = false

func _on_mainMenu_pressed():
	get_tree().change_scene("res://UI/MainMenu.tscn")
	get_tree().paused = false

func _on_exit_pressed():
	get_tree().quit()
