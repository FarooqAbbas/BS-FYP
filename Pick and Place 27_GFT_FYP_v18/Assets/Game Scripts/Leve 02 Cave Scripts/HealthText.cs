using UnityEngine;
using System.Collections;

public class HealthText : MonoBehaviour {

    private GameObject targetPlayer;
	// Use this for initialization
	void Start () {
        targetPlayer = GameObject.Find("_3rd Person Controller");
	
	}
	
	// Update is called once per frame
	void Update () {
        this.guiText.text = targetPlayer.GetComponent<PlayerPowers>().TxtHealth.ToString();
	}
}
