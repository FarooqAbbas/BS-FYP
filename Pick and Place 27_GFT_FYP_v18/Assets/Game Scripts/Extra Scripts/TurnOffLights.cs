using UnityEngine;
using System.Collections;

public class TurnOffLights : MonoBehaviour {
	private Light[] lights;
	public GameObject lightParent;
	
	void Start()
	{
		
		lights = lightParent.GetComponentsInChildren<Light>(true);
		int random = 0;
		foreach (Light light in lights)
		{
			++random;
			if(random%2==0)
				light.enabled = false;
		}
	}
	
}
