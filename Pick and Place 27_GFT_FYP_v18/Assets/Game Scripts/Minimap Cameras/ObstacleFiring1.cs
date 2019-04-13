using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class ObstacleFiring1 : MonoBehaviour {


	private GameObject projectile;
	private GameObject targetPlayer;        //drag and drop your dataHandler here
	public float fireRate=0.5f;
	private float nextFire;
	public float speed=60;
	private int id;
	public List<GameObject> obstacles = new List<GameObject>();   // dynamic list of obstacles


	Transform[] allChildrens;
	int randSelectedChild;

	// Use this for initialization
	void Start () {
	
		targetPlayer=GameObject.Find("_3rd Person Controller");
		allChildrens = gameObject.GetComponentsInChildren<Transform>();
		for(int i=1; i<allChildrens.Length;i++)
		{
			allChildrens[i].gameObject.SetActive(false);
			
		}
	}
	
	// Update is called once per frame
	void Update () {
	

		

		foreach(Transform child in allChildrens)
		{
			//child.gameObject.SetActive(false);
		}

		// randomly selected near gun
		randSelectedChild=Random.Range(0,allChildrens.Length-1);
		var distance=Vector3.Distance(targetPlayer.transform.position, allChildrens[randSelectedChild].transform.position);
		if (distance < 150) 
		{
			// activate near gun
			//allChildrens[randSelectedChild].gameObject.SetActive(true);

			if( Time.time>nextFire)
			{
				nextFire=Time.time+fireRate;
				// select an obstacle randomly from list
				id=Random.Range(0,obstacles.Count); 
				projectile=obstacles[id];
				GameObject clone=Instantiate(projectile,allChildrens[randSelectedChild].transform.position,allChildrens[randSelectedChild].transform.rotation) as GameObject;
				//clone.rigidbody.velocity = (GameObject.Find("First Person Controller").transform.position - transform.position).normalized * speed;
				//Physics.IgnoreCollision(clone.collider,transform.root.collider);
				clone.rigidbody.velocity = (targetPlayer.transform.position - transform.position).normalized * speed;

				
				
			}
		}

	}
}
