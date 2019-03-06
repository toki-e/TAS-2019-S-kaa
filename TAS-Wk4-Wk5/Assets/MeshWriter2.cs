﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(MeshRenderer))]
[RequireComponent(typeof(MeshFilter))]

public class MeshWriter2 : MonoBehaviour
{
    #region Internal References
    private MeshRenderer _myMR;
    private MeshFilter _myMF;
    #endregion

    #region Data
    private Mesh _myMesh;
    public Vector3[] _verts;
    private int[] _tris;
    private Vector3[] _normals;
    private Vector2[] _uVs;
    #endregion



    void Awake()
    {
        _myMR = GetComponent<MeshRenderer>();
        _myMF = GetComponent<MeshFilter>();
    }

    private void Start()
    {
        _ComputeMesh();
        _ApplyMesh();
    }

    private void _ComputeMesh()
    {
        _myMesh = new Mesh();

        _verts = new Vector3[6];
        _verts[0] = Vector3.zero;
        _verts[1] = Vector3.right /** (Mathf.Sin(Time.time) + 1)*/;
        _verts[2] = Vector3.up /** (Mathf.Cos(Time.time) + 1)*/;
        _verts[3] = Vector3.up;
        _verts[4] = Vector3.up + Vector3.right;
        _verts[5] = Vector3.up + Vector3.right + Vector3.right;
    

        _tris = new int[6];
        _tris[0] = 0;
        _tris[1] = 2;
        _tris[2] = 1;
        _tris[3] = 3;
        _tris[4] = 4;
        _tris[5] = 5;
       

        _normals = new Vector3[6];
        _normals[0] = -Vector3.right;
        _normals[1] = -Vector3.right;
        _normals[2] = -Vector3.right;
        _normals[3] = Vector3.right;
        _normals[4] = Vector3.right;
        _normals[5] = Vector3.right;
    

        _uVs = new Vector2[6];
        _uVs[0] = new Vector2(0, 0);
        _uVs[1] = new Vector2(1, 0);
        _uVs[2] = new Vector2(0, 1);
        _uVs[3] = new Vector2(0, 1);
        _uVs[4] = new Vector2(1, 1);
        _uVs[5] = new Vector2(1, 0);
     
    }

    private void _RandomUVs()
    {
        for (int i = 0; i < _normals.Length; i++)
        {
            _normals[i] = Vector3.Normalize(Random.insideUnitSphere);
        }
    }

    private void _ApplyMesh()
    {
        _myMesh.vertices = _verts;
        _myMesh.triangles = _tris;
        //_myMesh.normals = _normals;
        _myMesh.uv = _uVs;

        _myMesh.RecalculateNormals();

        _myMF.mesh = _myMesh;
    }

    //private void Update()
    //{
    //    _verts[0] = Vector3.zero;
    //    _verts[1] = Vector3.right * (Mathf.Sin(Time.time) + 3);
    //    _verts[2] = Vector3.up * (Mathf.Cos(Time.time) + 3);

    //    _RandomUVs();

    //    _ApplyMesh();
    //}
}