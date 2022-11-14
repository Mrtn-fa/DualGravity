extends Node2D
onready var Spikes_1 = $CanvasLayer/VBoxContainer/ViewportContainer/Viewport/Level_4_p1/Spikes
onready var Spikes_2 = $CanvasLayer/VBoxContainer/ViewportContainer2/Viewport/Level_4_p2/Spikes


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Spikes_1.connect("body_entered", self, "_spikes1_on_body_entered")
	Spikes_2.connect("body_entered", self, "_spikes2_on_body_entered")
	pass # Replace with function body.

func _spikes1_on_body_entered(body: Node):
	if body.has_method("take_damage"):
		get_tree().change_scene("res://LEVELS/TUTORIAL_LEVEL_1.tscn")
		
func _spikes2_on_body_entered(body: Node):
	if body.has_method("take_damage"):
		get_tree().change_scene("res://LEVELS/TUTORIAL_LEVEL_1.tscn")
