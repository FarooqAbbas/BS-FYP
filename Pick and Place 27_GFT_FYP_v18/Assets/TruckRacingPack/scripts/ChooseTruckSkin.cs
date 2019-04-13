using UnityEngine;
using System.Collections;

public class ChooseTruckSkin : MonoBehaviour 
{
	public GameObject TruckMesh;
	
	public Material tMat1;
	public Material tMat2;
	public Material tMat3;
	public Material tMat4;
	public Material tMat5;
	public Material tMat6;
	public Material tMat7;
	public Material tMat8;
	public Material tMat9;	
	public Material tMat10;
	

	// Use this for initialization
	void Start () 
	{
	
	}
	
	// Update is called once per frame
	void Update () 
	{
		TruckMesh.renderer.material = tMat8;
	}
}
