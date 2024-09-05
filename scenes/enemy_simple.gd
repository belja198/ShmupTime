extends Area2D
class_name EnemySimple;

@export var shoot_cooldown: float = 1.0;
var shoot_timer: float = shoot_cooldown;
@onready var firing_point: Node2D = $FirePoint;
@onready var enemy_health: HealthBox = $HealthBox

const ENEMY_PROJECTILE: PackedScene = preload("res://scenes/enemy_projectile.tscn")

func _ready() -> void:
	enemy_health.health_deplted.connect(death);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	shoot_timer -= delta;

	if shoot_timer <= 0:
		shoot();
		shoot_timer = shoot_cooldown;

	



func shoot() -> void:
	var proj: EnemyProjectile = ENEMY_PROJECTILE.instantiate();
	get_tree().get_root().add_child(proj);
	proj.global_position = firing_point.global_position;
	#print("Is in scene tree: ", proj.is_inside_tree())

func reduce_health(damage: float) -> void:
	enemy_health.reduce_health(damage);

func death() -> void:
	queue_free();
