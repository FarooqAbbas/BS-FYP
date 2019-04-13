using UnityEngine;
using System.Collections;

public class RotateSentry : MonoBehaviour {
    public GameObject projectile;
    public float fireRate=0.5f;
    public float nextFire;
    public float speed=60f;
    public  int id;
    public GameObject firePoint; 


public float attackRange = 30.0f;
public float shootAngleDistance = 10.0f;
public  Transform target;

	// Use this for initialization
	void Start () {
	//    if (target == null ) GameObject.FindWithTag("Player");
     //       target = GameObject.FindWithTag("Player").transform;
	}
	
	// Update is called once per frame
	void Update () {
	 /*   if (target == null)
        return;
   
        if (!CanSeeTarget ())
         return;
     */
        // Rotate towards target   
        var targetPoint = target.position;
        var targetRotation = Quaternion.LookRotation (targetPoint - transform.position, Vector3.up);
        transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, Time.deltaTime * 2.0f);
       // transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, Time.deltaTime*2.0 );
 
        // If we are almost rotated towards target - fire one clip of ammo
        var forward = transform.TransformDirection(Vector3.forward);
        var targetDir = target.position - transform.position;
        if (Vector3.Angle(forward, targetDir) < shootAngleDistance)
        {
            if( Time.time>nextFire)
            {
                nextFire=Time.time+fireRate;
            
            GameObject clone=Instantiate(projectile,firePoint.transform.position,firePoint.transform.rotation) as GameObject;
            
            //clone.rigidbody.velocity = (GameObject.Find("First Person Controller").transform.position - transform.position).normalized * speed;
            //Physics.IgnoreCollision(clone.collider,transform.root.collider);
            clone.rigidbody.velocity = (target.transform.position - transform.position).normalized * speed;		
		
            }
        SendMessage("Fire");

       }
	}
    bool CanSeeTarget ()
    {
        if (Vector3.Distance(transform.position, target.position) > attackRange)
            return false;

        RaycastHit hit;
       // if (Physics.Linecast (transform.position, target.position, hit))
        //    return hit.transform == target;
        if (Physics.Linecast(transform.position, target.position, out hit))
            return hit.transform == target;
        return false;
    }
}
