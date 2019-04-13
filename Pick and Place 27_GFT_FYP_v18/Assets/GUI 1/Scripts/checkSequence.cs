using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System;
using System.Linq;
using System.IO;

public class checkSequence : MonoBehaviour
{
    public static int count;     //the parfect use of static........love in it


    GameObject dataHandler;
    public Dictionary<int, sequence> dicForCompare;

    public GameObject finalizer;
    public GameObject go;
    private BoxCollider boxCollider;
    public GameObject retry;
    public GameObject _continue;
    public GameObject okObject;
   
    UISprite okSprite;
    bool waitActive=false;
    public float fireRate = 1.5f;
    private float nextFire;
    public float timeElapsed;
    public GameObject Sprite_Finish;
    public GameObject Sprite_GameOver;

    /***********************************************************/
    public int timeFactor = 5;
    public float timeLeft;
    public GameObject lblTimeObject;  //ngui
    public string currentTime;
    int stateFromFile;

    void Awake()
    {

        string path = Application.persistentDataPath + "/timeTrailMode.txt";
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
        int temp = int.Parse(str);
        stateFromFile = temp;
        print("awake time trail mode " + stateFromFile);
    }


    void Update()
    {

        nextFire = Time.time + fireRate;

        /////////////////// file 


        if (stateFromFile == 1)
        {
            timeLeft -= Time.deltaTime;
            UILabel lblTime = lblTimeObject.GetComponent<UILabel>();

            int mintue = 0;
            int second = 0;
            int fraction = 0;
            var guiTime = timeLeft;
            mintue = (int)guiTime / 60;
            second = (int)guiTime % 60;
            fraction = (int)(guiTime * 100) % 100;

            currentTime = String.Format("{0:00}:{1:00}:{2:00}", mintue, second, fraction);
            lblTime.text = currentTime;

            if (timeLeft < 0)
            {
                timeLeft = 0;


                Sprite_GameOver.SetActive(true);
                finalizer.SetActive(false);
            }
        }
    }
   
    void Start()
    {
        count = 0;
        //getting dictionary from Inventory.cs  applied on (Datahandler)
        dataHandler = GameObject.Find("DataHandler");
        inventory ino = dataHandler.GetComponent<inventory>();
        dicForCompare = ino.dic;
        //finalizer = GameObject.Find("Finalizer");
        int pickedCount = dicForCompare.Count;
        //timeElapsed = Time.deltaTime;
        timeLeft = (float)timeFactor * (float)pickedCount;
    }


    public void OnClick()
    {


        if (count == 0)     //at first click we check condition and increment to show first click 
        {
            count = 1;           
        }
        else
        {
            // Dance.....party time....
        }

        print("count Value"+count);

        //this will provide name of destroyed child
        string Name = gameObject.name;
        // now using name we will  get index value to delete  child from grid
        var regex = Regex.Match(Name, @"\d+");
        var result = regex.ToString();
        // here we got index 
        Debug.Log("Index value i got =" + result);
        int indexValue = Convert.ToInt32(result);
        /************************************* essence of Whole Game**********************/
        int key = dicForCompare.FirstOrDefault(y => y.Value.Random == indexValue).Key;
        /********************************************************************************/
        // print("key=="+key);
        if (count == key)
        {
   
                UISprite okSprite = okObject.GetComponent<UISprite>();
                okSprite.spriteName = "ok";

                if (count >= dicForCompare.Count)
                {
                    finalizer.SetActive(false);
                    go.SetActive(true);
                    //print("Final Time elapsed "+timeElapsed); 
                    print("my count isssssssssss " + count +"       time leftttttt "+timeLeft);
                    float tp1 = timeLeft * count;
                    print("*************** " + tp1);
                    int temp = Convert.ToInt32(tp1);
                    print("conveeeeeeeeeeeeeeeeeert " + temp);
                    CurrentTimedScore(temp);
                    Sprite_Finish.SetActive(true);
                    retry.SetActive(true);
                    //_continue.SetActive(true);           
                }

            count = count + 1;

        }
        else
        {
            
            UISprite okSprite = okObject.GetComponent<UISprite>();
            okSprite.spriteName = "notOk";
           
            // if we unable to make sequence
            print("you are going wrong");
            finalizer.SetActive(false);
            go.SetActive(true);
            Sprite_GameOver.SetActive(true);
            //_continue.SetActive(false);
            retry.SetActive(true);
        }
    }
    //////////////////////////////////////88888888888888888888888888888888
    void CurrentTimedScore(int val)
    {
        string path = Application.persistentDataPath + "/currentTimeScore.txt";
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
        using (StreamWriter sw = File.CreateText(path))
        {
            sw.WriteLine(total.ToString());
        }
    }
}
