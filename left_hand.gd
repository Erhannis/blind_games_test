extends XRController3D

@onready var resonance_player_left_hand: ResonancePlayer = $"../XRController3D_left/ResonancePlayer"
@onready var resonance_player_sphere: ResonancePlayer = $"../../Sphere/ResonancePlayer"

func _on_button_pressed(name: String) -> void:
	print("left _on_button_pressed: " + name)
	if name == "trigger_click":
		print("left ping")
		#resonance_player_left_hand.play()
		resonance_player_sphere.play()
