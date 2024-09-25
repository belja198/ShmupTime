extends Area2D
class_name DamageBox


@export var should_hurt_player: bool = true;
@export var damage: float = 0.0;

signal damage_collided;

func _ready() -> void:
	if should_hurt_player:
		set_collision_mask_value(2, 1);
		set_collision_mask_value(4, 0);
	else:
		set_collision_mask_value(4, 1);
		set_collision_mask_value(2, 0);


func _on_body_entered(body:Node2D) -> void:
	if body is Player:
		var player: Player = body as Player;
		player.get_hit();
		damage_collided.emit();

func _on_area_entered(area:Area2D) -> void:
	if area is HealthBox:
		var health_box: HealthBox = area as HealthBox;
		health_box.reduce_health(damage);
	damage_collided.emit();
