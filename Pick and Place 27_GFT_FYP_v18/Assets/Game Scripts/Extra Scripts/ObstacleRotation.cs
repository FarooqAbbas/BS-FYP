using UnityEngine;
using System.Collections;

public class ObstacleRotation : MonoBehaviour {
   public float speed=10f;
   public bool xAxis = false;
   public bool yAxis = false;
   public bool zAxis = false;
	// Use this for initialization
	
	// Update is called once per frame
	void Update () {
        if(xAxis)        
        transform.Rotate(speed * Time.deltaTime,0, 0);
        else if(yAxis)
            transform.Rotate(0, speed * Time.deltaTime, 0);
        else if(zAxis)
            transform.Rotate(0,0, speed * Time.deltaTime);

	}
}
