using UnityEngine;
using System.Collections;

public class ButtonExit : MonoBehaviour {

    void OnClick()
    {
        Application.Quit();
        //Application.LoadLevel(0);
    }
}
