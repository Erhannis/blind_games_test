using Godot;
using System;
//using Resonance;

public partial class loop : AudioStreamPlayer3D
//public partial class loop : ResonancePlayer
{
	public override void _Ready()
	{
		this.Finished += _on_loop_sound;
	}
	
	public void _on_loop_sound() {
		this.Playing = true;
	}
}
