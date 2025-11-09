extends TileMap

var last_anchor:Vector2
onready var cam = $"../Cam"

func open_hall():
	for n in 3:
		set_cellv(last_anchor+Vector2(0,n+1),-1)

func close_hall():
	for n in 3:
		set_cellv(last_anchor+Vector2(0,n+1),0)

func make_hall(from:Vector2):
	last_anchor=from
	open_hall()
	for n in 32:
		set_cellv(from+Vector2(n+1,0),0)
		set_cellv(from+Vector2(n+1,4),0)

func _on_CamCheck_body_exited(_body):
	cam.position.x+=640
	close_hall()
