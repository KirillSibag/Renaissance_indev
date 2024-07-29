extends Area2D

onready var animations =  $AnimationPlayer

func _physics_process(delta):
	animations.play("fly")


func _on_Area2D_body_entered(body):
	pass#if body.name == "player":
		
		
