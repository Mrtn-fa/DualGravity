extends KinematicBody2D

var velocity = Vector2()
var GRAVITY = 10
var SPEED = 200
var JUMP_SPEED = 300
var ACCELERATION = 300
var g = 1

func _physics_process(delta):
	if Input.is_action_just_pressed("gravity"):
		g *= -1
		self.scale.y *= -1
	
	velocity = move_and_slide(velocity, Vector2.UP*g)
	
	var move_input = Input.get_axis("move_left", "move_right")
	
	velocity.x = lerp(move_input * SPEED, velocity.x, 0.50) 
	# velocity.x = move_toward(velocity.x, move_input * SPEED, ACCELERATION * delta)
	velocity.y += GRAVITY * g
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -JUMP_SPEED * g
	

func _ready():
	pass # Replace with function body.

