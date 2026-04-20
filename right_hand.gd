extends XRController3D

@onready var resonance_player: ResonancePlayer = $"../XRController3D_right/ResonancePlayer"

func _on_button_pressed(name: String) -> void:
	print("right _on_button_pressed: " + name)
	if name == "trigger_click":
		print("right ping")
		resonance_player.play()
