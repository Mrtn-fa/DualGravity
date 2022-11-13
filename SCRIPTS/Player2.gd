extends KinematicBody2D

onready var sprite = $Pivot/Sprite
onready var anim_play = $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var playback = anim_tree.get("parameters/playback")
onready var pivot = $Pivot

var velocity = Vector2()
var GRAVITY = 10
var SPEED = 200
var JUMP_SPEED = 300
var ACCELERATION = 300
var g = -1
var spring = 450
var flag_value = 0

func change_grav():
	g *= -1
	self.scale.y *= -1

func _physics_process(delta):
	if Input.is_action_just_pressed("gravity"):
		change_grav()
	
	velocity = move_and_slide(velocity, Vector2.UP*g)
	
	var move_input = Input.get_axis("move_left", "move_right")
	
	velocity.x = lerp(move_input * SPEED, velocity.x, 0.50) 
	# velocity.x = move_toward(velocity.x, move_input * SPEED, ACCELERATION * delta)
	velocity.y += GRAVITY * g
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -JUMP_SPEED * g
	
	# ANIMATIONS
	if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		pivot.scale.x = 1
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		pivot.scale.x = -1
	if is_on_floor():	
		if abs(velocity.x) > 10:
			playback.travel("Run")
		else:
			playback.travel("Idle")
	else:
		if velocity.y < 0:
			pass#playback.travel("Jump1")
		else:
			playback.travel("Idle")

func _ready():
	anim_tree.active = true
	pass # Replace with function body.


func _on_Switch_body_exited(body):
	print("switch")
	velocity.x += 25
	change_grav()


func _on_Spring_body_entered(body):
	print("spring")
	velocity.y = spring*-g


func _on_FLAG_body_entered(body):
	print("win")
	flag_value = 1
	pass # Replace with function body.


func _on_FLAG_body_exited(body):
	flag_value = 0
	pass # Replace with function body.
