using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;

public class AddChild_4 : MonoBehaviour
{


    /// <summary>
    /// this script is applied on UI---->Control - Background_stips---->Finalizer--->_SV_Finalize--->Grid_FS
    /// very very immportant script to arrange items in Grid for finilizing scene.
    /// </summary>

    public GameObject RootGrid;
    public GameObject ItemPref;
    //public float timePassed;


    Inventory_Level_01 inven;
    /***********************************/
    GameObject dataHandler;
    /**************Local Dictionary*************/
   public Dictionary<int, sequence> seq;
   public int n = 4;
    /***********************************/
    GameObject Obj,obj2;
    int i;
    // Use this for initialization
    void Start()
    {
        //timePassed = Time.deltaTime;
        dataHandler = GameObject.Find("DataHandler");
        Inventory_Level_01 ino = dataHandler.GetComponent<Inventory_Level_01>();
        seq = ino.dic;
        n = seq.Count;  // you can have 'n' children
        // Optional part can be removed after orignal logic

        foreach (var x in seq)
        {
            
            String s = x.Value.Name;

            print("x.Key==" + x.Key + "  Name==" + x.Value.Name + "  Value==" + x.Value.Random);
            GameObject item = NGUITools.AddChild(RootGrid, ItemPref);
            //item.name = "item" + i;
            arrangeItems(item.transform, x.Value.Random, s);
            letsUpdate();
        }

    }




    void letsUpdate()
    {

        RootGrid.GetComponent<UIGrid>().Reposition();
        RootGrid.transform.parent.GetComponent<UIScrollView>().ResetPosition();
    }

    void arrangeItems(Transform a, int x, string s)
    {
        // Naming parent
        char alphaP = (char)(64 + x);
        string alphaStrP = alphaP.ToString();
        Obj = a.gameObject;
        Obj.name = alphaStrP + x;

        //Naming Child of parent in the same way as parent convention
        foreach (Transform b in a)
        {
            char alphaC = (char)(64 + x);
            string alphaStrC = alphaC.ToString();
            Obj = b.gameObject;
            Obj.name = alphaStrC + x;
            // here we apply our required sprite dynamically
            
            if (s == "dumble")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "dumble";
            }
            else if (s == "pistol")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "pistol";
            }
            else if (s == "cheque")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "cheque";
            }
            else if (s == "idcard")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "idcard";
            }
            else if (s == "book")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "book";
            }
            else if (s == "apple")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "apple";
            }

            else if (s == "pear")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "pear";
            }

            else if (s == "sword")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "sowrd";
            }

            else if (s == "letter")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "letter";
            }


            foreach (Transform c in b)
            {
                obj2=c.gameObject;
                UISprite okSprite=obj2.GetComponent<UISprite>();
                okSprite.spriteName = "";
            }

        }
        //UISprite yourSprite =Obj.GetComponent<UISprite>();
        //yourSprite.spriteName = "NGUI";       
         
    }
 
}
