extends Node2D
onready var flag_1 = $CanvasLayer/VBoxContainer/ViewportContainer/Viewport/Node2D/Player
onready var flag_2 = $CanvasLayer/VBoxContainer/ViewportContainer2/Viewport/Node2D/KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (flag_1.flag_value == 1 and flag_2.flag_value == 1):
		get_tree().change_scene("res://LEVELS/LEVEL_2.tscn")
