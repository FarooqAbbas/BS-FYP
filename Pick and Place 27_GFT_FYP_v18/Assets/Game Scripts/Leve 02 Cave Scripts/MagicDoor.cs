using UnityEngine;
using System.Collections;

public class MagicDoor : MonoBehaviour {

    GameObject targetPlayer;
    public GameObject SecondMagicDoor;
    bool stateIn;
	// Use this for initialization
	void Start () {

        targetPlayer = GameObject.Find("_3rd Person Controller");
        stateIn = true;
	}
	
    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            print("door entered");
            //targetPlayer.transform.rotation = SecondMagicDoor.transform.rotation;
            targetPlayer.transform.position = SecondMagicDoor.transform.position;
            //SecondMagicDoor.SendMessage("InsideState", true, SendMessageOptions.DontRequireReceiver);
            
        }
    }
    void InsideState(bool val)
    {
        stateIn = val;
    }
    void OnTriggerExit(Collider other)
    {
        stateIn = false;
    }
}
