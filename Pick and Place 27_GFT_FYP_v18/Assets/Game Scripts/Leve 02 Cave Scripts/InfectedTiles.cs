using UnityEngine;
using System.Collections;

public class InfectedTiles : MonoBehaviour {
    
    float fireRate=1.5f;
	private float nextFire;
    int status = 1;
	// Use this for initialization
	void Update () {

        if (status==1)
        {
            //nextFire = Time.time + fireRate;
            if (Time.time > nextFire)
            {
                nextFire = Time.time + fireRate;
                this.renderer.enabled = true;
                this.collider.enabled = true;
                status = 2;
            }
        }
        else if (status == 0)
        {
            if (Time.time > nextFire)
            {
                nextFire = Time.time + fireRate;
                this.renderer.enabled = false;
                this.collider.enabled = false;
                status = 1;
            }
        }
        
	
	}

    void OnTriggerEnter(Collider other)
    {
        nextFire = Time.time + fireRate;
        print("exit");
        if (other.gameObject.tag == "Player")
        {
            status = 0;
         }
    }
	// Update is called once per frame
    
  /*  void OnTriggerStay(Collider other)
    {
        
        print("exit");
        if (other.gameObject.tag == "Player")
        {
            if (Time.time > nextFire)
            {
                nextFire = Time.time + fireRate;
                this.renderer.enabled = false;
                this.collider.enabled = false;
                //status = true;
            }
            // Destroy(gameObject, destroyTime);
        }
    }*/

}
