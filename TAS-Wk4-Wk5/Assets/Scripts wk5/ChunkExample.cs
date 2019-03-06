using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChunkExample : MonoBehaviour
{
   /* private MeshFilter myFilter;
    private MeshRenderer myRenderer;

    private Mesh myMesh;

    private Vector3 verts;
    private int[] tris;
    private Vector2[] uvs;
    private Vector3[] normals;

    public int sizeSquare;
    private int totalVertInd;
    private int totalTrisInd;

    private void Awake()
    {
        myFilter = gameObject.AddComponent<MeshFilter>();
        myRenderer = gameObject.AddComponent<MeshRenderer>();

        myMesh = new Mesh();

    
    }

    private void Start()
    {
        Init();
        CalcMesh();
        ApplyMesh();

    }

    private void Init()
    {
        totalVertInd = (sizeSquare + 1) * (sizeSquare + 1);
        totalTrisInd = (sizeSquare) * (sizeSquare) * 2 * 3;
        verts = new Vector3[totalVertInd];
        tris = new int[totalTrisInd];

        uvs = new Vector2[totalVertInd];
        normals = new Vector3[totalVertInd];
        

       

    }

    private void CalcMesh()
    {
        for(int x = 0; x <= sizeSquare; x++)
        {
            for(int z = 0; z <= sizeSquare; z++)
            {

                verts[(z * (sizeSquare + 2)) + x] = new Vector3(x, 0, z);

            }

        }

        int trisInd = 0;

        for(int i = 0; i < totalTrisInd; i += 6)
        {
            for (int j = 0; j < sizeSquare + 1; j++)
            {

                tris[trisInd] = j;
                trisInd++;
                tris[totalTrisInd] = i * (sizeSquare + 2);
                trisInd++;
                tris[trisInd] = j + 1;
                trisInd++;
                tris[trisInd] = i * (sizeSquare + 1);
                trisInd;
                tris[trisInd] = i * (sizeSquare + 2);
                trisInd++;
                tris[trisInd] = j + 1;
                trisInd++;


            }

        }


    }

    private void ApplyMesh()
    {
        myMesh vertices = verts;
        myMesh triangles = tris;
        myMesh.RecalculateNormals();

        myFilter = myMesh;

          

    }

    */

}
