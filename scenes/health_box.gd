extends Area2D
class_name HealthBox

@export var max_health: float = 50.0;
var curr_health: float = 50.0;

signal health_deplted;

func _ready() -> void:
	curr_health = max_health;

func reduce_health(damage: float) -> void:
	if curr_health - damage <= 0:
		curr_health = 0;
		health_deplted.emit();
	else:
		curr_health -= damage;

func increase_health(heal: float) -> void:
	if curr_health + heal > max_health:
		curr_health = max_health;
	else:
		curr_health += heal;

