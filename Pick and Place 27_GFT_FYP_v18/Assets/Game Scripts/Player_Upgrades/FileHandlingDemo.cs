using UnityEngine;
using System.Collections;
using System.IO;

public class FileHandlingDemo : MonoBehaviour {

    public GUIText filePath;
    public GUIText tLives;

 
	// Use this for initialization
	void Start () {

        fun2();
	
	}
	 

     void fun2()
     {
         string path = Application.persistentDataPath + "/save.txt";
         if (!File.Exists(path))
         {
             // Create a file to write to. 
             using (StreamWriter sw = File.CreateText(path))
             {
                 sw.WriteLine("Hello");
                 sw.WriteLine("And");
                 sw.WriteLine("Welcome");
             }
         }

         // Open the file to read from. 
         using (StreamReader sr = File.OpenText(path))
         {
             string s = "";
             while ((s = sr.ReadLine()) != null)
             {
                 //Console.WriteLine(s);
                 filePath.text = s;

             }
         }
     }
}
