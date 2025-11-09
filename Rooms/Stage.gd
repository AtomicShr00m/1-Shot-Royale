extends Node2D

var wave:=1
onready var blueScn = preload("res://Objects/Enemies/Blue.tscn")

func _ready():
	pass

func spawn_enemy():
	var enemy=blueScn.instance()
	enemy.target=$Prime
	add_child(enemy)

func spawn_wave():
	pass
