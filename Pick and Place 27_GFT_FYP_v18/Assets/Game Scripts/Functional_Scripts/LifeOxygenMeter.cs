using UnityEngine;
using System.Collections;

public class LifeOxygenMeter : MonoBehaviour {
    UISlider lifeSlider;
    public GameObject gameOver;
    public GameObject gameobject;
    public GameObject _continue;
    public GameObject retryPanel;
    float val;
    UISprite lifeSprite;
    Color meterColor;


    float red, green, blue = 0.0f;

    public GameObject lifeSliderObj;
    public GameObject lifeSpriteObj;
    GameObject targetPlayer;
    // Use this for initialization
    void Start()
    {
        targetPlayer = GameObject.Find("_3rd Person Controller");
    }

    // Update is called once per frame
    void Update()
    {
        PlayerPowers pp = targetPlayer.GetComponent<PlayerPowers>();
        float getVal = float.Parse(pp.TxtOxygen);
        if (getVal <= 1)
        {
            gameobject.SetActive(false);
            _continue.SetActive(false);
            retryPanel.SetActive(true);
            gameOver.SetActive(true);


        }
        lifeSlider = lifeSliderObj.GetComponent<UISlider>();
        //float valO = lifeSlider.value;

        float valO = getVal;
        valO = valO / 100;
        lifeSlider.value = valO;
/*
        val = 1 - valO;
        if (val < 0.5 && 0 < val)
        {
            green = 1.0f;
            red = 2.0f * val;
        }

        else if (0.5 <= val && val <= 1.0)
        {
            red = 1.0f;
            green = 1.0f - 2.0f * (val - 0.5f);
        }

        meterColor = new Color(red, green, blue);

        lifeSprite = lifeSpriteObj.GetComponent<UISprite>();
        lifeSprite.color = meterColor;
        */

    }
}
