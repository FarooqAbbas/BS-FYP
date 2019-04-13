using UnityEngine;
using System.Collections;

using System.IO;
public class StatusScore : MonoBehaviour {

	 
   
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
    }
}
