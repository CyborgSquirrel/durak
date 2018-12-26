extends KinematicBody2D

const SPEED = Vector2(500, 2200)
const GRAVITY = Vector2(0, -100)

var movement = Vector2(0, 0)

onready var profit_scene = preload("Profit.tscn")
onready var loss_scene = preload("Loss.tscn")

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	movement.x = 0
	
	movement.x += int(Input.is_action_pressed("game_right")) - int(Input.is_action_pressed("game_left"))
	movement.x *= SPEED.x

	if movement.y < 800:
		movement -= GRAVITY
	if is_on_floor():
		movement.y -= int(Input.is_action_pressed("game_up")) * SPEED.y
	
	move_and_slide(movement, GRAVITY.normalized())


# Ship and strawberry collision
func _on_Area2D_body_entered(body):
	if body.is_in_group("strawberries"):
		var profit = profit_scene.instance()
		profit.position = position
		get_tree().get_root().add_child(profit)
		body.queue_free()
	elif body.is_in_group("ships"):
		var loss = loss_scene.instance()
		loss.position = position
		get_tree().get_root().add_child(loss)
		body.queue_free()
