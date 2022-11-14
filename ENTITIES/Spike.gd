extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
# warning-ignore:return_value_discarded
	self.connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body: Node):
	if body.has_method("take_damage"):
		body.take_damage(self)
