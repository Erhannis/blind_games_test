extends XRController3D

@onready var resonance_player_left_hand: ResonancePlayer = $"../XRController3D_left/ResonancePlayer"
@onready var resonance_player_sphere: ResonancePlayer = $"../../Sphere/ResonancePlayer"
@onready var sphere: MeshInstance3D = $"../../Sphere"
@onready var xr_origin_3d: XROrigin3D = $".."

var moving: bool = false

# https://mathworld.wolfram.com/SpherePointPicking.html
func _random_vector() -> Vector3:
	var x1: float = 0
	var x2: float = 0
	for x in 1000:
		x1 = randf_range(-1, 1)
		x2 = randf_range(-1, 1)
		if (x1*x1)+(x2*x2) < 1:
			# Found a valid pair
			break
		#//THINK Maybe error on final fail
	var x1s = x1*x1
	var x2s = x2*x2
	var x = 2*x1*sqrt(1-x1s-x2s)
	var y = 2*x2*sqrt(1-x1s-x2s)
	var z = 1 - 2*(x1s+x2s)
	return Vector3(x,y,z)

func _on_button_pressed(name: String) -> void:
	print("left _on_button_pressed: " + name)
	match name:
		"trigger_click":
			print("left ping")
			resonance_player_left_hand.play()
			# Also, shoot the sphere
			var angle = (sphere.global_position - self.global_position).angle_to(pointing())
			const GOOD_ENOUGH_AIM = PI/12
			if angle <= GOOD_ENOUGH_AIM:
				resonance_player_sphere.stop()
		"menu_button":
			print("left sphere")
			sphere.transform.origin = _random_vector()*2 + self.global_position
			resonance_player_sphere.play()
		"primary_click":
			print("left track down")
			moving = true

func pointing() -> Vector3:
	return self.global_basis * Vector3(0,0,-1)

func _on_button_released(name: String) -> void:
	print("left _on_button_released: " + name)
	match name:
		"primary_click":
			print("left track up")
			moving = false

func _physics_process(delta):
	if moving:
		xr_origin_3d.translate(pointing()*delta)
