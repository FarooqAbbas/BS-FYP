using UnityEngine;
using System.Collections;

public class EscapePressed : MonoBehaviour {

    public GameObject panelEscape;
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            
            if (panelEscape)
            {
                Time.timeScale = 0;
                panelEscape.SetActive(true);

            }
        }
    }
    void OnClick()
    {
        if (panelEscape)
        {
            Time.timeScale = 0;
            panelEscape.SetActive(true);

        }

    }
}
