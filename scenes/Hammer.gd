extends KinematicBody2D

func _ready():
	set_physics_process(true)
	position.y += 50

func _physics_process(delta):
#	var rotation_increment = get_angle_to(get_global_mouse_position()) + PI/2
	var rotation_increment = 0.1
	var myass = position
	
	global_transform = global_transform.translated(-myass).rotated(rotation_increment).translated(myass)
#	get_transform()
#	rotate(rotation_increment)
#	var increment = sign(rotation_increment)/10
#	while !test_move(get_global_transform_with_canvas().rotated(increment), Vector2(0,0)) && abs(rotation_increment) > abs(increment):
#		rotation_increment -= increment
#		rotation += increment