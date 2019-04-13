using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

public class notification : MonoBehaviour
{

    GameObject targetPlayer;
    public GameObject targetForPick;
    RandomObjectCreation rOC;
    PickingAndPlacing pp;
    string gotMessage;
    string destMessage;
    public GameObject showPlaced;
    private bool Isclicked = false;
    UILabel lb;
    int counter = 0;



    public GameObject finalize;   //UI/Finalizer
    public GameObject game;

    public GameObject indi;
    public GameObject life;
    public GameObject playPaues;
    public GameObject place;//GameObject 
   // public GameObject UI_Main;     //UI
    //public GameObject start;      
   // public Camera UI_Cam;           //   UI/camera

    GameObject dataHandler;
    public Dictionary<int, sequence> dicForCompare;
    public bool IsClicked { get { return Isclicked; } set { Isclicked = value; } }


    void Start()
    {
        lb = showPlaced.GetComponent<UILabel>();
        lb.text = "";
        rOC = targetForPick.GetComponent<RandomObjectCreation>();
    }

    public void iClicked()
    {
        IsClicked = true;
        string desti = (from p in dicForCompare
                        where p.Key == rOC.PickingStateCounter
                        select p.Value.Destination).FirstOrDefault();

        print("destination from notifi" + desti);
        print("rOC.PickingStateCounter=" + rOC.PickingStateCounter);

        if (desti != null && desti == destMessage && rOC.PickingStateCounter == counter + 1)
        {
            //Destroy the destiIndictr
            GameObject destiIndictr;
            GameObject effectIndi;
            destiIndictr = GameObject.FindGameObjectWithTag("DestiGreen");
            Destroy(destiIndictr);
            effectIndi = GameObject.Find("partical");

            Destroy(effectIndi);
            counter = counter + 1;

            // lb = showPlaced.GetComponent<UILabel>();
            //lb.text = gotMessage + " placed";              //You can display message from here at NGUI Label
            rOC.pickState = false;    // to create next object
        }
    }




    void Update()
    {
        dataHandler = GameObject.Find("DataHandler");
        inventory ino = dataHandler.GetComponent<inventory>();
        dicForCompare = ino.dic;
        /********************************************************/
        targetPlayer = GameObject.Find("_3rd Person Controller");
        pp = targetPlayer.GetComponent<PickingAndPlacing>();
        /********************************************************/
        if (pp.gotMessage != null)
        {
            gotMessage = pp.gotMessage;   //here we are getting 
            destMessage = pp.destMessage;
        }

        if (counter == pp.objectWeWant)
        {
            indi.SetActive(false);
            playPaues.SetActive(false);
            life.SetActive(false);
            place.SetActive(false);
            game.SetActive(false);
          
            finalize.SetActive(true);    //////////////////////////////////////////////////////////// finalize
           
        }


    }


}
