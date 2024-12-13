extends Node2D

var tile_Scene1 = preload("res://characters/tiles.tscn")
var tile_Scene2 = preload("res://characters/tiles_2.tscn")

@onready var ball: MeshInstance2D = $Ball
@onready var label: Label = $Label
@onready var timer: Timer = $Timer

# Generating random numbers to make the tile selection automated
var random_num_Gen = RandomNumberGenerator.new() 

func _ready() -> void:
	tile_pos_Gen() #Tile position generator to generate tiles.


func _process(delta: float) -> void:
	input_actions()
	
	# Made a timer so that the game doesn't begin too early.
	#print(floor(timer.time_left))
	if floor(timer.time_left) > 0:
		label.text = str(floor(timer.time_left))
	else: label.text = ""


# What the system would output when the timer runs out!
func _on_timer_timeout() -> void:
	ball.speed_x = 5
	ball.speed_y = 5
	print("Oya Na!")

func tile_pos_Gen():
	# Differences between rows and columns of the tiles so the numbers must be different.
	var random_num1 = random_num_Gen.randi_range(4, 7)
	var random_num2 = random_num_Gen.randi_range(5, 10)
	
	print("Random1: ", random_num1)
	print("Random2: ", random_num2)
	
	# generates the tiles when program starts running. 
	for i in range(random_num1):
		for j in range(random_num2):
			var tiles = tile_Scene1.instantiate()
			var tiles2 = tile_Scene2.instantiate()
			add_child(tiles)
			add_child(tiles2)
			# Tiles positioning:
			#X axis: i starts at 0, in the first loop its pos remain 70, in 2nd its pos increases by 100  
			#Y axis: j starts at 0, in the 1st loop its pos remains 50, in 2nd its pos increases by 20.....
			tiles.position = Vector2(190 + 70 * i, 50 + 50 * j)
			tiles2.position = Vector2(170 + 75 * i, 75 + 50 * j)

func input_actions():
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
