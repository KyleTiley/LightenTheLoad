extends Node3D

func _ready() -> void:
	%MeshInstance3D.moving = true
	%MeshInstance3D.move_speed = 1.0

func _process(delta: float) -> void:
	const move_speed := 4.0
	%PathFollow3D.progress += move_speed * delta
