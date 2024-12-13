extends MeshInstance2D

var speed_x = 0
var speed_y = 0

# Tile list to keep track of the number of tiles on the screen!.
var tile_list = []

func _ready() -> void:
	pass

func _process(delta: float) -> void:	
	bounce()
	tile_list = get_tree().get_nodes_in_group("Tiles")
	#print(tile_list.size())
	
	# Some code to start a new level. It aids player progression
	if (tile_list.size() == 0):
		get_tree().change_scene_to_file("res://Levels/level_1.tscn")

# Some code to meake the ball bounce as that's the core game mechanic!
func bounce():
	position.x += speed_x
	position.y += speed_y

# To allow the ball to bounce when it hits the top and side edges and stop when it hits the bottom edge. 
	if (position.x > 780 || position.x < 15):
		speed_x *= -1
	if (position.y < 1):
		speed_y *= -1
	if (position.y > 597):
		speed_y *= 0 # Stops ball motion in the y axis to prevent bounces.
		speed_x *= 0.99 # Gradually stop ball motion in the x axis to add some feel.

func _on_area_2d_area_entered(area: Area2D) -> void:
	
	#To increase ball speed at it bounces off the tilesto increase challenge
	speed_y *= -1.019
	if (speed_y > 10.0): # Reducing the speed so my code doesn't break
		speed_y = 8.4
	
	if area.get_parent().is_in_group("Tiles"):
		#print("Tile Contact!!!")
		area.get_parent().queue_free()
		
