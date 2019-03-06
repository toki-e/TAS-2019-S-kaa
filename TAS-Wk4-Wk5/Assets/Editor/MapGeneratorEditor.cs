using UnityEngine;
using System.Collections;
using UnityEditor;

[CustomEditor(typeof(MapGenerator))] //tell unity it's a custom editor 
public class MapGeneratorEditor : Editor
{

    public override void OnInspectorGUI()
    {
        MapGenerator mapGen = (MapGenerator)target; //cast obj to mapgenerator


        if (DrawDefaultInspector())
        {
            
            if (mapGen.autoUpdate)
            {
                mapGen.GenerateMap();
            }
        }

        //add in a button
        if (GUILayout.Button("Generate")) //if button is pressed
        {
            mapGen.GenerateMap();
        }
    }
}