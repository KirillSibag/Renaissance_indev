extends KinematicBody2D

onready var animations =  $AnimationPlayer

var velocity = Vector2()

func updateAnimation():
	if velocity.length() == 0:
		animations.stop()
	
	else:
		var direction = "down"
		if velocity.x < 0: direction = "left"
		elif velocity.x > 0: direction = "right"
		elif velocity.y < 0: direction = "up"
		
		animations.play(direction)



export var speed = 60

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide(velocity, Vector2(0, -1))
	updateAnimation()
