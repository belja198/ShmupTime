extends Node2D
class_name Shooter

@export var projectile: PackedScene;
@export var shoot_cooldown: float = 1.0;
@export var can_shoot: bool = true;

@onready var shoot_timer: Timer = $Timer;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shoot_timer.wait_time = shoot_cooldown;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_shoot:
		shoot();


func shoot() -> void:
	var proj: ProjectileBase = projectile.instantiate();
	proj.global_position = global_position;
	get_tree().get_root().add_child(proj);
	can_shoot = false;
	shoot_timer.start();


func _on_timer_timeout() -> void:
	can_shoot = true;
