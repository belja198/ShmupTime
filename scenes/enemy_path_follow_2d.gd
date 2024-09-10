extends PathFollow2D
class_name EnemyPathFollow2D

@export var enemy: EnemyBase;

func _ready() -> void:
	enemy.enemy_died.connect(func() -> void: queue_free());

func _process(delta: float) -> void:
	set_progress(get_progress() + enemy.speed * delta);
	if get_progress_ratio() == 1:
		queue_free();