using UnityEngine;
using System.Collections;
using System.IO;

public class CreateAllFiles : MonoBehaviour {

    void Awake()
    {
        ClothName();
        TotalLives();
        TotalOxygen();
        MemoryState();
        TotalScore();
        TotalPicked();
        TotalPlaced();
        TotalWins();
        TotalLoss();
        TotalCoins();

        CurrentScore();
        CurrentTimeScore();
        CurrentCoins();
        TimeTrailMode();
        PickingLimit();

    }
	

    void ClothName()
    {
        string path = Application.persistentDataPath + "/clothName.txt";
        if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine("diss_01");
            }
        }
    }
    void TotalLives()
    {
        string path = Application.persistentDataPath + "/totalLives.txt";
        if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine("1");
            }
        }
    }
    void TotalOxygen()
    {
        string path = Application.persistentDataPath + "/totalOxygen.txt";
        if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine("1");
            }
        }
    }
    void MemoryState()
    {
        string path = Application.persistentDataPath + "/memoryState.txt";
        if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine("4");
            }
        }
    }
    void TotalScore()
    {
        string path = Application.persistentDataPath + "/totalScore.txt";
        if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine("0");
            }
        }
    }
    void TotalPicked()
    {
        string path = Application.persistentDataPath + "/totalPicked.txt";
        if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine("0");
            }
        }
    }
    void TotalPlaced()
    {
        string path = Application.persistentDataPath + "/totalPlaced.txt";
        if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine("0");
            }
        }
    }
    void TotalWins()
    {
        string path = Application.persistentDataPath + "/totalWins.txt";
        if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine("0");
            }
        }
    }
    void TotalLoss()
    {
        string path = Application.persistentDataPath + "/totalLoss.txt";
        if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine("0");
            }
        }
    }
    void TotalCoins()
    {
        string path = Application.persistentDataPath + "/totalCoins.txt";
        if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine("0");
            }
        }
    }
    void CurrentScore()
    {
        string path = Application.persistentDataPath + "/currentScore.txt";
        //if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine("0");
            }
        }
    }
    void CurrentTimeScore()
    {
        string path = Application.persistentDataPath + "/currentTimeScore.txt";
        //if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine("0");
            }
        }
    }
    void CurrentCoins()
    {
        string path = Application.persistentDataPath + "/currentCoins.txt";
        //if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine("0");
            }
        }
    }

    void TimeTrailMode()
    {
        string path = Application.persistentDataPath + "/timeTrailMode.txt";
        //if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine("0");
            }
        }
    }
    void PickingLimit()
    {
        string path = Application.persistentDataPath + "/pickingLimit.txt";
        if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine("3");
            }
        }
    }
}
