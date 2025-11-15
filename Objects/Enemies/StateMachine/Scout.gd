extends State

var scout_time:=6.0

func open():
	pawn.anim.play("Walk")
	scout_time=rand_range(3,6)
	pawn.dir=[-1,1].pick_random()

func update(delta):
	scout_time-=delta
	if pawn.spotted_player():
		emit_signal("transit",self,'attack')
	elif scout_time<=0:
		emit_signal("transit",self,'idle')
	elif pawn.is_on_wall():
		pawn.dir*=-1

func close():
	pawn.dir=0
