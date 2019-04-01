// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "birdShader"
{
	Properties
	{
		_frequency("frequency", Float) = 1
		_amplitude("amplitude", Float) = 1
		_timeoffset("time offset", Float) = 1
		_positionaloffsetscaler("positional offset scaler", Float) = 1
		_offsetscaler("offset scaler", Float) = 1
		_amplitudeoffset("amplitude offset", Float) = 1
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
		uniform float _offsetscaler;
		uniform float _amplitudeoffset;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			float temp_output_18_0 = abs( ase_vertex3Pos.x );
			float4 appendResult1 = (float4(0.0 , ( ( _amplitude * sin( ( ( _frequency * _Time.y ) + _timeoffset + ( temp_output_18_0 * _positionaloffsetscaler ) ) ) * ( temp_output_18_0 * _offsetscaler ) ) + _amplitudeoffset ) , 0.0 , 0.0));
			v.vertex.xyz += appendResult1.xyz;
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
261.6;23.2;1049;694;1235.414;277.4474;1.677678;True;False
Node;AmplifyShaderEditor.PosVertexDataNode;9;-282.6243,293.802;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.AbsOpNode;18;-77.81577,269.4762;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-429.8955,453.1817;Float;False;Property;_positionaloffsetscaler;positional offset scaler;3;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-210.12,-110.5185;Float;False;Property;_frequency;frequency;0;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;11;-269.0707,57.24925;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-59.36102,38.79473;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;73.40772,318.9674;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-126.2362,167.9763;Float;False;Property;_timeoffset;time offset;2;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;202.5888,575.6515;Float;False;Property;_offsetscaler;offset scaler;4;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;13;113.4399,45.50556;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;388.579,500.1564;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;382.1003,-14.89086;Float;False;Property;_amplitude;amplitude;1;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;14;306.3731,109.2574;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;390.4886,270.3143;Float;False;Property;_amplitudeoffset;amplitude offset;5;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;521.1154,131.0671;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;16;682.1722,154.5547;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1;806.5525,318.9672;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;20;-156.6665,594.9455;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;19;-341.2106,657.0192;Float;False;Property;_xFloat;xFloat;6;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;998.218,46.97498;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;birdShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;18;0;9;1
WireConnection;12;0;5;0
WireConnection;12;1;11;0
WireConnection;10;0;18;0
WireConnection;10;1;7;0
WireConnection;13;0;12;0
WireConnection;13;1;6;0
WireConnection;13;2;10;0
WireConnection;17;0;18;0
WireConnection;17;1;4;0
WireConnection;14;0;13;0
WireConnection;15;0;2;0
WireConnection;15;1;14;0
WireConnection;15;2;17;0
WireConnection;16;0;15;0
WireConnection;16;1;3;0
WireConnection;1;1;16;0
WireConnection;20;0;19;0
WireConnection;20;1;9;1
WireConnection;0;11;1;0
ASEEND*/
//CHKSM=724E7920A76BAC3D20616A5531C76A22B80A5D4C