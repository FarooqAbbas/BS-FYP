using UnityEngine;
using System.Collections;

public class LoadingLevelIndicationSharp : MonoBehaviour {

    float prog;
    UISlider  lifeSlider;
    public GameObject slider;

	// Use this for initialization
	void Start () {
	
        //lifeSlider = slider.GetComponent(UISlider);
    
        
    
    //lifeSlider.value = prog;

    DontDestroyOnLoad(this);
    print ("Loading...");
    //yield LoadLevelWithProgress ("Level_03_Dragon");
    print ("Loading complete");
	}
	
    void LoadLevelWithProgress (string levelToLoad) {
    var async = Application.LoadLevelAsync(levelToLoad);
    while (!async.isDone) {
        prog=async.progress;
        print ("%: " + async.progress);
      //  yield;
    }
}

}
