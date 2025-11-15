extends State

var wait_time:=3.0

func open():
	wait_time=3.0
	pawn.anim.play("Attack")
	pawn.shoot_timer.start()

func update(delta):
	if !pawn.spotted_player():
		if pawn.shoot_timer.paused:
			wait_time-=delta
			if wait_time<=0:
				emit_signal("transit",self,'idle')
		else:
			wait_time=3.0
			pawn.shoot_timer.paused=true
	else:
		pawn.sprite.scale.x=1 if pawn.position.x<pawn.target.position.x else -1
		if pawn.sight_blocked():
			pawn.shoot_timer.paused=true
		elif pawn.shoot_timer.paused:
			pawn.shoot_timer.paused=false
			wait_time=3
		elif pawn.shoot_timer.is_stopped():
			pawn.shoot_timer.start()

func close():
	pawn.bullet_spawn.scale=Vector2.ZERO
	pawn.shoot_timer.stop()
