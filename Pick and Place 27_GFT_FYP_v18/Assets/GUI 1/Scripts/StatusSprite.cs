using UnityEngine;
using System.Collections;
using System.IO;

public class StatusSprite : MonoBehaviour {


    public GameObject lblScore;
    public GameObject lblTimeScore;
    public GameObject lblCoins;
    UILabel blScore,blTimeScore,blCoins;

    void Start()
    {
        blScore = lblScore.GetComponent<UILabel>();
        //uiLbl.text = GetCoinsCount().ToString();
        blTimeScore = lblTimeScore.GetComponent<UILabel>();
        blCoins = lblCoins.GetComponent<UILabel>();
        blScore.text = GetCurrentScore().ToString() ;
        blTimeScore.text = GetCurrentTimeScore().ToString();
        blCoins.text = GetCurrentCoins().ToString();

    }
 
    int GetCurrentScore()
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
        int temp = int.Parse(str);
        return temp;

    }
    
    int GetCurrentTimeScore()
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
        int temp = int.Parse(str);
        return temp;

    }
    int GetCurrentCoins()
    {
        string path = Application.persistentDataPath + "/currentCoins.txt";
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
