#pragma strict
//import UISlider;

var prog:float;
//var lifeSlider:UISlider;
public var lifeSliderObj:GameObject;

function Start () {

    
   // lifeSlider = slider.GetComponent(UISlider);
    
    
    
   // lifeSlider.value = prog;

    DontDestroyOnLoad(this);
    print ("Loading...");
    yield LoadLevelWithProgress ("Level_03_Dragon");
    print ("Loading complete");
}
 
function LoadLevelWithProgress (levelToLoad : String) {
    var async = Application.LoadLevelAsync(levelToLoad);
    while (!async.isDone) {
        prog=async.progress;

        print ("%: " + prog);
        yield;
    }
}
    function Update()
    {
        //lifeSlider.value = prog;
    }