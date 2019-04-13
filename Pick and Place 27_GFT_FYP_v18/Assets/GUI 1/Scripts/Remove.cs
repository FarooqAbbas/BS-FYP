using UnityEngine;
using System.Collections;
using System.Collections.Generic;
public class Remove : MonoBehaviour {

    public GameObject Gridoo;
    BetterList<Transform> t = new BetterList<Transform>();
	// Use this for initialization
 

    void OnClick()
    {
        Destroy(gameObject);
    }
}
