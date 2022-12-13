extends Node2D
onready var s1 = $CanvasLayer/VBoxContainer/ViewportContainer/Viewport/Level_4_p1/Player
onready var s2 = $CanvasLayer/VBoxContainer/ViewportContainer2/Viewport/Level_4_p2/KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(delta):
	if (s1.spike_value == 1 or s2.spike_value == 1):
		get_tree().reload_current_scene()
	if (s1.flag_value == 1 and s2.flag_value == 1):
		get_tree().change_scene("res://LEVELS/LEVEL_3.tscn")

