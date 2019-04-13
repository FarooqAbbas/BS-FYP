using UnityEngine;
using System.Collections;

public class IAmObstacle : MonoBehaviour {

    GameObject targetPlayer;
    public int myPower;
    public bool triggerEnter;
    public bool triggerStay;
    public float infectionSpeed = 0.01f;
    private float nextDamage;
	// Use this for initialization
	void Start () {
        targetPlayer = GameObject.Find("_3rd Person Controller");
	}
	
	
    void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Player" && triggerEnter)
        {
            PlayerPowers pp = targetPlayer.GetComponent<PlayerPowers>();
            int val = int.Parse(pp.TxtHealth);
            val += myPower;
            pp.TxtHealth = val.ToString();
        }
    }
    void OnTriggerStay(Collider other)
    {
        if (other.tag == "Player" && triggerStay)
        {
            if (Time.time > nextDamage)
            {
                nextDamage = Time.time + infectionSpeed;
                PlayerPowers pp = targetPlayer.GetComponent<PlayerPowers>();
                int val = int.Parse(pp.TxtHealth);
                val += myPower;
                pp.TxtHealth = val.ToString();
            }
        }
 

    }

   

}
