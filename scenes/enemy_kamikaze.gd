extends EnemyBase
class_name EnemyKamikaze

var target_direction: Vector2;
@onready var damage_box: DamageBox = $DamageBox;

func _ready() -> void:
	super._ready();
	damage_box.damage_collided.connect(death);
	var target: Vector2 = GlobalScript.player.position;
	target_direction = (target - position).normalized();

func _physics_process(delta: float) -> void:
	position += target_direction * speed * delta;
