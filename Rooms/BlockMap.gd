extends TileMap

onready var cam = $"../Cam"

func open_lane(start:Vector2):
	for n in 3:
		set_cellv(start+Vector2(0,n+1),-1)

func link_rooms(start:Vector2):
	for n in 33:
		set_cellv(start+Vector2(n,1),-1)
		set_cellv(start+Vector2(n,2),-1)
		set_cellv(start+Vector2(n,3),-1)

func close_lane(start:Vector2):
	for n in 16:
		set_cellv(start+Vector2(-1,n),0)
