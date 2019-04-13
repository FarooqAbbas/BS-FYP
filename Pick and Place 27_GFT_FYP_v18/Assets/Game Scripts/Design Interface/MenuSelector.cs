using UnityEngine;
using System.Collections;

public class MenuSelector : MonoBehaviour {

    public int loadLevel;

    void OnPress(bool isPressed)
    {
        if (isPressed)
        {
            Application.LoadLevel(loadLevel);
        }
    }
}
