using UnityEngine;
using System.Collections;

public class StartUp : MonoBehaviour {


    //just to make start up game

    //this script is applied to Control-Background_stips in UI
   //GameObject
    public GameObject MainUI;    //UI
    public GameObject UI_C_Start;
    
    public GameObject UI_Level_Selector;
    public Camera menuCamera;


    public GameObject makeParentCamera;
    public GameObject character;
    public GameObject leftArrow;
    public GameObject rightArrow;
    public GameObject settingObj;
    public GameObject storePannel;
    public GameObject aboutUsPanel;



    void AboutUsClicked()
    {

        UI_C_Start.SetActive(false);
        character.SetActive(false);

        aboutUsPanel.SetActive(true);

    }
    void Start()
    {
    
        MainUI.SetActive(true);
        UI_C_Start.SetActive(true);        
        UI_Level_Selector.SetActive(false);
     

    }
    void onPlay()
    {
        menuCamera.orthographic = true;
        menuCamera.orthographicSize = 1.296198f;

        //makeParentCamera.gameObject.transform.parent = iAmFather.gameObject.transform;
        character.SetActive(false);
          UI_C_Start.SetActive(false);
        UI_Level_Selector.SetActive(true);
        //leftArrow.SetActive(false);
        //rightArrow.SetActive(false);
    }


    void loadLevel1()
    {
        startDialog();
        Application.LoadLevel(1);
       
    }

    void loadLevel2()
    {
        startDialog();
        Application.LoadLevel(2);
       
    }
    
    void loadLevel3()
    {
        Handheld.SetActivityIndicatorStyle(AndroidActivityIndicatorStyle.InversedLarge);

        Handheld.StartActivityIndicator();
        //startDialog();
        Application.LoadLevel(3);
        //MainUI.SetActive(false);
       // loadingIndicator.SetActive(true);
        //progressBar.SetActive(true);

    }


    
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
            Application.Quit();
    }
    void startDialog()
    {
        Handheld.SetActivityIndicatorStyle(AndroidActivityIndicatorStyle.InversedLarge);

        Handheld.StartActivityIndicator();
    }

    void StoreClick()
    {
        character.SetActive(false);
        UI_C_Start.SetActive(false);
        storePannel.SetActive(true);

    }
    void settings()
    {
        character.SetActive(false);
        UI_C_Start.SetActive(false);
        settingObj.SetActive(true);
        
    }

    void backFromSettings()
    {
        UI_C_Start.SetActive(true);
        character.SetActive(true);
        settingObj.SetActive(false);
    }

    

}

