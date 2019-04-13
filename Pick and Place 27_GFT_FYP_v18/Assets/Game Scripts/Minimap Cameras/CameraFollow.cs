using UnityEngine;
using System.Collections;

public class CameraFollow : MonoBehaviour {

	private GameObject targetPlayer;
    public GameObject playerArrow;

	void Start()
	{
		targetPlayer = GameObject.Find ("_3rd Person Controller");
	}

	void LateUpdate()
	{

		transform.position = new Vector3 (targetPlayer.transform.position.x, transform.position.y, targetPlayer.transform.position.z);
        playerArrow.transform.position = targetPlayer.transform.position;
	}
}
