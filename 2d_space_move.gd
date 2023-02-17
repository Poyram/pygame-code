extends CharacterBody2D

func _physics_process(_delta):
	# mouse angel
	var mouse_angel = Vector2.LEFT.angle_to(get_viewport().get_mouse_position() - Vector2(get_window().get_size())/2)
	direction = Vector2(Input.get_axis("ui_left", "ui_right"),Input.get_axis("ui_up", "ui_down")).normalized()
	if direction:
		velocity += direction * SPEED_OLD * _delta * 60
	if velocity.length() > MAX_SPEED:
		velocity = velocity.normalized() * MAX_SPEED
	else:
		velocity = Vector2(move_toward(velocity.x, 0, SLOW_SPEED), move_toward(velocity.y, 0, SLOW_SPEED))
	velocity *= _delta * 60
	print(velocity)
	move_and_slide()
