using UnityEngine;
using System.Collections;

public class ParticleParentWork : MonoBehaviour {

    private float DistanceFromCamera = 15.0f;

    public Camera CustomCamera;

    void Update()
    {

        if (Vector3.Distance(Camera.main.transform.position, this.transform.position) >= DistanceFromCamera)
        {
            Transform[] allChildrens = gameObject.GetComponentsInChildren<Transform>();
            for (int i = 0; i < allChildrens.Length; i++)
            {
                allChildrens[i].gameObject.GetComponent<ParticleSystem>().enableEmission = false;
            }

        }
        else
        {
            Transform[] allChildrens = gameObject.GetComponentsInChildren<Transform>();
            for (int i = 0; i < allChildrens.Length; i++)
            {
                allChildrens[i].gameObject.GetComponent<ParticleSystem>().enableEmission = true;
            }
        }
    }
}
