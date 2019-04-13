using UnityEngine;
using System.Collections;
using System.IO;

public class TimeTrail : MonoBehaviour {
    UIToggle timeTrail;
    int data;
	// Use this for initialization
	void Awake () {
        TimeTrailMode(0);
	
	}
	 


    void OnClick()
    {
        timeTrail = this.gameObject.GetComponent<UIToggle>();
        if (timeTrail.value == true)
        {

            TimeTrailMode(1);
        }
        else if (timeTrail.value == false)
        {

            TimeTrailMode(0);
        }

        
    }

    void TimeTrailMode(int val)
    {
        string path = Application.persistentDataPath + "/timeTrailMode.txt";
        //if (!File.Exists(path))
        {
            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine(val);
            }
        }
    }
}
