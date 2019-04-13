using UnityEngine;
using System.Collections;

public class ChildActivation : MonoBehaviour {

    public GameObject child;
    public GameObject secondObject;
    
    public bool setActive = false;
    public bool animator = false;
    public bool textureColor = false;
    public GameObject thirdObject;
    public bool thirdObjectAnimation = false;
	// Use this for initialization
	void Start () {
        thirdObject.animation.Stop("Take 001");
	}
	 
    void ActivateChild(bool val)
    {
        print("message recieved");
 /*       Transform[] allChildren = GetComponentsInChildren<Transform>();
        for (int i = 0; i < allChildren.Length;i++ )
        {
            print(allChildren[i].name);
            GameObject temp = allChildren[i].gameObject;
            temp.SetActive(val);
        }
        */

        child.SetActive(val);
        if(setActive)
            secondObject.SetActive(val);
        else if (animator)
        {
            secondObject.GetComponent<Animator>().enabled = true;
        }
        else if (textureColor)
        {
            Transform[] allChildren = secondObject.GetComponentsInChildren<Transform>();
            foreach (Transform chil in allChildren)
            {
  //child is your child transform

                print(chil.name);
                chil.renderer.material.color = Color.white;
            }
            
        }
        if (thirdObjectAnimation)
        {
            thirdObject.animation.Play("Take 001");
        }
    }
}
