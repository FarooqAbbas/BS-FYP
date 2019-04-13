using UnityEngine;
using System.Collections;
using System.IO;
public class StoreBuying : MonoBehaviour {

    //public GameObject PanelStore;
    public GameObject startUp;
    public GameObject character;

    void BuyLife()
    {
        int tCoins = GetCoinsCount();
        print(tCoins);
        if (tCoins > 100)
        {
            print(true);
            UpdateTotalLife();
            UpdateTotalCoins(100);

        }

    }
    void BuyOxygen()
    {
        int tCoins = GetCoinsCount();
        if (tCoins > 50)
        {

            UpdateTotalOxygen();
            UpdateTotalCoins(50);

        }

    }
    void BackMainMenu()
    {

        if (startUp)
        {
            startUp.SetActive(true);
            character.SetActive(true);
            this.gameObject.SetActive(false);
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
    void UpdateTotalCoins(int price)
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
        int temp = int.Parse(str) - price;

         path = Application.persistentDataPath + "/totalCoins.txt";
        //if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine(temp);
            }
        }

    }
    void UpdateTotalLife()
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
        int temp = int.Parse(str) +1;

        path = Application.persistentDataPath + "/totalLives.txt";
        //if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine(temp);
            }
        }
    }
    void UpdateTotalOxygen()
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
        int temp = int.Parse(str) + 1;

        path = Application.persistentDataPath + "/totalOxygen.txt";
        //if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine(temp);
            }
        }
    }
}
