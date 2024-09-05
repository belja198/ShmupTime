extends Area2D
class_name HurtBox

@export var is_enemy_hurtbox: bool = true;

@export var damage: float = 0.0;

func _ready() -> void:
    if is_enemy_hurtbox:
        set_collision_layer_value(6, 1);
        set_collision_layer_value(5, 0);
    else:
        set_collision_layer_value(5, 1);
        set_collision_layer_value(6, 0);