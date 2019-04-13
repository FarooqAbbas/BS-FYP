using UnityEngine;
using System.Collections;

public class AnimationSpeedController : MonoBehaviour {

    public float speed = 0.5f;
	// Use this for initialization
	void Start () {
        animation["Take 001"].speed = speed;
       // animation.Play("Take 001");
       // animation.Play("rotate");
	}
	
}
