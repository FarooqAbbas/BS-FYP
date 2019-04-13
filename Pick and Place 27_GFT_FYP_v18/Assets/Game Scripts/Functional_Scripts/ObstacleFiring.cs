using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class ObstacleFiring : MonoBehaviour {


	private GameObject projectile;
	private GameObject targetPlayer;        //drag and drop your dataHandler here
	public float fireRate=0.5f;
	private float nextFire;
	public float speed=60;
	private int id;
	public List<GameObject> obstacles = new List<GameObject>();   // dynamic list of obstacles
	
	int randSelectedChild;

	// Use this for initialization
	void Start () {
	
		targetPlayer=GameObject.Find("_3rd Person Controller");

	}
	
	// Update is called once per frame
	void Update () {

//		var distance=Vector3.Distance(dataHandler.transform.position, transform.position);
//		if (distance < 30) 
//		{
		if( Time.time>nextFire)
		{
			nextFire=Time.time+fireRate;
			// select an obstacle randomly from list
			id=Random.Range(0,obstacles.Count); 
			projectile=obstacles[id];
			GameObject clone=Instantiate(projectile,transform.position,transform.rotation) as GameObject;
            
			//clone.rigidbody.velocity = (GameObject.Find("First Person Controller").transform.position - transform.position).normalized * speed;
			//Physics.IgnoreCollision(clone.collider,transform.root.collider);
			clone.rigidbody.velocity = (targetPlayer.transform.position - transform.position).normalized * speed;		
		
		}
//		}

	
	}
}
