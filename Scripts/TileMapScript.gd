extends TileMap

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	_random_map()
	pass
	
func _random_map():
	_clear()
	randomize()
	_build_tower(20,randi()%3+1)
	_build_tower(40,randi()%3+1)
	_build_tower(60,randi()%3+1)
		

func _clear():
	for i in range(40):
		for y in range(5):
			set_cell(i+20,y-2,3)

func _build_tower(var position,var height):
	for i in range(height):
		set_cell(position,2-i,2)