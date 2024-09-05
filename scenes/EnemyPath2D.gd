extends PathFollow2D

@export var enemy_speed: float = 50.0;

func _process(delta: float) -> void:
	set_progress(get_progress() + enemy_speed * delta);