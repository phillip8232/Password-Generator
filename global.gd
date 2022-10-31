extends Node

func _ready() -> void:
	OS.set_low_processor_usage_mode(true)
	OS.set_window_title("Password Generator")

