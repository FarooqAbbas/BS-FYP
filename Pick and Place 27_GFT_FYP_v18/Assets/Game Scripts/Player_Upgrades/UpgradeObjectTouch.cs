using UnityEngine;
using System.Collections;
using System.IO;

public class UpgradeObjectTouch : MonoBehaviour {

    GameObject targetPlayer;
	// Use this for initialization
	void Start () {
        targetPlayer = GameObject.Find("_3rd Person Controller");
	}
	
	// Update is called once per frame


    void OxygenActive()
    {
        PlayerPowers pp = targetPlayer.GetComponent<PlayerPowers>();
        if (GetOxygenCount() > 0)
        {

            pp.TxtOxygen = "100";
            TotalOxygen();
        }
    }
    void LifeActive()
    {
        PlayerPowers pp = targetPlayer.GetComponent<PlayerPowers>();
        if (GetLivesCount() > 0)
        {

            pp.TxtHealth = "100";
            TotalLives();
        }
    }
  /*  void OnMouseDown()
    {
        
        if (gameObject.tag == "OxygenCylinder")
        {
            PlayerPowers pp = targetPlayer.GetComponent<PlayerPowers>();
            if (GetOxygenCount() > 0)
            {
                
                pp.TxtOxygen = "100";
                TotalOxygen();
            }

        }
        else if (gameObject.tag == "Diamond")
        {
            PlayerPowers pp = targetPlayer.GetComponent<PlayerPowers>();
            if (GetLivesCount() > 0)
            {

                pp.TxtHealth = "100";
                TotalLives();
            }

        }
    }*/
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
        int total = int.Parse(str) -1;
        using (StreamWriter sw = File.CreateText(path))
        {
            sw.WriteLine(total.ToString());
        }
       
    }
    int  GetOxygenCount()
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
        int temp = int.Parse(str);
        return temp;

    }
    /////////////
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
        int total = int.Parse(str) -1;
        using (StreamWriter sw = File.CreateText(path))
        {
            sw.WriteLine(total.ToString());
        }
       
    }
    int GetLivesCount()
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
        int temp = int.Parse(str);
        return temp;

    }

}
