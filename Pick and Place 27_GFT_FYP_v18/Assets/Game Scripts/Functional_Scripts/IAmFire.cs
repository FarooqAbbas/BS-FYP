using UnityEngine;
using System.Collections;

public class IAmFire : MonoBehaviour {

	void OnTriggerEnter(Collider target)
	{
		if(target.gameObject.tag=="Building_Ground")
		{
			//print("I am collided with building_road");
			Destroy(gameObject);
		}
	}
}
