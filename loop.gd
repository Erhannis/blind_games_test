extends ResonancePlayer
class_name LoopingResonancePlayer

player.connect("finished", Callable(self,"_on_loop_sound").bind(player))
#self.play()

func _on_loop_sound(player):
	player.stream_paused = false
