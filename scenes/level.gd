extends Node2D


@export var next_level_tscn: PackedScene;

@onready var lives_label: RichTextLabel = $LivesTextLabel

func _ready() -> void:
	GlobalScript.player.player_lost_life.connect(_player_lost_life);
	_player_lost_life();

	GlobalScript.player.player_death.connect(_player_death_slot);

func _on_end_timer_timeout() -> void:
	if next_level_tscn:
		_remove_projectiles();
		get_tree().change_scene_to_packed(next_level_tscn);
	else:
		get_tree().quit()
	

func _player_lost_life() -> void:
	lives_label.text = str(GlobalScript.player.lives);

func _player_death_slot() -> void:
	call_deferred("_player_death");

func _player_death() -> void:
	_remove_projectiles();
	get_tree().reload_current_scene();

func _remove_projectiles() -> void:
	for projectile in get_tree().get_nodes_in_group("projectiles"):
		projectile.queue_free() 
