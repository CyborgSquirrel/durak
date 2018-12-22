extends KinematicBody2D

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	rotation += get_angle_to(get_global_mouse_position()) + 90
