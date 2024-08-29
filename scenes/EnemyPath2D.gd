extends PathFollow2D

var enemy_speed: float = 250.0;

func _process(delta: float) -> void:
	set_progress(get_progress() + enemy_speed * delta);