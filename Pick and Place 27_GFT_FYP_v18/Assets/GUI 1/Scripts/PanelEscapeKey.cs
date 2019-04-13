using UnityEngine;
using System.Collections;

public class PanelEscapeKey : MonoBehaviour {

    //public GameObject miniMapCamera;
    public GameObject panelEscapeBG;

    public GameObject panelStore;


    void Start()
    {
        if (panelStore)
        {
            panelStore.SetActive(false);
        }
    }
    void BtnContinue()
    {
        Time.timeScale = 1;
        this.gameObject.SetActive(false);

    }
    void BtnStore()
    {
        if (panelStore)
        {
            panelStore.SetActive(true);
            panelEscapeBG.SetActive(false);
        }
    }
    void BtnMainMenu()
    {
        Application.LoadLevel(0);

    }
    void BtnExit()
    {
        Application.Quit();
    }
}
