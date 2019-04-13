using UnityEngine;
using System.Collections;

public class obstacle : MonoBehaviour
{

    public enum obstacleEnum : int { Arrow, Ball, Fanoos, ChainLamp };
    public obstacleEnum choose;
    public int distance;
    public int regainDist;
    GameObject targetPlayer;
    private Vector3 positionRegain;
    
    // Use this for initialization
    void Start()
    {
        targetPlayer = GameObject.Find("_3rd Person Controller");
        positionRegain = gameObject.transform.position;
    }

    // Update is called once per frame
    void Update()
    {
        if (choose == obstacleEnum.ChainLamp)
        {
            if (Vector3.Distance(transform.position, targetPlayer.transform.position) < distance)
            {
                gameObject.GetComponent<Rigidbody>().useGravity = true;
              
            }
        }

    }
}
