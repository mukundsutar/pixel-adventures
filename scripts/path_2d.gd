extends Path2D

const CHAIN = preload("res://assets/Traps/Saw/Chain.png")

@export var image: Texture2D = CHAIN
@export var spacing: float = 7.0  # Desired spacing between sprites

func _ready() -> void:
	var path_length = curve.get_baked_length()
	var sprite_count = floor(path_length / spacing)

	for i in range(sprite_count + 1):
		var offset = i * spacing
		var point = curve.sample_baked(offset)

		var s = Sprite2D.new()
		s.texture = image
		s.position = point
		add_child(s)
