using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RaycastScript : MonoBehaviour
{
    public Camera camera;

    public Material otherMaterial;

    public ArrayList objsOfInt;
    public ThirdPersonCameraController thirdPovScriipt;

    Vector3 mousePosition;
    public float angle;
    public HingeJoint hj;

    public bool objectIsHit;
    public float zoomOutSpeed;

    public Vector3 targetPos;
    public Transform target;

    // Start is called before the first frame update
    void Start()
    {
        //camera = GetComponent<Camera>();

        objectIsHit = false;
        targetPos = new Vector3(0, 0, -3);
    }

    // Update is called once per frame
    void Update()
    {
        RaycastHit hit;
        Ray ray = camera.ScreenPointToRay(Input.mousePosition);

        if (Physics.Raycast(ray, out hit))
        {
            if (hit.collider.gameObject.tag == "ObjectOfInterest")
            {
                Debug.Log("objHit!");

                hit.collider.gameObject.GetComponent<MeshRenderer>().material = otherMaterial;
              
                //transform.Translate(new Vector3(0, 20, 0));
            }
        }

        mousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);      

        //Zooming Out
        if (Input.GetAxis("Mouse ScrollWheel") < 0)
        {
            if (Camera.main.fieldOfView <= 125)
                Camera.main.fieldOfView += 2;
            if (Camera.main.orthographicSize <= 20)
                Camera.main.orthographicSize += 0.5f;

        }
        //Zooming In
        if (Input.GetAxis("Mouse ScrollWheel") > 0)
        {
            if (Camera.main.fieldOfView > 2)
                Camera.main.fieldOfView -= 2;
            if (Camera.main.orthographicSize >= 11)
                Camera.main.orthographicSize -= 0.5f;
        }

    }

    void avoidObj(Vector3 center, float radius)
    {
        Collider[] hitColliders = Physics.OverlapSphere(center, radius);
        int i = 0;
        while (i < hitColliders.Length)
        {
            hitColliders[i].SendMessage("sensingObj");
            i++;
            //transform.position = Mathf.MoveTowards(targetPos, 1, Time.deltaTime * 3);

        }
    }
}
