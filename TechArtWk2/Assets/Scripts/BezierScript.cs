using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BezierScript : MonoBehaviour {

    public LineRenderer lineRenderer;
    public Transform point0, point1;

    private int numberOfPoints = 50;

    private Vector3[] positions = new Vector3[50];

	// Use this for initialization
	void Start () {
        //lineRenderer.SetVertexCount(numberOfPoints);
        lineRenderer.positionCount = numberOfPoints;
        DrawLinearCurve();
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    private void DrawLinearCurve()
    {
        for (int i = 1; i < numberOfPoints + 1; i++)
        {
            float t = i / numberOfPoints;
            positions[i - 1] = calcLinearBezierPt(t, point0.position, point1.position);
        }
        lineRenderer.SetPositions(positions);
    }

    private Vector3 calcLinearBezierPt(float t, Vector3 p0, Vector3 p1)
    {
        return p0 + t * (p1 - p0);

    }

}
