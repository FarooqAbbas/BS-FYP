using UnityEngine;
using System.Collections;

public class PlateRotation : MonoBehaviour {

	 
	// Update is called once per frame
	void Update () {
        transform.Rotate(0, 10, 0,Space.Self);
	}
}
