using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(MeshRenderer))]
[RequireComponent(typeof(MeshFilter))]

public class SquareDuplicate : MonoBehaviour
{

    Mesh mesh;
    List<Vector3> vertices;
    List<int> triangles;
    MeshRenderer meshRenderer;

    public Material material;
    public float radius = 5.0f;
    public int segments = 8;

    Vector3 pos;
    float angle = 0.0f;
    float angleAmount = 0.0f;

   void Start()
    {
        gameObject.AddComponent<MeshFilter>();
        meshRenderer = gameObject.AddComponent<MeshRenderer>();
        //meshRenderer.material = material;

        mesh = new Mesh();
        GetComponent<MeshFilter>().mesh = mesh;

        vertices = new List<Vector3>();
        pos = new Vector3();

        angleAmount = 2 * Mathf.PI / segments;
        angle = 0.0f;

        //center of disc
        pos.x = 0.0f;
        pos.y = 0.0f;
        pos.z = 0.0f;

        vertices.Add(new Vector3(pos.x, pos.y, pos.z));


        for (int i = 0; i < segments; i++)
        {

            pos.x = radius * Mathf.Sin(angle);
            pos.y = radius * Mathf.Cos(angle);

            vertices.Add(new Vector3(pos.x, pos.y, pos.z));

            angle -= angleAmount;

        }

        mesh.vertices = vertices.ToArray();

        triangles = new List<int>();

        for(int i = 1; i < segments; i++)
        {
            triangles.Add(0);
            triangles.Add(i + 1);
            triangles.Add(i);

        }
        //close the shape
        triangles.Add(0);
        triangles.Add(1);
        triangles.Add(segments);

        mesh.triangles = triangles.ToArray();

    }


}