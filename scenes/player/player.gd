extends CharacterBody2D

const MAX_SPEED = 200

var click_position = Vector2()
var target_position = Vector2()

func _ready() -> void:
	click_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click"):
		click_position = get_global_mouse_position()

	if position.distance_to(click_position) > 3:
		target_position = (click_position - position).normalized()
		velocity = target_position * MAX_SPEED
		move_and_slide()
