using Godot;
using System;

public partial class XrOrigin3d : XROrigin3D
{
	public override void _Ready()
	{
		var xrInterface = XRServer.FindInterface("OpenXR");
		if (xrInterface != null)
		{
			// Connect SessionFocussed BEFORE Initialize() — the signal can fire
			// synchronously during Initialize() on some runtimes (Monado/SteamVR).
			//if (xrInterface is OpenXRInterface openxr) {
				//openxr.SessionFocussed += OnXRSessionFocussed;
			//}
			
			GetViewport().UseXR = true;
			// BuildVRRig();

			if (xrInterface.Initialize())
			{
				GD.Print("[VRManager] OpenXR initialised.");
				DisplayServer.WindowSetVsyncMode(DisplayServer.VSyncMode.Disabled);
			}
			else
			{
				GD.Print("[VRManager] OpenXR init failed — desktop mode.");
				// Remove rig nodes and fall back
				//foreach (var c in GetChildren())
					//if (c is XROrigin3D) c.QueueFree();
				//EnableDesktopFallback();
			}
		}
		else
		{
			GD.Print("[VRManager] OpenXR interface not found — desktop mode.");
			//EnableDesktopFallback();
		}
	}
}
