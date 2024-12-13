extends ParallaxBackground

@onready var sprite: Sprite2D = $ParallaxLayer/Dirt
@export var scroll_speed = 22

func _process(delta: float) -> void:
	sprite.region_rect.position += delta * Vector2(0, scroll_speed)
	if sprite.region_rect.position >= Vector2(308, 308):
		sprite.region_rect.position = Vector2.ZERO
