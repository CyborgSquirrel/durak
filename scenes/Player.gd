extends KinematicBody2D

const SPEED = Vector2(500, 10000)
const GRAVITY = Vector2(0, -200)

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var player_movement = Vector2(0,0)
	player_movement.x += int(Input.is_action_pressed("game_right")) - int(Input.is_action_pressed("game_left"))
	if is_on_floor():
		player_movement.y -= int(Input.is_action_pressed("game_up"))
	player_movement.x *= SPEED.x
	player_movement.y *= SPEED.y
	
	var total_movement = player_movement - GRAVITY
	move_and_slide(total_movement, GRAVITY.normalized())
	
	for i in range(get_slide_count()):
		var collider = get_slide_collision(i).get_collider()