using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class MapDisplay : MonoBehaviour
{
    //moved previous scripting into texture generator
    public Renderer textureRender;
    public MeshFilter meshFilter;
    public MeshRenderer meshRenderer;

    public void DrawTexture(Texture2D texture)
    {
        textureRender.sharedMaterial.mainTexture = texture;
        textureRender.transform.localScale = new Vector3(texture.width, 1, texture.height);
    }

    public void DrawMesh(MeshData meshData, Texture2D texture)
    {
        meshFilter.sharedMesh = meshData.CreateMesh();
        meshRenderer.sharedMaterial.mainTexture = texture;
    }

}

/* //old script
public class MapDisplay : MonoBehaviour
{
    public Renderer textureRender;

    public void DrawNoiseMap(float[,] noiseMap) //2D array for the noise map
    {
        int width = noiseMap.GetLength(0);
        int height = noiseMap.GetLength(1);

        //creating the texture for the map
        Texture2D texture = new Texture2D(width, height);

        //set the color of each pixel in the texture
        Color[] colourMap = new Color[width * height];

        //loop through the value of the maps
        for (int y = 0; y < height; y++)
        {
            for (int x = 0; x < width; x++)
            {
                colourMap[y * width + x] = Color.Lerp(Color.black, Color.white, noiseMap[x, y]); //1D array setting the color between black and white
            }
        }
        texture.SetPixels(colourMap); //apply the colors to the texture
        texture.Apply();

        //set the plane size to the size of the map
        textureRender.sharedMaterial.mainTexture = texture; 
        textureRender.transform.localScale = new Vector3(width, 1, height);
    }
}*/
