using UnityEngine;
using System.Collections;
using System.IO;

public class TopGuiBar : MonoBehaviour {


   
    UILabel uiLbl;
    public float fireRate = 5f;
    private float nextFire;
	// Use this for initialization
	void Start () {
        uiLbl = gameObject.GetComponent<UILabel>();
        uiLbl.text = GetCoinsCount().ToString();
	
	}
	
	// Update is called once per frame
    void Update()
    {
        if (Time.time > nextFire)
        {
            nextFire = Time.time + fireRate;
            uiLbl.text = GetCoinsCount().ToString();
        }
	}

    int GetCoinsCount()
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
        int temp = int.Parse(str);
        return temp;

    }
}
