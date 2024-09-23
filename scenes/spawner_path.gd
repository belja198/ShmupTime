extends SpawnerBase

@onready var path: Path2D = $Path2D;
@export var enemy_follow_tscn: PackedScene;

func _ready() -> void:
	super._ready();
	if path == null:
		return;

func spawn() -> void:
	var new_enemy: EnemyBase = enemy_tscn.instantiate();
	var enemy_path_follow: EnemyPathFollow2D = enemy_follow_tscn.instantiate();
	
	enemy_path_follow.enemy = new_enemy;
	
	enemy_path_follow.add_child(new_enemy);
	path.add_child(enemy_path_follow);