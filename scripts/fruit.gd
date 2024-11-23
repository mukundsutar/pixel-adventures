extends Area2D

@onready var fruit: Area2D = $"."
@onready var fruit_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	print("Fruit Collected")
	fruit_sprite.play("collected")
	fruit_sprite.animation_finished.connect(func(): queue_free())
