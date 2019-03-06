﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(MeshRenderer))]
[RequireComponent(typeof(MeshFilter))]

public class Mesh3 : MonoBehaviour
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

        _verts = new Vector3[3];
        _verts[0] = Vector3.zero;
        _verts[1] = Vector3.right * (Mathf.Sin(Time.time) + 1);
        _verts[2] = Vector3.up * (Mathf.Cos(Time.time) + 1);

        _tris = new int[3];
        _tris[0] = 0;
        _tris[1] = 2;
        _tris[2] = 1;

        _normals = new Vector3[3];
        _normals[0] = Vector3.forward;
        _normals[1] = Vector3.forward;
        _normals[2] = Vector3.forward;

        _uVs = new Vector2[3];
        _uVs[0] = new Vector2(0, 0);
        _uVs[1] = new Vector2(1, 0);
        _uVs[2] = new Vector2(0, 1);
    }

    private void _RandomUVs()
    {
        for (int i = 0; i < _normals.Length; i++)
        {
            _normals[i] = Random.insideUnitSphere;
        }
    }

    private void _ApplyMesh()
    {
        _myMesh.vertices = _verts;
        _myMesh.triangles = _tris;
        _myMesh.normals = _normals;
        _myMesh.uv = _uVs;

        _myMF.mesh = _myMesh;
    }

    private void Update()
    {
        _verts[0] = Vector3.zero;
        _verts[1] = Vector3.right * (Mathf.Sin(Time.time) + 3);
        _verts[2] = Vector3.up * (Mathf.Cos(Time.time) + 3);

        //_RandomUVs();

        _ApplyMesh();
    }
}