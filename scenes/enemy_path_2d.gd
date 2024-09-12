extends Path2D

@export var spawn_cooldown: float = 1.0;
@export var enemies_max: int = 1;
var enemies_spawned: int = 0;
@export var num_of_enemies: int = 1;

@export var enemy_tscn: PackedScene;
@export var enemy_follow_tscn: PackedScene;

@onready var spawn_timer: Timer = $SpawnTimer;

func _ready() -> void:
	spawn_timer.wait_time = spawn_cooldown;
	spawn_timer.start();


func _on_spawn_timer_timeout() -> void:
	if enemies_spawned >= enemies_max:
		spawn_timer.stop();
		return;
	
	var new_enemy: EnemyBase = enemy_tscn.instantiate();
	var enemy_path_follow: EnemyPathFollow2D = enemy_follow_tscn.instantiate();
	
	enemy_path_follow.enemy = new_enemy;
	
	enemy_path_follow.add_child(new_enemy);
	add_child(enemy_path_follow);
	
	enemies_spawned += 1;
	
