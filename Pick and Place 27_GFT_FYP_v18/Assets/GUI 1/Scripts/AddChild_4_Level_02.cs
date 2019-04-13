using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;

public class AddChild_4_Level_02 : MonoBehaviour
{


    /// <summary>
    /// this script is applied on UI---->Control - Background_stips---->Finalizer--->_SV_Finalize--->Grid_FS
    /// very very immportant script to arrange items in Grid for finilizing scene.
    /// </summary>

    public GameObject RootGrid;
    public GameObject ItemPref;
    

    inventory inven;
    /***********************************/
    GameObject dataHandler;
    /**************Local Dictionary*************/
    Dictionary<int, sequence> seq;
    public int n = 4;
    /***********************************/
    GameObject Obj,obj2;
    int i;
    // Use this for initialization
    void Start()
    {
        dataHandler = GameObject.Find("DataHandler");
        inventory ino = dataHandler.GetComponent<inventory>();
        seq = ino.dic;
        n = seq.Count;  // you can have 'n' children
        // Optional part can be removed after orignal logic

        foreach (var x in seq)
        {
            print("add child");
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

            if (s == "key(Clone)")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "5";
            }
            else if (s == "Platform_Plate_dock1_moving(Clone)")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "3";
            }
            else if (s == "kanne(Clone)")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "4";
            }
            else if (s == "ButterFlyValve(Clone)")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "1";
            }
            else if (s == "PlatesInfected_v1(Clone)")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "6";
            }
            else if (s == "PlatesInfected_Group(Clone)")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "7";
            }

            else if (s == "gear(Clone)")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "2";
            }
            else if (s == "Cylinder(Clone)")
            {
                UISprite yourSprite = Obj.GetComponent<UISprite>();
                yourSprite.spriteName = "8";
            }

            foreach (Transform c in b)
            {
                obj2 = c.gameObject;
                UISprite okSprite = obj2.GetComponent<UISprite>();
                okSprite.spriteName = "";
            }

            
        }
        //UISprite yourSprite =Obj.GetComponent<UISprite>();
        //yourSprite.spriteName = "NGUI";                 

    }
 
}

