extends ProjectileBase

@export var amplitude: float = 10.0; 
@export var frequency: float = 1.0;

var time_passed: float = 0.0;

func move_projectile(delta: float) -> void:
	position += direction.normalized() * speed * delta;
	
	time_passed += delta;

	var perpendicular_direction: Vector2 = Vector2(-direction.y, direction.x);
	var cosine_offset: float = amplitude * cos(time_passed * frequency * PI * 2) * frequency;

	position += perpendicular_direction.normalized() * cosine_offset;
