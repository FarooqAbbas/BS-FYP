using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class PlayerPowers : MonoBehaviour {

    public GameObject gameOverPanel;
    string txtHealth;
    string txtOxygen;
    int pickingLimit;
	int score;
    /////////////////////   
    string clothName;
    int tLives;
    int oxygenCylinderTotal;
    int totalScore;
    int totalPicked;
    int totalPlaced;
    int totalWins;
    int totalLosses;
    int totalCoins;



	// Use this for initialization
	void Start () {
        txtHealth = "50";
        txtOxygen = "50";
        pickingLimit = 8;
		score=0;
	}
	
	
    public string TxtHealth
    {
        get { return txtHealth; }
        set
        {
            

            int val=int.Parse(txtHealth);
            if (val >= 1 && val <= 100)
                txtHealth = value;
            else if (val < 1)
            {
                txtHealth = "1";
              //  gameOverPanel.SetActive(true);
            }
            else if (val > 100)
                txtHealth = "99";
        }
    }
    public string TxtOxygen
    {
        get { return txtOxygen; }
        set 
        {
            float val = float.Parse(txtOxygen);
            if (val >= 1 && val <= 100)
                txtOxygen = value;
            else if (val < 1)
                txtOxygen = "1";
            else if (val > 100)
                txtOxygen = "99";
        }
    }
    public int PickingLimit
    {
        get { return pickingLimit; }
        set
        {
            
            pickingLimit = value;
        }
    }
	public int Score
	{
		get { return score; }
		set { score+= value; }
	}

    /////////////////////
    
    public string ClothName
    {
        get { return clothName; }
        set { clothName = value; }
    }
    public int TLives
    {
        get { return tLives; }
        set { tLives = value; }
    }
    public int OxygenCylinderTotal
    {
        get { return oxygenCylinderTotal; }
        set
        {
            oxygenCylinderTotal = value;

        }
    }
    public int TotalScore
    {
        get { return totalScore; }
        set { totalScore = value; }
    }
   
    public int TotalPicked
    {
        get { return totalPicked; }
        set { totalPicked = value; }
    }
    public int TotalPlaced
    {
        get { return totalPlaced; }
        set { totalPlaced = value; }
    }
    public int TotalWins
    {
        get { return totalWins; }
        set { totalWins = value; }
    }
    public int TotalLosses
    {
        get { return totalLosses; }
        set { totalLosses = value; }
    }
    public int TotalCoins
    {
        get { return totalCoins; }
        set { totalCoins = value; }
    }
}
