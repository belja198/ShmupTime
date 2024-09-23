extends Node2D
class_name SpawnerBase

@export var enemies_to_spawn: int = 1;
@export var enemy_tscn: PackedScene;
@export var spawn_cooldown: float = 1.0;
@export var spawn_start_time: float = 1.0;
@onready var spawn_timer: Timer = $SpawnTimer;

func _ready() -> void:
	spawn_timer.wait_time = spawn_start_time;
	spawn_timer.start();

# override
func spawn() -> void:
	pass;

func _on_spawn_timer_timeout() -> void:
	if enemies_to_spawn <= 0:
		return;

	spawn();
	enemies_to_spawn -= 1;
	if enemies_to_spawn > 0:
		spawn_timer.wait_time = spawn_cooldown;
		spawn_timer.start();
