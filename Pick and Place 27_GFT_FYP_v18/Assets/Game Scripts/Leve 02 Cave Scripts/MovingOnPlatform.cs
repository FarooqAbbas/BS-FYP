using UnityEngine;
using System.Collections;

public class MovingOnPlatform : MonoBehaviour {

    Animator anim;
	// Use this for initialization
	void Start () {

        anim = gameObject.GetComponent<Animator>();
        
        //AnimationState.speed = 2;
	
	}
 
    void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Player")
        {
            print("trigger entered platform player");
            other.gameObject.transform.parent = gameObject.transform;
        }
    }
    void OnTriggerExit(Collider other)
    {
        if (other.tag == "Player")
        {
            print("trigger entered platform player");
            other.gameObject.transform.parent = null;
        }
    }
}
