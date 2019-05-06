using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimatorControllerParameter : MonoBehaviour
{

    private float walk_blend_x;
    private float walk_blend_y;

    private float time;

    private Animator myAnim;

    [Header("Tuning values")]
    [Range(0.0f, 10.0f)] public float walkCycleTime;
    [Range(0.0f, 10.0f)] public float stepsPerSecondTime;

    [Range(0.001f, 1.00f)] public float walkRunMagnitude;

    // Start is called before the first frame update
    void Start()
    {
        myAnim = GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKey(KeyCode.W))
        {
            
        }

        walkCycleTime = 1 - walkRunBlendTotal;
        walkRunMagnitude = .25f + (.75f * walkRunBlendTotal);

        time += (Mathf.PI * 2 * Time.deltaTime / walkCycleTime;  

        walk_blend_x = Mathf.Cos(time);
        walk_blend_y = Mathf.Sin(time);

        myAnim.SetFloat("WalkTreeValx", WalkTreeValx);
        myAnim.SetFloat("WalkTreeValy", WalkTreeValy);

    }
}
