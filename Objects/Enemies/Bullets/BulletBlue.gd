extends Area2D

var dir:Vector2
const SPEED=200

func _physics_process(delta):
	position+=dir*SPEED*delta

func _on_BulletBlue_body_entered(body):
	if body is KinematicBody2D:
		body.hit()
	queue_free()
