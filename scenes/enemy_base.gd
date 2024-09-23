extends Node2D
class_name EnemyBase

@export var speed: float = 100.0;
@onready var enemy_health: HealthBox = $HealthBox;

signal enemy_died;

func _ready() -> void:
	enemy_health.health_deplted.connect(death);


func death() -> void:
	enemy_died.emit();
	queue_free();
