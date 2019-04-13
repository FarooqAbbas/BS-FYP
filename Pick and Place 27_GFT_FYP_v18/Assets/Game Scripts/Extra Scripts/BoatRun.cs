using UnityEngine;
using System.Collections;

public class BoatRun : MonoBehaviour {

	public float speed=5;
	// Use this for initialization
	
	// Update is called once per frame
	void Update () {
	
		transform.Translate (Vector3.right * speed * Time.deltaTime);
	}
	void OnTriggerEnter(Collider other) {
		//Destroy(other.gameObject);
		//print ("trigger enter");

		speed = speed * (-1);
	}

}
