﻿using UnityEngine;
using System.Collections;

public class GUIManager : MonoBehaviour {

	public RenderTexture MiniMapTexture;
	public Material MiniMapMaterial;

	private float offset;
	// Use this for initialization
	void Awake()
	{
		offset = 10;
	}
	void OnGUI()
	{
		if(Event.current.type==EventType.Repaint)
			Graphics.DrawTexture (new Rect (Screen.width - 256 - offset,  offset, 256, 256), MiniMapTexture, MiniMapMaterial);
	}
}
