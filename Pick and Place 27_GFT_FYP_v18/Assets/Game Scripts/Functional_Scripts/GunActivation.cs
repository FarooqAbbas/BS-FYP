using UnityEngine;
using System.Collections;


public class GunActivation : MonoBehaviour {

	public float distanceFromPlayer=10f;
	Renderer[] allChildrens;
    
	int count=0;
	public GameObject targetPlayer;
    private float fireRate = 5f;
    private float nextFire;
	// Use this for initialization
	void Start () {

		//targetPlayer=GameObject.Find("_3rd Person Controller");
		allChildrens =transform.GetComponentsInChildren<Renderer> ();
        foreach (Transform g in this.transform)
        {
           // print(g.name);
            g.GetComponent<RotateSentry>().enabled = false;
        }
	
		//for(int i=0; i<allChildrens.Length;i++)
		{
            
//			allChildrens[i].gameObject.SetActive(false);
            
         
		}
	}
	
	// Update is called once per frame
	void Update () {

        if (Time.time > nextFire)
        {
            nextFire = Time.time + fireRate;
            foreach (Transform g in this.transform)
            {
                print(g.name);
                var dist = Vector3.Distance(targetPlayer.transform.position, g.transform.position);
                if (g.gameObject.renderer.isVisible)// && dist<distanceFromPlayer)
               // if ( dist<distanceFromPlayer)
                {
                    g.GetComponent<RotateSentry>().enabled = true;

                }
                else
                {
                    g.GetComponent<RotateSentry>().enabled = false;
                }
            }
        }
		
	}
}
