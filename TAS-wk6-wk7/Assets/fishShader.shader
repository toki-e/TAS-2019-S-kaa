// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "fishShader"
{
	Properties
	{
		_frequency("frequency", Float) = 1
		_amplitude("amplitude", Float) = 1
		_timeoffset("time offset", Float) = 1
		_amplitudeoffset("amplitude offset", Float) = 1
		_positionaloffsetscaler("positional offset scaler", Float) = 1
		_offsetscaler2("offset scaler 2", Float) = 1
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			half filler;
		};

		uniform float _amplitude;
		uniform float _frequency;
		uniform float _timeoffset;
		uniform float _positionaloffsetscaler;
		uniform float _offsetscaler2;
		uniform float _amplitudeoffset;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			float4 appendResult13 = (float4(( ( _amplitude * sin( ( ( _frequency * _Time.y ) + _timeoffset + ( ase_vertex3Pos.y * _positionaloffsetscaler ) ) ) * ( ase_vertex3Pos.y * _offsetscaler2 ) ) + _amplitudeoffset ) , 0.0 , 0.0 , 0.0));
			v.vertex.xyz += appendResult13.xyz;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
252;12.8;1077;732;1743.28;-54.24037;1.713091;True;True
Node;AmplifyShaderEditor.CommentaryNode;19;-1596.708,-15.17831;Float;False;831.0315;870.2169;adding scale and offset time value to the vertex Y pos;4;6;12;17;18;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;18;-1528.649,53.06888;Float;False;386.8916;372.9882;Scales and offsets time input;4;7;10;9;2;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;17;-1534.247,478.1508;Float;False;480.2334;320.3405;Scales vertex Y pos;3;16;14;15;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleTimeNode;2;-1495.849,222.9084;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-1469.389,127.3684;Float;False;Property;_frequency;frequency;1;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-1502.789,700.2525;Float;False;Property;_positionaloffsetscaler;positional offset scaler;5;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;14;-1503.01,538.0552;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;24;-991.2328,867.9586;Float;False;473.4539;190.7939;uses distance from origin as scaler multiplied to amplitude;2;22;23;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1360.552,342.4702;Float;False;Property;_timeoffset;time offset;3;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-1282.792,203.2894;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-1252.389,565.771;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;12;-1063.061,248.1375;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;20;-734.974,4.493923;Float;False;444.7912;443.6957;scaling and offsetting sin output;4;11;8;5;4;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;23;-928.9331,945.137;Float;False;Property;_offsetscaler2;offset scaler 2;6;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;6;-917.029,242.2878;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-702.485,91.60471;Float;False;Property;_amplitude;amplitude;2;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;22;-709.29,928.4401;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-551.0472,169.4083;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-638.2266,308.4224;Float;False;Property;_amplitudeoffset;amplitude offset;4;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;8;-425.0413,254.955;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;21;-230.0146,150.3306;Float;False;279.3615;256.8531;applying the result to the x axis;1;13;;1,1,1,1;0;0
Node;AmplifyShaderEditor.Vector3Node;1;-422.3425,673.9133;Float;False;Property;_VertexOffset;Vertex Offset;0;0;Create;True;0;0;False;0;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DynamicAppendNode;13;-152.328,226.0294;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;96.71042,-21.51826;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;fishShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;10;0;9;0
WireConnection;10;1;2;0
WireConnection;15;0;14;2
WireConnection;15;1;16;0
WireConnection;12;0;10;0
WireConnection;12;1;7;0
WireConnection;12;2;15;0
WireConnection;6;0;12;0
WireConnection;22;0;14;2
WireConnection;22;1;23;0
WireConnection;5;0;4;0
WireConnection;5;1;6;0
WireConnection;5;2;22;0
WireConnection;8;0;5;0
WireConnection;8;1;11;0
WireConnection;13;0;8;0
WireConnection;0;11;13;0
ASEEND*/
//CHKSM=CD3670BC99150C4753899FB5C2CD114E4D096F46