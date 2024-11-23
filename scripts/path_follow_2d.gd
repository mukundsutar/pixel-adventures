extends PathFollow2D

var speed: float = 0.5
var min_limit: float = 0.05
var max_limit: float = 0.95

var direction: float = 1.0

func _process(delta: float) -> void:
	# Update progress based on current direction
	progress_ratio += speed * delta * direction

	# Change direction at limits
	if progress_ratio >= max_limit:
		direction = -1.0
	elif progress_ratio <= min_limit:
		direction = 1.0
