extends Area2D
class_name ProjectileBase

@export var speed: float = 400.0;
@export var direction: Vector2 = Vector2(1, 0);

@onready var damage_box: DamageBox = $DamageBox;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	damage_box.damage_collided.connect(_on_damage_collided);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_projectile(delta);


func move_projectile(delta: float) -> void:
	position += direction * speed * delta;

func _on_area_entered(area:Area2D) -> void:
	#print("projectile dissapears")
	queue_free();

func _on_damage_collided() -> void:
	#print("projectile dissapears")
	queue_free();

# used by enemies
#func _on_body_entered(body:Node2D) -> void:
#	queue_free();
