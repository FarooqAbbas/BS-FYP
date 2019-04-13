using UnityEngine;
using System.Collections;

public class PlayPause : MonoBehaviour
{

    // Use this for initialization
    public bool isPause;
    bool vl;
    public GameObject play;
    public GameObject Pause;
    public GameObject leftThumbController;
    UISprite sp;
    int counter = 0;

    void Start()
    {
        play.SetActive(false);
        Pause.SetActive(true);
    }

    public void handleIt()
    {
        ++counter;
        if (counter % 2 == 0)
        {

            play.SetActive(false);
            Pause.SetActive(true);
            Time.timeScale = 1;
            leftThumbController.SetActive(true);



        }


        else if (counter % 2 == 1)
        {
            play.SetActive(true);
            Pause.SetActive(false);
            Time.timeScale = 0;


            leftThumbController.SetActive(false);

        }

    }


}
