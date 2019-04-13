using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;

public class GameOverRetryMenu : MonoBehaviour
{

    GameObject dataHandler;
    public Dictionary<int, sequence> dicForCompare;
    inventory ino;
    int nextIncrement;
    dbAccess db;

    public GameObject lblitemsObject;
    UILabel lblitems;
    public GameObject statusObj;
    public GameObject gameOver;
    // Use this for initialization


    void Awake()
    {
        db = GetComponent<dbAccess>();
    }


    void Start()
    {
        db = GetComponent<dbAccess>();
        nextIncrement = 0;
        dataHandler = GameObject.Find("DataHandler");
        ino= dataHandler.GetComponent<inventory>();
        dicForCompare = ino.dic;
        nextIncrement=ino.count;
    }

    

    public void reTry()
    {
        
        Application.LoadLevel(Application.loadedLevel);
    }

    public void menu()
    {
        Application.LoadLevel(0);
    }



    public void _continue()
    {
       //#if UNITY_ANDROID


        //here use FileHandlingDemo handlina
        /********************************************************************************************/
      
        /////////////////  here add and delete in file handling

        

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
        int temp = int.Parse(str)+1;

        using (StreamWriter sw = File.CreateText(path))
        {
            if (temp >= 6)
            {
                sw.WriteLine(6);
            }
            else
                sw.WriteLine(temp);
        }
         



                                Application.LoadLevel(Application.loadedLevel);
        /*******************************************************************************************/

      // #endif

        

       
    }



    public void reset()
    {
   
    }



    void status()
    {

        
        statusObj.SetActive(true);
        gameOver.SetActive(false);
    }

}
