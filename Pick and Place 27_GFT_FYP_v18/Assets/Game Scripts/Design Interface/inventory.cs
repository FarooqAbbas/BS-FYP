using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class inventory : MonoBehaviour
{

    /// <summary>
    ///Apply this script to DataHandeler which is infact empty GameObject
    ///drag and drop _3rdPersonController to dataHandler GameObject
    /// </summary>
    public GameObject targetPlayer;



    /**********************************************/
    //drag and drop GameObject (having All 3d scene+character+Camera+lights)
    public GameObject game;
    // going to use this dictionary in the script where we will make sprites for the Finalizing scene
    // like currently we are using this dictionary in AddChilds_4.cs
    public Dictionary<int, sequence> dic;
    public int count;
    // Use this for initialization
    void Start()
    {
		//targetPlayer=GameObject.Find("_3rd Person Controller");
    }

    // Update is called once per frame
    void Update()
    {
        if (game.activeInHierarchy == true)
        {

            PickingAndPlacingLevel2 pp = targetPlayer.GetComponent<PickingAndPlacingLevel2>();
            dic = pp.dictionaryRandomDistribution;
            count = dic.Count;
            /********************  NO NEED JUST FOR TESTING   *********************/
                      
        }
    }
}
