using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using System.Text.RegularExpressions;
using System.IO;

public class PickingAndPlacingLevel2 : MonoBehaviour {
    
    
    public Dictionary<int, sequence> dictionaryRandomDistribution = new Dictionary<int, sequence>();
    String got;
    GameObject targetPlayer;
    int currentObjectCount = 0;
    int pickCount;
    int pickedKey = 0;
    int placeCount = 0;
    public List<string> lstNames = new List<string>();
   
    //List<string> namePicked;

    public GameObject life;
    public GameObject health;
    public GameObject playPause;
    public GameObject finalizer;
    public List<int> listRandomNoGenerator = new List<int>();
    public GameObject go_Parent;
    public AudioClip audioPickedFile;
    public AudioClip audioPlacedFile;
	// Use this for initialization
	void Start () {
        targetPlayer = GameObject.Find("_3rd Person Controller");
        listRandomNoGenerator = sequence.randomForSequence(1, 8, 8);
        //listRandomNoGenerator = sequence.randomForSequence(1, 3, 3);
	}
	 
    void OnTriggerEnter(Collider other)
    {
        PlayerPowers pp = GetComponent<PlayerPowers>();

        pickCount = pp.PickingLimit;
        print("count " + pickCount);

        if (other.gameObject.tag == "Platform")
        {
            print("curret count" + currentObjectCount);
            print("pick count"+pickCount);
            if (currentObjectCount < pickCount)
            {
                got = other.gameObject.name;
                lstNames.Add(got);
                dictionaryRandomDistribution.Add(pickedKey + 1, new sequence(got, listRandomNoGenerator[pickedKey], ""));
                currentObjectCount = currentObjectCount + 1;
                pickedKey = pickedKey+ 1;

                audio.clip = audioPickedFile;
                audio.Play();

                Destroy(other.gameObject);
                TotalPicked();
            }
        }
        else if(other.gameObject.tag=="Destination")
        {
            for (int i = 0; i < lstNames.Count; i++)
            {
                string tmp = qualify(other.gameObject.name);
                
                if (tmp == lstNames[i])
                {

                    audio.clip = audioPlacedFile;
                    audio.Play();

                    other.SendMessage("ActivateChild", true, SendMessageOptions.DontRequireReceiver);
                    print("placeddddddddddddddd");
                    

                    TotalPlaced();
                    WriteCurrentScore(8);
                    
                    if(placeCount>=7)
                    //if (placeCount >= 2)
                    {
                        life.SetActive(false);
                        health.SetActive(false);
                        playPause.SetActive(false);
                        go_Parent.SetActive(true);
                        finalizer.SetActive(true);
                    }
                    placeCount = placeCount + 1;
                    other.gameObject.tag = "Untagged";
                }
            }
        }
        else if (other.gameObject.tag == "OxygenCylinder")
        {
            
            
            Destroy(other.gameObject);
            TotalOxygen();
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


    String qualify(String getIt)
    {
    /*    string[] words = getIt.Split('(');
        string s2 = Regex.Replace(words[0], @"[^A-Za-z]+", String.Empty);
        return s2.ToLower();*/

        return getIt + "(Clone)";
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
    
}
