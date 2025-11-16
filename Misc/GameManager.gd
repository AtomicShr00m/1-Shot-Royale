extends Node

var kills:=0
onready var block_map = $"../BlockMap"
onready var prime = $"../Prime"
onready var cam = $"../Cam"

func enemy_killed():
	kills+=1
	if is_wave_cleared():
		var start_pos:=Vector2(get_parent().wave*31,int(prime.position.y/80)*4)
		block_map.open_lane(start_pos)
		block_map.link_rooms(start_pos+Vector2.RIGHT)

func is_wave_cleared():
	return kills%20==0

func _on_RoomCheck_body_exited(body:Node):
	if body.is_queued_for_deletion():
		return
	cam.position.x+=640
	var start=Vector2(int(cam.position.x/640)*32,0)
	block_map.close_lane(start)
