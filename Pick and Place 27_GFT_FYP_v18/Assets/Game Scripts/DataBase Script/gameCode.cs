using UnityEngine;
using System.Collections;

public class gameCode : MonoBehaviour {
    public int count;
	public int last;
	// Use this for initialization
	void Start () {
        dbAccess db = GetComponent<dbAccess>();

        db.OpenDB("game.db");
        count = db.getCount("loadCount","id" ,"count");
        db.CloseDB();



        last = count + 5;
        db.updatetData("loadCount","count",last);
        db.CloseDB();

	}
	
	

    void OnGUI()
    {
        // create the gui text of the description
        GUI.Box(new Rect(5, 5, Screen.width - 10, Screen.height / 3), count.ToString());
        if (GUI.skin.customStyles.Length > 0)
            GUI.skin.customStyles[0].wordWrap = true;
    }

}
