using UnityEngine;
using System.Collections;

public class ProgressBarParent : MonoBehaviour {

    UISlider lifeSlider;
    public GameObject lifeSliderObj;
   
    float prog;
	// Use this for initialization
	void Start () {
        lifeSlider = lifeSliderObj.GetComponent<UISlider>();
        print("i got" + lifeSlider.value);
        //lifeSlider.value = getProg.GetComponent<LoadingLevelIndication>().prog;
	}
	
/*	// Update is called once per frame
	void Update () {
        lifeSlider = lifeSliderObj.GetComponent<UISlider>();
       // lifeSlider.value = lifeSliderObj.GetComponent<LoadingLevelIndication>().prog;
        
        
	}*/
}
