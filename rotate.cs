using Godot;
using System;
using System.ComponentModel.Design;

public partial class rotate : Node3D
{
	public override void _PhysicsProcess(double delta)
	{
		float z = (Time.GetTicksMsec()/(1000.0f*4))*2*Mathf.Pi;
		this.Rotation = new Vector3(this.Rotation.X, this.Rotation.Y, z);
	}
}
