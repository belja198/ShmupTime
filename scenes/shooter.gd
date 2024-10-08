extends Node2D
class_name Shooter

@export var projectile_tscn: PackedScene;
@export var shoot_cooldown: float = 1.0;
@onready var shoot_timer: Timer = $Timer;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shoot_timer.wait_time = shoot_cooldown;
	shoot_timer.start();

func shoot() -> void:
	var proj: ProjectileBase = projectile_tscn.instantiate();
	proj.global_position = global_position;
	get_tree().get_root().add_child(proj);
	shoot_timer.start();

func _on_timer_timeout() -> void:
	shoot();
