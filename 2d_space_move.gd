extends CharacterBody2D

func _physics_process(_delta):
	# mouse angel
	var mouse_angel = Vector2.LEFT.angle_to(get_viewport().get_mouse_position() - Vector2(get_window().get_size())/2)
	
  direction = Vector2(Input.get_axis("ui_left", "ui_right"),Input.get_axis("ui_up", "ui_down")).normalized()
  if direction:
    _velocity += direction * SPEED_OLD * _delta * 60
    if _velocity.length() > MAX_SPEED:
      _velocity = _velocity.normalized() * MAX_SPEED
  else:
    _velocity = Vector2(move_toward(_velocity.x, 0, SLOW_SPEED), move_toward(_velocity.y, 0, SLOW_SPEED))
  _velocity *= _delta * 60
  velocity = Vector2(_velocity.y, -_velocity.x).rotated(mouse_angel)
  print(velocity)
  move_and_slide()
