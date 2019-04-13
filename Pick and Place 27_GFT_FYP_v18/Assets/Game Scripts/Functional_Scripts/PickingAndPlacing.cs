using UnityEngine;
using System;
using System.Text.RegularExpressions;
using System.Collections;

using System.Collections.Generic;
using System.Linq;
using System.IO;


public class PickingAndPlacing : MonoBehaviour
{
    public GameObject finalize;
    public GameObject game;
    public GameObject UI_Main;
    public GameObject life;
    public GameObject playPause;


    public GameObject destinations;
    public GameObject desiGreenIndicator;
    public GameObject effect;


    /**************************************/
    //   UI/Camera.......................
    public Camera UI_Cam;

    /*****************************************************/
    public List<Transform> tr = new List<Transform>();

    bool picked = false;  //false

    GameObject targetPlayer;
    int count;
    public int objectWeWant;
    public int currentObjectCount = 0;
    int randomSelectCount = 0;
    public Dictionary<int, sequence> dictionaryRandomDistribution = new Dictionary<int, sequence>();
    List<int> listRandomNoGenerator;
    /****************************************************/
    private GameObject randomObjectCreationParent;
    private BoxCollider boxCollider; //for the colliders of destination
    public GameObject indicatorObj; // here is sprite  ...UI Root_NGUI_Score_etc/panel/indication
    public GameObject placeButton;
    private bool Isplaced = false;
    String got;
    public String gotMessage = null;
    public String destMessage = null;
    dbAccess db;
    UILabel lblitem;
    public GameObject itemObj;
    RandomObjectCreation rOC;
    public GameObject targetForPick;
    PlayerPowers playerScore;
    public GameObject go_parent;
    



    void Awake()
    {
        rOC = targetForPick.GetComponent<RandomObjectCreation>();
        targetPlayer = GameObject.Find("_3rd Person Controller");
        playerScore = targetPlayer.GetComponent<PlayerPowers>();
        

        /// here read from file    objectWeWant=    val
        objectWeWant = GetPickingLimit();

    }

    // Use this for initialization
    void Start()
    {


        listRandomNoGenerator = sequence.randomForSequence(1, objectWeWant, objectWeWant);
        randomObjectCreationParent = GameObject.Find("_pp_points_parent");
        count = 0;

    }


    void Update()
    {
        if (currentObjectCount >= objectWeWant)
        {
            game.SetActive(false);
            UI_Main.SetActive(true);
            life.SetActive(false);
            playPause.SetActive(false);
            go_parent.SetActive(true);
            finalize.SetActive(true);

            /*********************************************/
            //     UI/Camera  settings
            UI_Cam.orthographic = true;
            UI_Cam.orthographicSize = 1f;
            /********************************************/
        }
    }




    public void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Platform")
        {
            if (currentObjectCount < objectWeWant)
            {
                picked = true; // we have picked
                // print("From IF Portion");
                // print("Object Picked and sent " + other.gameObject.name);

                /********** Qualify name of our game object and make it suitable for our envirnoment  */
                got = qualify(other.gameObject.name);
                /************************************************************************************   */
                string dictDest = null;

               
                if (got == "dumble")
                {
                    dictDest = "Gym";
                }
                else if (got == "pistol")
                {
                    dictDest = "PoliceStation";
                }
                else if (got == "book")
                {
                    dictDest = "Library";
                }
                else if (got == "idcard" || got=="letter")
                {
                    dictDest = "PostOffice";
                }
                else if (got == "cheque")
                {
                    dictDest = "Bank";
                }
                else if (got == "sword")
                {
                    dictDest = "Museum";
                }



                dictionaryRandomDistribution.Add(currentObjectCount + 1, new sequence(got, listRandomNoGenerator[currentObjectCount], dictDest));  // Important


                foreach (Transform t in tr)
                    if (t.name == dictDest)
                    {
                        GameObject greenClone, effectObj;
                        
                        foreach (Transform Tt in t)
                        {
                            Vector3 pos = new Vector3(Tt.position.x, Tt.position.y + 2, Tt.position.z);
                            effectObj = Instantiate(effect, pos, Tt.transform.rotation) as GameObject;
                            effectObj.name = "partical";


                            greenClone = Instantiate(desiGreenIndicator.transform, pos, Tt.transform.rotation) as GameObject;
                        //    greenClone = Instantiate(desiGreenIndicator.transform, t.position, t.transform.rotation) as GameObject;

                        }
                    }


                Destroy(other.gameObject);



                randomObjectCreationParent.SendMessage("PickingStateFun", picked, SendMessageOptions.DontRequireReceiver);   //false
                print(currentObjectCount);

                foreach (var x in dictionaryRandomDistribution)
                {
                    print("key is " + x.Key + "Name " + x.Value.Name + "Random " + x.Value.Random + "Destination=" + x.Value.Destination);
                }
            }

            else
            {
                // print("From else Portion");

                // i think no need for else portion

                // print("Object Picked and sent " + other.gameObject.name);
                print(currentObjectCount);
                /****************************************/
                Destroy(other.gameObject);
                randomObjectCreationParent.SendMessage("PickingStateFun", true, SendMessageOptions.DontRequireReceiver);  //true
            }


        }


        else if (other.gameObject.tag == "Destination")
        {
            if (picked)     // if we have picked some thing then make indications visible
            {
                if (other.gameObject.name == "PostOffice")
                {
                    if (got == "letter")
                    {
                       playerScore.Score = 5;
                       WriteCurrentScore(5);
                        gotMessage = got;
                        got = null;
                        print("placed");

                        Destroy(GameObject.Find("partical"));
                        Destroy(GameObject.FindGameObjectWithTag("DestiGreen"));
                        rOC.pickState = false;
                        currentObjectCount = currentObjectCount + 1;
                    }
                }
                if (other.gameObject.name == "Bank")
                {
                    if (got == "cheque")
                    {
                       playerScore.Score = 5;
                       WriteCurrentScore(5);
                        gotMessage = got;
                        got = null;
                        print("placed");
                        Destroy(GameObject.Find("partical"));
                        Destroy(GameObject.FindGameObjectWithTag("DestiGreen"));
                        rOC.pickState = false;
                        currentObjectCount = currentObjectCount + 1;
                    }
                }
                else if (other.gameObject.name == "Gym")
                {
                    if (got == "dumble")
                    {
                        playerScore.Score = 5;
                        WriteCurrentScore(5);
                        gotMessage = got;
                        got = null;
                        print("placed");
                        Destroy(GameObject.Find("partical"));
                        Destroy(GameObject.FindGameObjectWithTag("DestiGreen"));
                        rOC.pickState = false;
                        currentObjectCount = currentObjectCount + 1;
                    }
                }

                else if (other.gameObject.name == "PoliceStation")
                {

                    if (got == "pistol")
                    {
                       playerScore.Score = 5;
                       WriteCurrentScore(5);
                        gotMessage = got;
                        got = null;
                        print("placed");
                        Destroy(GameObject.Find("partical"));
                        Destroy(GameObject.FindGameObjectWithTag("DestiGreen"));
                        rOC.pickState = false;
                        currentObjectCount = currentObjectCount + 1;
                    }
                }

                else if (other.gameObject.name == "Library")
                {
                    if (got == "book")
                    {
                       playerScore.Score = 5;
                       WriteCurrentScore(5);
                        gotMessage = got;
                        got = null;
                        print("placed");
                        Destroy(GameObject.Find("partical"));
                        Destroy(GameObject.FindGameObjectWithTag("DestiGreen"));
                        rOC.pickState = false;
                        currentObjectCount = currentObjectCount + 1;
                    }

                }

                else if (other.gameObject.name == "PostOffice")
                {

                    if (got == "idcard")
                    {
                       playerScore.Score = 5;
                       WriteCurrentScore(5);
                        gotMessage = got;
                        got = null;
                        print("placed");
                        Destroy(GameObject.Find("partical"));
                        Destroy(GameObject.FindGameObjectWithTag("DestiGreen"));
                        rOC.pickState = false;
                        currentObjectCount = currentObjectCount + 1;
                    }
                }
                else if (other.gameObject.name == "Museum")
                {
                    //destMessage = other.gameObject.name;
                    //indicatorObj.SetActive(true);
                    //placeButton.SetActive(true);
                    //UISprite yourSprite = indicatorObj.GetComponent<UISprite>();
                    //yourSprite.spriteName = "Museu";
                    if (got == "sword")
                    {
                        playerScore.Score = 5;
                        WriteCurrentScore(5);
                        print("placed");
                        got = null;
                        gotMessage = got;
                        got = null;
                        Destroy(GameObject.Find("partical"));
                        Destroy(GameObject.FindGameObjectWithTag("DestiGreen"));
                        rOC.pickState = false;
                        currentObjectCount = currentObjectCount + 1;
                    }
                }
            }
        }
        else if (other.gameObject.tag == "Diamond")
        {

            Destroy(other.gameObject);
            TotalLives();
        }
        else if (other.gameObject.tag == "Coin")
        {

            Destroy(other.gameObject);
            TotalCoins();
        }

    }

    void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Destination")
        {

            indicatorObj.SetActive(false);
            placeButton.SetActive(false);

        }

    }

    String qualify(String getIt)
    {
        string[] words = getIt.Split('(');
        string s2 = Regex.Replace(words[0], @"[^A-Za-z]+", String.Empty);
        return s2.ToLower();
    }

    void offAllTriggers()
    {
        foreach (Transform t in tr)
        {
            boxCollider = (BoxCollider)t.gameObject.GetComponent(typeof(BoxCollider));
            if (boxCollider.isTrigger == true)
            {

                boxCollider.isTrigger = false;
            }
        }
    }

    public void onAllTriggers()
    {

        foreach (Transform t in tr)
        {
            boxCollider = (BoxCollider)t.gameObject.GetComponent(typeof(BoxCollider));
            boxCollider.isTrigger = true;

        }
    }

    void TotalPicked()
    {
        string path = Application.persistentDataPath + "/totalPicked.txt";
        string str = null;
        // Open the file to read from. 
        using (StreamReader sr = File.OpenText(path))
        {
            string s = "";
            while ((s = sr.ReadLine()) != null)
            {
                str = s;
            }
        }
        int total = int.Parse(str) + 1;
        using (StreamWriter sw = File.CreateText(path))
        {
            sw.WriteLine(total.ToString());
        }
    }
    void TotalPlaced()
    {
        string path = Application.persistentDataPath + "/totalPlaced.txt";
        string str = null;
        // Open the file to read from. 
        using (StreamReader sr = File.OpenText(path))
        {
            string s = "";
            while ((s = sr.ReadLine()) != null)
            {
                str = s;
            }
        }
        int total = int.Parse(str) + 1;
        using (StreamWriter sw = File.CreateText(path))
        {
            sw.WriteLine(total.ToString());
        }
    }
    void TotalOxygen()
    {
        string path = Application.persistentDataPath + "/totalOxygen.txt";
        string str = null;
        // Open the file to read from. 
        using (StreamReader sr = File.OpenText(path))
        {
            string s = "";
            while ((s = sr.ReadLine()) != null)
            {
                str = s;
            }
        }
        int total = int.Parse(str) + 1;
        using (StreamWriter sw = File.CreateText(path))
        {
            sw.WriteLine(total.ToString());
        }
    }
    void TotalLives()
    {
        string path = Application.persistentDataPath + "/totalLives.txt";
        string str = null;
        // Open the file to read from. 
        using (StreamReader sr = File.OpenText(path))
        {
            string s = "";
            while ((s = sr.ReadLine()) != null)
            {
                str = s;
            }
        }
        int total = int.Parse(str) + 1;
        using (StreamWriter sw = File.CreateText(path))
        {
            sw.WriteLine(total.ToString());
        }
    }
    void TotalCoins()
    {
        string path = Application.persistentDataPath + "/totalCoins.txt";
        string str = null;
        // Open the file to read from. 
        using (StreamReader sr = File.OpenText(path))
        {
            string s = "";
            while ((s = sr.ReadLine()) != null)
            {
                str = s;
            }
        }
        int total = int.Parse(str) + 1;

        PlayerPowers pp = GetComponent<PlayerPowers>();
        pp.TotalCoins = total;

        using (StreamWriter sw = File.CreateText(path))
        {
            sw.WriteLine(total.ToString());
        }



        //////////// 8888888888888888888888888 ********************************* ////////////

        string path2 = Application.persistentDataPath + "/currentCoins.txt";
         str = null;
        // Open the file to read from. 
        using (StreamReader sr = File.OpenText(path2))
        {
            string s = "";
            while ((s = sr.ReadLine()) != null)
            {
                str = s;
            }
        }
        total = int.Parse(str) + 1;

        pp = GetComponent<PlayerPowers>();
        pp.TotalCoins = total;

        using (StreamWriter sw = File.CreateText(path2))
        {
            sw.WriteLine(total.ToString());
        }

    }

    void WriteCurrentScore(int val)
    {
        string path = Application.persistentDataPath + "/currentScore.txt";
        string str = null;
        // Open the file to read from. 
        using (StreamReader sr = File.OpenText(path))
        {
            string s = "";
            while ((s = sr.ReadLine()) != null)
            {
                str = s;
            }
        }
        int total = int.Parse(str) + val;

        //PlayerPowers pp = GetComponent<PlayerPowers>();
        //pp.TotalCoins = total;

        using (StreamWriter sw = File.CreateText(path))
        {
            sw.WriteLine(total.ToString());
        }
    }

    int GetPickingLimit()
    {
        string path = Application.persistentDataPath + "/pickingLimit.txt";
        string str = null;
        // Open the file to read from. 
        using (StreamReader sr = File.OpenText(path))
        {
            string s = "";
            while ((s = sr.ReadLine()) != null)
            {
                str = s;
            }
        }
        int total = int.Parse(str);

        return total;
    }

    

}