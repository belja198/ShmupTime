extends Area2D
class_name Projectile;


@export var projectile_speed: float = 200;

var my_time_scale: float = 1.0;

func _physics_process(delta: float) -> void:
	my_time_scale = GlobalScript.world_time_scale;
	#move_and_collide(Vector2.UP * projectile_speed * delta);
	position += Vector2.UP * projectile_speed * delta * my_time_scale;
	#print("Projectile moving at position: ", global_position)
	#pass;
