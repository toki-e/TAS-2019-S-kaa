using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FlockManager : MonoBehaviour
{

    public GameObject myAutoAgentPrefab;

    [Range(1, 500)] public int numberOfSpawns;

    List<GameObject> allMyAgents = new List<GameObject>();

    // Start is called before the first frame update
    void Start()
    {

        float rCubed = 3 * numberOfSpawns / (4 * Mathf.PI * .01f);
        float r = Mathf.Pow(rCubed, .33f);


        for (int i = 0; i< numberOfSpawns; i++)
        {

            allMyAgents.Add(Instantiate(myAutoAgentPrefab, Random.insideUnitSphere, Quaternion.identity, transform)); 

        }
    }

    Collider[] collInRad = new Collider[1];

    // Update is called once per frame
    void Update()
    {
        foreach(GameObject g in allMyAgents)
        {
            AutoAgentBehavior a = g.GetComponent<AutoAgentBehavior>();
            Collider[] output;
            Physics.OverlapSphereNonAlloc(g.transform.position, 5, out output);

            a.PassArrayOfContext(collInRad);

            
        }
    }
}
