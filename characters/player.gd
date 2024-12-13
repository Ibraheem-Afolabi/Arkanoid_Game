extends Sprite2D

var speed = 7


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	movement()
	player_boost()
	
	
func movement():
	# Some code to ensure that the player actually moves
	if (Input.is_action_pressed("ui_right")):
		position.x += speed
	elif (Input.is_action_pressed("ui_left")):
		position.x -= speed
		
	# Dealing With The Border. I don't want the player to go out of the screen!
	position.x = clamp(position.x, 50, 750)

func player_boost():
	if (Input.is_action_just_pressed("speed_boost")):
		$Timer.start(9)
		speed *= 1.3
	

func _on_timer_timeout() -> void:
	print("Timeout!!")
	speed = 7
