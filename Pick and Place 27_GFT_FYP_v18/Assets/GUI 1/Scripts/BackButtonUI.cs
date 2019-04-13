using UnityEngine;
using System.Collections;

public class BackButtonUI : MonoBehaviour {

    public GameObject UI_C_Start;
    public GameObject UI_Level_Selector;
     
    void OnClick()
    {
        UI_Level_Selector.SetActive(false);
        UI_C_Start.SetActive(true);

    }
}
