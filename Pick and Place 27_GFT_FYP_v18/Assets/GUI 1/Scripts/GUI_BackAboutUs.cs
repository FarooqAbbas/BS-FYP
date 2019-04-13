using UnityEngine;
using System.Collections;

public class GUI_BackAboutUs : MonoBehaviour {

    public GameObject startUp;
    public GameObject character;
    void BackToMenu()
    {
        startUp.SetActive(true);
        character.SetActive(true);
        this.gameObject.SetActive(false);
    }

}
