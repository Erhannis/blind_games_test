extends XRController3D

@onready var resonance_player_left_hand: ResonancePlayer = $"../XRController3D_left/ResonancePlayer"
@onready var resonance_player_sphere: ResonancePlayer = $"../../Sphere/ResonancePlayer"
@onready var xr_origin_3d: XROrigin3D = $".."

var moving: bool = false

func _on_button_pressed(name: String) -> void:
	print("left _on_button_pressed: " + name)
	match name:
		"trigger_click":
			print("left ping")
			#resonance_player_left_hand.play()
			resonance_player_sphere.play()
		"primary_click":
			print("left track down")
			moving = true


func _on_button_released(name: String) -> void:
	print("left _on_button_released: " + name)
	match name:
		"primary_click":
			print("left track up")
			moving = false

func _physics_process(delta):
	if moving:
		var v = self.global_basis * Vector3(0,0,-1)
		xr_origin_3d.translate(v*delta)
