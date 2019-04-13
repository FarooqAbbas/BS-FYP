using UnityEngine;
using System.Collections;
using System.Collections.Generic;
public class ObjectCreationLevel2 : MonoBehaviour {

    public GameObject targetClone;
    List<int> selectRandom;
	// Use this for initialization
    void Awake()
    {
        Transform[] allChildren = GetComponentsInChildren<Transform>();
        selectRandom = sequence.randomForSequence(1, allChildren.Length, allChildren.Length); // list of Unique random number created

    }
	void Start () {

        Transform[] allChildren = GetComponentsInChildren<Transform>();
        GameObject clone;
        //for (int i = 0; i < allChildren.Length-1; i++)
        {
            int randSelectedChild = selectRandom[2];

           // randSelectedChild = UnityEngine.Random.Range(0, allChildren.Length);


//            float centerX = allChildren[randSelectedChild].transform.position.x + allChildren[randSelectedChild].transform.localScale.x / 2;
            //		float centerZ = allChildren [randNo].transform.position.z + allChildren [randNo].transform.localScale.z / 2;
  //          float centerZ = allChildren[randSelectedChild].transform.position.z;

    //        Vector3 randomPosition = new Vector3(allChildren[randSelectedChild].transform.position.x, 1, centerZ);
            clone = Instantiate(targetClone, allChildren[randSelectedChild].position, allChildren[randSelectedChild].rotation) as GameObject;
            targetClone.transform.position = allChildren[randSelectedChild].position;

        }
        
	}
	 
}
