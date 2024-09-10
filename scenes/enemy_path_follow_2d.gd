extends PathFollow2D
class_name EnemyPathFollow2D

@export var enemy: EnemyBase;

@export var enemy_speed: float = 50.0;

func _process(delta: float) -> void:
	set_progress(get_progress() + enemy_speed * delta);
	if get_progress_ratio() == 1:
		queue_free();