extends Node2D
class_name EnemyBase


@onready var enemy_health: HealthBox = $HealthBox;

func _ready() -> void:
	enemy_health.health_deplted.connect(death);


func death() -> void:
	queue_free();
