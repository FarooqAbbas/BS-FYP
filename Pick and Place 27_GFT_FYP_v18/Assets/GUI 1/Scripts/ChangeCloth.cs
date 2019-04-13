using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;

public class ChangeCloth : MonoBehaviour {

    public int id = 0;
   public List<Texture> clothTexture = new List<Texture>();
    public static int currentclothIndex=0;
    public GameObject characterBody;
    dbAccess db;

    void Awake()
    {
        db = GetComponent<dbAccess>();
        
    }
 

    void OnClick()
    {
        if (id == 1)
        {
            if (currentclothIndex >= 0 && currentclothIndex < 4)
            {                              
                characterBody.GetComponent<SkinnedMeshRenderer>().materials[1].mainTexture = clothTexture[currentclothIndex];
                string str = clothTexture[currentclothIndex].name.ToString();
                print(str);
                currentclothIndex = currentclothIndex + 1;
                if (currentclothIndex > 3)
                    currentclothIndex = 3;

         //       db.OpenDB("game.db");                
         //       db.updateCloth("cloth", "name", str);
        //        db.CloseDB();
                //////////////
                fileWriting(str);

                
            }
            


        }
        else if (id == 2)
        {
            if (currentclothIndex >= 0 && currentclothIndex < 4)
            {

                
                //if (currentclothIndex <= 1)
                {
                   // currentclothIndex = 1;
                }

                characterBody.GetComponent<SkinnedMeshRenderer>().materials[1].mainTexture = clothTexture[currentclothIndex];
                currentclothIndex = currentclothIndex - 1;
                if (currentclothIndex < 0)
                    currentclothIndex = 0;
                string str = clothTexture[currentclothIndex].name.ToString();
         //       db.OpenDB("game.db");
         //       db.updateCloth("cloth", "name", str);
         //       db.CloseDB();
                fileWriting(str);
            }
        }
    }

    void fileWriting(string name)
    {
        string path = Application.persistentDataPath + "/clothName.txt";

            // Create a file to write to. 
            using (StreamWriter sw = File.CreateText(path))
            {
                sw.WriteLine(name);
            }
        

    }
}
