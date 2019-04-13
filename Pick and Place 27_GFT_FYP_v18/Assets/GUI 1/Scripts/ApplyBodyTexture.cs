using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
public class ApplyBodyTexture : MonoBehaviour
{
    public List<Texture> mat = new List<Texture>();
    dbAccess db;
    string clothGot=null;
    int clothIndex = 0;
    void Awake()
    {
 //       db = GetComponent<dbAccess>();
  //      db.OpenDB("game.db");
  //      clothGot = db.getCloth("cloth", "id", "name");
   //     db.CloseDB();

        clothGot = ClothNameInFile();
   
    }
    // Use this for initialization
    void Start()
    {
        for (int i = 0; i < mat.Count; i++)
        {
            if (mat[i].name == clothGot)
            {
                clothIndex = i;
            }
        }
        gameObject.GetComponent<SkinnedMeshRenderer>().materials[1].mainTexture = mat[clothIndex];

    }
 
    string ClothNameInFile()
    {
        string path = Application.persistentDataPath + "/clothName.txt";
        string str = null;
        // Open the file to read from. 
        using (StreamReader sr = File.OpenText(path))
        {
            string s = "";
            while ((s = sr.ReadLine()) != null)
            {
                str = s;

            }
        }
        return str;
    }
}
