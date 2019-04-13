using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;

public class RandomObjectCreation : MonoBehaviour {



	public GameObject platformMap;
	//private GameObject targetPlane;
	private GameObject targetPlayer;
	public bool pickState=false;
	public int gameLevel=1;
    int ppObjectsWeWant;
  
	public List<Transform> myList = new List<Transform>();
	private int randPlatform;
    List<int> selectRandom;
   public int PickingStateCounter=0;
    PickingAndPlacing pp;


    void Awake()
    {
        targetPlayer = GameObject.Find("_3rd Person Controller");
        selectRandom = sequence.randomForSequence(0, myList.Count - 1, myList.Count); // list of Unique random number created
        pp = targetPlayer.GetComponent<PickingAndPlacing>(); 

    }


	// Use this for initialization
	void Start () {
		    
        ppObjectsWeWant = pp.objectWeWant; //  object we want in PickingAndPlacing script       		
	}
	
	// Update is called once per frame
	void Update () {

		GameObject clone;
		GameObject clonePlatformMap;
		int randSelectedChild;

		Transform[] allChildren = GetComponentsInChildren<Transform>();
		foreach (Transform child in allChildren) {}
        
        // pick state will get true from PickingAndPlacing script as gotMessage

        // PickingStateCounter is value from PickingStateFun() 
        // each time we send gotMessage from PickingAndPlacing Script we got increment in PickingStateCounter
        if (!pickState && PickingStateCounter < ppObjectsWeWant)
            {
               // print("object created ="+PickingStateCounter);
               // print("PickingStateCounter from  update" + PickingStateCounter);
                randPlatform = selectRandom[PickingStateCounter]; // first time it get default 0 from above initialization
                randSelectedChild = UnityEngine.Random.Range(0, allChildren.Length - 1);
                

                float centerX = allChildren[randSelectedChild].transform.position.x + allChildren[randSelectedChild].transform.localScale.x / 2;
                //		float centerZ = allChildren [randNo].transform.position.z + allChildren [randNo].transform.localScale.z / 2;
                float centerZ = allChildren[randSelectedChild].transform.position.z;

                Vector3 randomPosition = new Vector3(allChildren[randSelectedChild].transform.position.x, 1, centerZ);
                var distance = Vector3.Distance(targetPlayer.transform.position, allChildren[randSelectedChild].transform.position);
                if (distance <= gameLevel * 50)
                {
                    clone = Instantiate(myList[randPlatform].transform, randomPosition, myList[randPlatform].rotation) as GameObject;
                    myList[randPlatform].position = allChildren[randSelectedChild].position;
                    pickState = true;
                    // Creating Object for MapSystem
                    clonePlatformMap = Instantiate(platformMap.transform, randomPosition, platformMap.transform.rotation) as GameObject;

                }

            }
            else if (!myList[randPlatform].gameObject.activeSelf)
            {
                pickState = false;
                //print("Platform in destroy state");
            }

      
	}// end void
	void PickingStateFun(bool state)
	{
        // PickingStateCounter  is initialized by 0
       
        PickingStateCounter = PickingStateCounter + 1;
        print("PickingStateCounter from Fun=" + PickingStateCounter);
		pickState = state;
        pp.onAllTriggers();
		//print("Object received= "+ state);
		Destroy (GameObject.Find("_PlatformMap(Clone)"));
	}

  
 

}
