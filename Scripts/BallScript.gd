extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const GRAVITY = 400.0
const ACCELERATION = 5

var velocity = Vector2()
var position = Vector2()
var jumps = 0
var jumping = false

func _fixed_process(delta):
	velocity.y += GRAVITY * delta + (velocity.x/175)
	velocity.x += ACCELERATION * delta
	if(velocity.x<150):
		get_node("CanvasLayer/score")._end()
	if(get_pos().x>170):
		position = get_pos()
		position.x = -60
		set_pos(position)
	if((!Input.is_action_pressed("ui_up") || get_node("TouchScreenButton").is_pressed()) && jumping):
		jumping = false
		
	if((Input.is_action_pressed("ui_up") || get_node("TouchScreenButton").is_pressed()) && jumps==1 && !jumping):
			jumping = true
			jumps += 1
			velocity.y += -200 -(velocity.x/175)
	
	var motion = velocity * delta
	motion = move(motion)
	
	if(is_colliding()):
		jumps = 0
		var n = get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		if((Input.is_action_pressed("ui_up") || get_node("TouchScreenButton").is_pressed()) && jumps<10 && !jumping):
			jumping = true
			jumps += 1
			velocity.y += -250 - (velocity.x/175)
		move(motion)


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	velocity.x = 350
	set_fixed_process(true)
	pass