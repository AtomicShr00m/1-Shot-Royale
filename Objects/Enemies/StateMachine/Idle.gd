extends State

var wait_time:=3.0

func open():
	pawn.get_node("Anim").play("Idle")
	wait_time=rand_range(2,4)

func update(delta):
	wait_time-=delta
	if pawn.spotted_player():
		emit_signal("transit",self,'attack')
	elif wait_time<=0:
		emit_signal("transit",self,'scout')
