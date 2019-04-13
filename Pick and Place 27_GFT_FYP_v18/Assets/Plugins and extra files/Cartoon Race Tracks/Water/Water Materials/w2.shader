Shader "water_2"
{
	Properties 
	{
_Color("_Color", Color) = (1,1,1,1)
_Texture1("_Texture1", 2D) = "black" {}
_BumpMap1("_BumpMap1", 2D) = "black" {}
_Texture2("_Texture2", 2D) = "black" {}
_BumpMap2("_BumpMap2", 2D) = "black" {}
_MainTexSpeed("_MainTexSpeed", Float) = 0
_Bump1Speed("_Bump1Speed", Float) = 0
_Texture2Speed("_Texture2Speed", Float) = 0
_Bump2Speed("_Bump2Speed", Float) = 0
_DistortionMap("_DistortionMap", 2D) = "black" {}
_DistortionSpeed("_DistortionSpeed", Float) = 0
_DistortionPower("_DistortionPower", Range(0,0.02) ) = 0
_Specular("_Specular", Range(0,7) ) = 1
_Gloss("_Gloss", Range(0.3,2) ) = 0.3
_Opacity("_Opacity", Range(-0.2,0.9) ) = 0
_Reflection("_Reflection", 2D) = "black" {}
_ReflectPower("_ReflectPower", Range(0,1) ) = 0

	}
	
	SubShader 
	{
		Tags
		{
		"Queue"="Transparent-200"
		"IgnoreProjector"="False"
		"RenderType"="Overlay"

		}

		
		Cull Back
		ZWrite On
		ZTest LEqual
		ColorMask RGBA
		Blend SrcAlpha OneMinusSrcAlpha
		Fog{
		}
		
		
					
	Pass {
		Name "FORWARD"
		Tags { "LightMode" = "ForwardBase" }
Program "vp" {
// Vertex combos: 6
//   opengl - ALU: 23 to 83
//   d3d9 - ALU: 24 to 86
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [_DistortionMap_ST]
Vector 24 [_Texture1_ST]
Vector 25 [_Texture2_ST]
Vector 26 [_BumpMap1_ST]
Vector 27 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 47 ALU
PARAM c[28] = { { 1 },
		state.matrix.mvp,
		program.local[5..27] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[13].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[18];
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[16];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[21];
DP4 R3.y, R1, c[20];
DP4 R3.x, R1, c[19];
ADD R2.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R3.xyz, R0.x, c[22];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[5].xyz, R2, R3;
MOV R0.xyz, c[14];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[13].w, -vertex.position;
MUL R2.xyz, R1, vertex.attrib[14].w;
MOV R1, c[15];
DP4 R3.z, R1, c[11];
DP4 R3.x, R1, c[9];
DP4 R3.y, R1, c[10];
DP3 result.texcoord[3].y, R0, R2;
DP3 result.texcoord[4].y, R2, R3;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[24].xyxy, c[24];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[26].xyxy, c[26];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[25], c[25].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[27], c[27].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 47 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [_DistortionMap_ST]
Vector 23 [_Texture1_ST]
Vector 24 [_Texture2_ST]
Vector 25 [_BumpMap1_ST]
Vector 26 [_BumpMap2_ST]
"vs_3_0
; 50 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c27, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c12.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c27.x
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c20
dp4 r3.y, r1, c19
dp4 r3.x, r1, c18
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c21
add o6.xyz, r1, r2
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r3.xyz, r0, v1.w
mov r0, c10
dp4 r4.z, c14, r0
mov r0, c9
mov r1.w, c27.x
mov r1.xyz, c13
dp4 r4.y, c14, r0
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c12.w, -v0
mov r1, c8
dp4 r4.x, c14, r1
dp3 o4.y, r2, r3
dp3 o5.y, r3, r4
dp3 o4.z, v2, r2
dp3 o4.x, r2, v1
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
mad o1.zw, v3.xyxy, c23.xyxy, c23
mad o1.xy, v3, c22, c22.zwzw
mad o2.zw, v3.xyxy, c25.xyxy, c25
mad o2.xy, v3, c24, c24.zwzw
mad o3.xy, v3, c26, c26.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_1.xyz;
  tmpvar_8[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_8[2] = tmpvar_2;
  mat3 tmpvar_9;
  tmpvar_9[0].x = tmpvar_8[0].x;
  tmpvar_9[0].y = tmpvar_8[1].x;
  tmpvar_9[0].z = tmpvar_8[2].x;
  tmpvar_9[1].x = tmpvar_8[0].y;
  tmpvar_9[1].y = tmpvar_8[1].y;
  tmpvar_9[1].z = tmpvar_8[2].y;
  tmpvar_9[2].x = tmpvar_8[0].z;
  tmpvar_9[2].y = tmpvar_8[1].z;
  tmpvar_9[2].z = tmpvar_8[2].z;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_13;
  mediump vec4 normal;
  normal = tmpvar_12;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAr, normal);
  x1.x = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAg, normal);
  x1.y = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAb, normal);
  x1.z = tmpvar_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBr, tmpvar_17);
  x2.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBg, tmpvar_17);
  x2.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBb, tmpvar_17);
  x2.z = tmpvar_20;
  mediump float tmpvar_21;
  tmpvar_21 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (unity_SHC.xyz * vC);
  x3 = tmpvar_22;
  tmpvar_13 = ((x1 + x2) + x3);
  shlight = tmpvar_13;
  tmpvar_6 = shlight;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_9 * (((_World2Object * tmpvar_11).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump float tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = ((texture2D (_DistortionMap, tmpvar_10).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_2 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_3 = tmpvar_33;
  tmpvar_5 = _Gloss;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_4 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  mediump vec3 tmpvar_35;
  tmpvar_35 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_35;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize (xlv_TEXCOORD3);
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD4;
  mediump vec3 viewDir;
  viewDir = tmpvar_36;
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, dot (tmpvar_35, normalize ((lightDir + viewDir))));
  nh = tmpvar_37;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir, tmpvar_35)));
  lowp float tmpvar_38;
  tmpvar_38 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_39;
  tmpvar_39 = (pow (nh, (tmpvar_5 * 128.0)) * tmpvar_38);
  res.w = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40 = (res * 2.0);
  res = tmpvar_40;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_40.xyz) + (tmpvar_40.xyz * (tmpvar_40.w * tmpvar_4)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  mediump vec3 tmpvar_41;
  tmpvar_41 = (c.xyz + (tmpvar_1 * xlv_TEXCOORD5));
  c.xyz = tmpvar_41;
  mediump vec3 tmpvar_42;
  tmpvar_42 = (c.xyz + tmpvar_3);
  c.xyz = tmpvar_42;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_1.xyz;
  tmpvar_8[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_8[2] = tmpvar_2;
  mat3 tmpvar_9;
  tmpvar_9[0].x = tmpvar_8[0].x;
  tmpvar_9[0].y = tmpvar_8[1].x;
  tmpvar_9[0].z = tmpvar_8[2].x;
  tmpvar_9[1].x = tmpvar_8[0].y;
  tmpvar_9[1].y = tmpvar_8[1].y;
  tmpvar_9[1].z = tmpvar_8[2].y;
  tmpvar_9[2].x = tmpvar_8[0].z;
  tmpvar_9[2].y = tmpvar_8[1].z;
  tmpvar_9[2].z = tmpvar_8[2].z;
  highp vec3 tmpvar_10;
  tmpvar_10 = (tmpvar_9 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_13;
  mediump vec4 normal;
  normal = tmpvar_12;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAr, normal);
  x1.x = tmpvar_14;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAg, normal);
  x1.y = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAb, normal);
  x1.z = tmpvar_16;
  mediump vec4 tmpvar_17;
  tmpvar_17 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBr, tmpvar_17);
  x2.x = tmpvar_18;
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBg, tmpvar_17);
  x2.y = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBb, tmpvar_17);
  x2.z = tmpvar_20;
  mediump float tmpvar_21;
  tmpvar_21 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (unity_SHC.xyz * vC);
  x3 = tmpvar_22;
  tmpvar_13 = ((x1 + x2) + x3);
  shlight = tmpvar_13;
  tmpvar_6 = shlight;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_9 * (((_World2Object * tmpvar_11).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump float tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_10).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = normal;
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = normal_i0;
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_2 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_3 = tmpvar_33;
  tmpvar_5 = _Gloss;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_4 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  mediump vec3 tmpvar_35;
  tmpvar_35 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_35;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize (xlv_TEXCOORD3);
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD4;
  mediump vec3 viewDir;
  viewDir = tmpvar_36;
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, dot (tmpvar_35, normalize ((lightDir + viewDir))));
  nh = tmpvar_37;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir, tmpvar_35)));
  lowp float tmpvar_38;
  tmpvar_38 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_39;
  tmpvar_39 = (pow (nh, (tmpvar_5 * 128.0)) * tmpvar_38);
  res.w = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40 = (res * 2.0);
  res = tmpvar_40;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_40.xyz) + (tmpvar_40.xyz * (tmpvar_40.w * tmpvar_4)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  mediump vec3 tmpvar_41;
  tmpvar_41 = (c.xyz + (tmpvar_1 * xlv_TEXCOORD5));
  c.xyz = tmpvar_41;
  mediump vec3 tmpvar_42;
  tmpvar_42 = (c.xyz + tmpvar_3);
  c.xyz = tmpvar_42;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Matrix 9 [_World2Object]
Vector 16 [unity_LightmapST]
Vector 17 [_DistortionMap_ST]
Vector 18 [_Texture1_ST]
Vector 19 [_Texture2_ST]
Vector 20 [_BumpMap1_ST]
Vector 21 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 23 ALU
PARAM c[22] = { { 1 },
		state.matrix.mvp,
		program.local[5..21] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[14];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[13].w, -vertex.position;
DP3 result.texcoord[3].y, R0, R1;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[18].xyxy, c[18];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[20].xyxy, c[20];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[19], c[19].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[21], c[21].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 23 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Matrix 8 [_World2Object]
Vector 14 [unity_LightmapST]
Vector 15 [_DistortionMap_ST]
Vector 16 [_Texture1_ST]
Vector 17 [_Texture2_ST]
Vector 18 [_BumpMap1_ST]
Vector 19 [_BumpMap2_ST]
"vs_3_0
; 24 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c20, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
mov r0.xyz, c13
mov r0.w, c20.x
dp4 r2.z, r0, c10
dp4 r2.x, r0, c8
dp4 r2.y, r0, c9
mad r0.xyz, r2, c12.w, -v0
dp3 o4.y, r0, r1
dp3 o4.z, v2, r0
dp3 o4.x, r0, v1
mad o1.zw, v3.xyxy, c16.xyxy, c16
mad o1.xy, v3, c15, c15.zwzw
mad o2.zw, v3.xyxy, c18.xyxy, c18
mad o2.xy, v3, c17, c17.zwzw
mad o3.xy, v3, c19, c19.zwzw
mad o5.xy, v4, c14, c14.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = tmpvar_1.xyz;
  tmpvar_5[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_5[2] = tmpvar_2;
  mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_5[0].x;
  tmpvar_6[0].y = tmpvar_5[1].x;
  tmpvar_6[0].z = tmpvar_5[2].x;
  tmpvar_6[1].x = tmpvar_5[0].y;
  tmpvar_6[1].y = tmpvar_5[1].y;
  tmpvar_6[1].z = tmpvar_5[2].y;
  tmpvar_6[2].x = tmpvar_5[0].z;
  tmpvar_6[2].y = tmpvar_5[1].z;
  tmpvar_6[2].z = tmpvar_5[2].z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform sampler2D unity_Lightmap;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump float tmpvar_4;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.x = xlv_TEXCOORD3.x;
  tmpvar_5.y = xlv_TEXCOORD3.y;
  tmpvar_5.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_6;
  tmpvar_6 = normalize (tmpvar_5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = ((tmpvar_6.x + 1.0) * 0.5);
  tmpvar_7.y = ((tmpvar_6.y + 1.0) * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((texture2D (_DistortionMap, tmpvar_8).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_9;
  highp vec2 tmpvar_10;
  tmpvar_10 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Reflection, (tmpvar_7 + tmpvar_10));
  Tex2D2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD3.x;
  tmpvar_12.y = xlv_TEXCOORD3.y;
  tmpvar_12.z = xlv_TEXCOORD3.z;
  highp float tmpvar_13;
  tmpvar_13 = (1.0 - dot (normalize (tmpvar_12), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_14;
  tmpvar_14 = (Tex2D2 * (_ReflectPower * tmpvar_13));
  highp vec2 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Texture1, (tmpvar_15 + tmpvar_10));
  Tex2D0 = tmpvar_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture2, (tmpvar_17 + tmpvar_10));
  Tex2D1 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_14 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_19;
  TexNReflex.xy = (tmpvar_19.xy + tmpvar_10);
  highp vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_BumpMap1, (tmpvar_20 + tmpvar_10));
  Tex2D3 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_22;
  highp vec2 tmpvar_23;
  tmpvar_23 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_BumpMap2, (Bump2UV + tmpvar_10));
  mediump vec4 tmpvar_25;
  tmpvar_25 = ((Tex2D3 + tmpvar_24) / 2.0);
  AvgBump = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_13 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = tmpvar_26.xyz;
  tmpvar_2 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = tmpvar_14.xyz;
  tmpvar_3 = tmpvar_31;
  tmpvar_4 = FinalAlpha;
  tmpvar_2 = normalize (tmpvar_2);
  c = vec4(0.0, 0.0, 0.0, 0.0);
  lowp vec3 tmpvar_32;
  tmpvar_32 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz);
  mediump vec3 tmpvar_33;
  tmpvar_33 = (tmpvar_1 * tmpvar_32);
  c.xyz = tmpvar_33;
  c.w = tmpvar_4;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (c.xyz + tmpvar_3);
  c.xyz = tmpvar_34;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_5;
  tmpvar_5[0] = tmpvar_1.xyz;
  tmpvar_5[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_5[2] = tmpvar_2;
  mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_5[0].x;
  tmpvar_6[0].y = tmpvar_5[1].x;
  tmpvar_6[0].z = tmpvar_5[2].x;
  tmpvar_6[1].x = tmpvar_5[0].y;
  tmpvar_6[1].y = tmpvar_5[1].y;
  tmpvar_6[1].z = tmpvar_5[2].y;
  tmpvar_6[2].x = tmpvar_5[0].z;
  tmpvar_6[2].y = tmpvar_5[1].z;
  tmpvar_6[2].z = tmpvar_5[2].z;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _WorldSpaceCameraPos;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_6 * (((_World2Object * tmpvar_7).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform sampler2D unity_Lightmap;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump float tmpvar_4;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.x = xlv_TEXCOORD3.x;
  tmpvar_5.y = xlv_TEXCOORD3.y;
  tmpvar_5.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_6;
  tmpvar_6 = normalize (tmpvar_5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = ((tmpvar_6.x + 1.0) * 0.5);
  tmpvar_7.y = ((tmpvar_6.y + 1.0) * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_8).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normal;
  DistortNormal = tmpvar_9;
  highp vec2 tmpvar_10;
  tmpvar_10 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Reflection, (tmpvar_7 + tmpvar_10));
  Tex2D2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD3.x;
  tmpvar_12.y = xlv_TEXCOORD3.y;
  tmpvar_12.z = xlv_TEXCOORD3.z;
  highp float tmpvar_13;
  tmpvar_13 = (1.0 - dot (normalize (tmpvar_12), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_14;
  tmpvar_14 = (Tex2D2 * (_ReflectPower * tmpvar_13));
  highp vec2 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Texture1, (tmpvar_15 + tmpvar_10));
  Tex2D0 = tmpvar_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture2, (tmpvar_17 + tmpvar_10));
  Tex2D1 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_14 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_19;
  TexNReflex.xy = (tmpvar_19.xy + tmpvar_10);
  highp vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_BumpMap1, (tmpvar_20 + tmpvar_10));
  Tex2D3 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_22;
  highp vec2 tmpvar_23;
  tmpvar_23 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_BumpMap2, (Bump2UV + tmpvar_10));
  mediump vec4 tmpvar_25;
  tmpvar_25 = ((Tex2D3 + tmpvar_24) / 2.0);
  AvgBump = tmpvar_25;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = normal_i0;
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_13 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = tmpvar_26.xyz;
  tmpvar_2 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = tmpvar_14.xyz;
  tmpvar_3 = tmpvar_31;
  tmpvar_4 = FinalAlpha;
  tmpvar_2 = normalize (tmpvar_2);
  c = vec4(0.0, 0.0, 0.0, 0.0);
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  lowp vec3 tmpvar_33;
  tmpvar_33 = ((8.0 * tmpvar_32.w) * tmpvar_32.xyz);
  mediump vec3 tmpvar_34;
  tmpvar_34 = (tmpvar_1 * tmpvar_33);
  c.xyz = tmpvar_34;
  c.w = tmpvar_4;
  mediump vec3 tmpvar_35;
  tmpvar_35 = (c.xyz + tmpvar_3);
  c.xyz = tmpvar_35;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [_DistortionMap_ST]
Vector 25 [_Texture1_ST]
Vector 26 [_Texture2_ST]
Vector 27 [_BumpMap1_ST]
Vector 28 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 52 ALU
PARAM c[29] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..28] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[14].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[19];
DP4 R2.y, R0, c[18];
DP4 R2.x, R0, c[17];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[22];
DP4 R3.y, R1, c[21];
DP4 R3.x, R1, c[20];
ADD R2.xyz, R2, R3;
MAD R0.x, R0, R0, -R0.y;
MUL R3.xyz, R0.x, c[23];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
ADD result.texcoord[5].xyz, R2, R3;
MOV R0.w, c[0].x;
MOV R0.xyz, c[15];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[14].w, -vertex.position;
MUL R2.xyz, R1, vertex.attrib[14].w;
MOV R1, c[16];
DP4 R3.z, R1, c[11];
DP4 R3.x, R1, c[9];
DP4 R3.y, R1, c[10];
DP3 result.texcoord[3].y, R0, R2;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[13].x;
DP3 result.texcoord[4].y, R2, R3;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
ADD result.texcoord[6].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[6].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[25].xyxy, c[25];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[24], c[24].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[27].xyxy, c[27];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[26], c[26].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[28], c[28].zwzw;
END
# 52 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [_DistortionMap_ST]
Vector 25 [_Texture1_ST]
Vector 26 [_Texture2_ST]
Vector 27 [_BumpMap1_ST]
Vector 28 [_BumpMap2_ST]
"vs_3_0
; 55 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c29, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c14.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c29.x
dp4 r2.z, r0, c19
dp4 r2.y, r0, c18
dp4 r2.x, r0, c17
mul r0.y, r2.w, r2.w
dp4 r3.z, r1, c22
dp4 r3.y, r1, c21
dp4 r3.x, r1, c20
add r1.xyz, r2, r3
mad r0.x, r0, r0, -r0.y
mul r2.xyz, r0.x, c23
add o6.xyz, r1, r2
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r3.xyz, r0, v1.w
mov r0, c10
dp4 r4.z, c16, r0
mov r0, c9
dp4 r4.y, c16, r0
mov r1.w, c29.x
mov r1.xyz, c15
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c14.w, -v0
mov r1, c8
dp4 r4.x, c16, r1
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c29.y
mul r1.y, r1, c12.x
dp3 o4.y, r2, r3
dp3 o5.y, r3, r4
dp3 o4.z, v2, r2
dp3 o4.x, r2, v1
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
mad o7.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o7.zw, r0
mad o1.zw, v3.xyxy, c25.xyxy, c25
mad o1.xy, v3, c24, c24.zwzw
mad o2.zw, v3.xyxy, c27.xyxy, c27
mad o2.xy, v3, c26, c26.zwzw
mad o3.xy, v3, c28, c28.zwzw
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = tmpvar_1.xyz;
  tmpvar_9[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_9[2] = tmpvar_2;
  mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_9[0].x;
  tmpvar_10[0].y = tmpvar_9[1].x;
  tmpvar_10[0].z = tmpvar_9[2].x;
  tmpvar_10[1].x = tmpvar_9[0].y;
  tmpvar_10[1].y = tmpvar_9[1].y;
  tmpvar_10[1].z = tmpvar_9[2].y;
  tmpvar_10[2].x = tmpvar_9[0].z;
  tmpvar_10[2].y = tmpvar_9[1].z;
  tmpvar_10[2].z = tmpvar_9[2].z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_8 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal;
  normal = tmpvar_13;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal);
  x1.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal);
  x1.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal);
  x1.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC);
  x3 = tmpvar_23;
  tmpvar_14 = ((x1 + x2) + x3);
  shlight = tmpvar_14;
  tmpvar_6 = shlight;
  highp vec4 o_i0;
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_7 * 0.5);
  o_i0 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25.x = tmpvar_24.x;
  tmpvar_25.y = (tmpvar_24.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_25 + tmpvar_24.w);
  o_i0.zw = tmpvar_7.zw;
  gl_Position = tmpvar_7;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_10 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump float tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = ((texture2D (_DistortionMap, tmpvar_10).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_2 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_3 = tmpvar_33;
  tmpvar_5 = _Gloss;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_4 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  mediump vec3 tmpvar_35;
  tmpvar_35 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_35;
  lowp float tmpvar_36;
  tmpvar_36 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize (xlv_TEXCOORD3);
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD4;
  mediump vec3 viewDir;
  viewDir = tmpvar_37;
  mediump float atten_i0;
  atten_i0 = tmpvar_36;
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_38;
  tmpvar_38 = max (0.0, dot (tmpvar_35, normalize ((lightDir + viewDir))));
  nh = tmpvar_38;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir, tmpvar_35)));
  lowp float tmpvar_39;
  tmpvar_39 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_40;
  tmpvar_40 = (pow (nh, (tmpvar_5 * 128.0)) * tmpvar_39);
  res.w = tmpvar_40;
  mediump vec4 tmpvar_41;
  tmpvar_41 = (res * (atten_i0 * 2.0));
  res = tmpvar_41;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_41.xyz) + (tmpvar_41.xyz * (tmpvar_41.w * tmpvar_4)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  mediump vec3 tmpvar_42;
  tmpvar_42 = (c.xyz + (tmpvar_1 * xlv_TEXCOORD5));
  c.xyz = tmpvar_42;
  mediump vec3 tmpvar_43;
  tmpvar_43 = (c.xyz + tmpvar_3);
  c.xyz = tmpvar_43;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = tmpvar_1.xyz;
  tmpvar_9[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_9[2] = tmpvar_2;
  mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_9[0].x;
  tmpvar_10[0].y = tmpvar_9[1].x;
  tmpvar_10[0].z = tmpvar_9[2].x;
  tmpvar_10[1].x = tmpvar_9[0].y;
  tmpvar_10[1].y = tmpvar_9[1].y;
  tmpvar_10[1].z = tmpvar_9[2].y;
  tmpvar_10[2].x = tmpvar_9[0].z;
  tmpvar_10[2].y = tmpvar_9[1].z;
  tmpvar_10[2].z = tmpvar_9[2].z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = (tmpvar_8 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_14;
  mediump vec4 normal;
  normal = tmpvar_13;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal);
  x1.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal);
  x1.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal);
  x1.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC);
  x3 = tmpvar_23;
  tmpvar_14 = ((x1 + x2) + x3);
  shlight = tmpvar_14;
  tmpvar_6 = shlight;
  highp vec4 o_i0;
  highp vec4 tmpvar_24;
  tmpvar_24 = (tmpvar_7 * 0.5);
  o_i0 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25.x = tmpvar_24.x;
  tmpvar_25.y = (tmpvar_24.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_25 + tmpvar_24.w);
  o_i0.zw = tmpvar_7.zw;
  gl_Position = tmpvar_7;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_10 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump float tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_10).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = normal;
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = normal_i0;
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_2 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_3 = tmpvar_33;
  tmpvar_5 = _Gloss;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_4 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  mediump vec3 tmpvar_35;
  tmpvar_35 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_35;
  lowp float tmpvar_36;
  tmpvar_36 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize (xlv_TEXCOORD3);
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD4;
  mediump vec3 viewDir;
  viewDir = tmpvar_37;
  mediump float atten_i0;
  atten_i0 = tmpvar_36;
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_38;
  tmpvar_38 = max (0.0, dot (tmpvar_35, normalize ((lightDir + viewDir))));
  nh = tmpvar_38;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir, tmpvar_35)));
  lowp float tmpvar_39;
  tmpvar_39 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_40;
  tmpvar_40 = (pow (nh, (tmpvar_5 * 128.0)) * tmpvar_39);
  res.w = tmpvar_40;
  mediump vec4 tmpvar_41;
  tmpvar_41 = (res * (atten_i0 * 2.0));
  res = tmpvar_41;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_41.xyz) + (tmpvar_41.xyz * (tmpvar_41.w * tmpvar_4)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  mediump vec3 tmpvar_42;
  tmpvar_42 = (c.xyz + (tmpvar_1 * xlv_TEXCOORD5));
  c.xyz = tmpvar_42;
  mediump vec3 tmpvar_43;
  tmpvar_43 = (c.xyz + tmpvar_3);
  c.xyz = tmpvar_43;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Matrix 9 [_World2Object]
Vector 17 [unity_LightmapST]
Vector 18 [_DistortionMap_ST]
Vector 19 [_Texture1_ST]
Vector 20 [_Texture2_ST]
Vector 21 [_BumpMap1_ST]
Vector 22 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 28 ALU
PARAM c[23] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..22] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1.xyz, c[15];
MOV R1.w, c[0].x;
DP4 R0.w, vertex.position, c[4];
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R2.xyz, R2, c[14].w, -vertex.position;
DP3 result.texcoord[3].y, R2, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[13].x;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[19].xyxy, c[19];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[18], c[18].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[17], c[17].zwzw;
END
# 28 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Matrix 8 [_World2Object]
Vector 16 [unity_LightmapST]
Vector 17 [_DistortionMap_ST]
Vector 18 [_Texture1_ST]
Vector 19 [_Texture2_ST]
Vector 20 [_BumpMap1_ST]
Vector 21 [_BumpMap2_ST]
"vs_3_0
; 29 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c22, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r0.xyz, r0, v1.w
mov r1.xyz, c15
mov r1.w, c22.x
dp4 r0.w, v0, c3
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c14.w, -v0
dp3 o4.y, r2, r0
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c22.y
mul r1.y, r1, c12.x
dp3 o4.z, v2, r2
dp3 o4.x, r2, v1
mad o6.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o6.zw, r0
mad o1.zw, v3.xyxy, c18.xyxy, c18
mad o1.xy, v3, c17, c17.zwzw
mad o2.zw, v3.xyxy, c20.xyxy, c20
mad o2.xy, v3, c19, c19.zwzw
mad o3.xy, v3, c21, c21.zwzw
mad o5.xy, v4, c16, c16.zwzw
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = tmpvar_1.xyz;
  tmpvar_6[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_6[2] = tmpvar_2;
  mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_6[0].x;
  tmpvar_7[0].y = tmpvar_6[1].x;
  tmpvar_7[0].z = tmpvar_6[2].x;
  tmpvar_7[1].x = tmpvar_6[0].y;
  tmpvar_7[1].y = tmpvar_6[1].y;
  tmpvar_7[1].z = tmpvar_6[2].y;
  tmpvar_7[2].x = tmpvar_6[0].z;
  tmpvar_7[2].y = tmpvar_6[1].z;
  tmpvar_7[2].z = tmpvar_6[2].z;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec4 o_i0;
  highp vec4 tmpvar_9;
  tmpvar_9 = (tmpvar_5 * 0.5);
  o_i0 = tmpvar_9;
  highp vec2 tmpvar_10;
  tmpvar_10.x = tmpvar_9.x;
  tmpvar_10.y = (tmpvar_9.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_10 + tmpvar_9.w);
  o_i0.zw = tmpvar_5.zw;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_7 * (((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform sampler2D unity_Lightmap;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump float tmpvar_4;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.x = xlv_TEXCOORD3.x;
  tmpvar_5.y = xlv_TEXCOORD3.y;
  tmpvar_5.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_6;
  tmpvar_6 = normalize (tmpvar_5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = ((tmpvar_6.x + 1.0) * 0.5);
  tmpvar_7.y = ((tmpvar_6.y + 1.0) * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = ((texture2D (_DistortionMap, tmpvar_8).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_9;
  highp vec2 tmpvar_10;
  tmpvar_10 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Reflection, (tmpvar_7 + tmpvar_10));
  Tex2D2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD3.x;
  tmpvar_12.y = xlv_TEXCOORD3.y;
  tmpvar_12.z = xlv_TEXCOORD3.z;
  highp float tmpvar_13;
  tmpvar_13 = (1.0 - dot (normalize (tmpvar_12), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_14;
  tmpvar_14 = (Tex2D2 * (_ReflectPower * tmpvar_13));
  highp vec2 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Texture1, (tmpvar_15 + tmpvar_10));
  Tex2D0 = tmpvar_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture2, (tmpvar_17 + tmpvar_10));
  Tex2D1 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_14 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_19;
  TexNReflex.xy = (tmpvar_19.xy + tmpvar_10);
  highp vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_BumpMap1, (tmpvar_20 + tmpvar_10));
  Tex2D3 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_22;
  highp vec2 tmpvar_23;
  tmpvar_23 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_BumpMap2, (Bump2UV + tmpvar_10));
  mediump vec4 tmpvar_25;
  tmpvar_25 = ((Tex2D3 + tmpvar_24) / 2.0);
  AvgBump = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_13 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = tmpvar_26.xyz;
  tmpvar_2 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = tmpvar_14.xyz;
  tmpvar_3 = tmpvar_31;
  tmpvar_4 = FinalAlpha;
  tmpvar_2 = normalize (tmpvar_2);
  c = vec4(0.0, 0.0, 0.0, 0.0);
  lowp vec3 tmpvar_32;
  tmpvar_32 = min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz), vec3((texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x * 2.0)));
  mediump vec3 tmpvar_33;
  tmpvar_33 = (tmpvar_1 * tmpvar_32);
  c.xyz = tmpvar_33;
  c.w = tmpvar_4;
  mediump vec3 tmpvar_34;
  tmpvar_34 = (c.xyz + tmpvar_3);
  c.xyz = tmpvar_34;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = tmpvar_1.xyz;
  tmpvar_6[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_6[2] = tmpvar_2;
  mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_6[0].x;
  tmpvar_7[0].y = tmpvar_6[1].x;
  tmpvar_7[0].z = tmpvar_6[2].x;
  tmpvar_7[1].x = tmpvar_6[0].y;
  tmpvar_7[1].y = tmpvar_6[1].y;
  tmpvar_7[1].z = tmpvar_6[2].y;
  tmpvar_7[2].x = tmpvar_6[0].z;
  tmpvar_7[2].y = tmpvar_6[1].z;
  tmpvar_7[2].z = tmpvar_6[2].z;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec4 o_i0;
  highp vec4 tmpvar_9;
  tmpvar_9 = (tmpvar_5 * 0.5);
  o_i0 = tmpvar_9;
  highp vec2 tmpvar_10;
  tmpvar_10.x = tmpvar_9.x;
  tmpvar_10.y = (tmpvar_9.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_10 + tmpvar_9.w);
  o_i0.zw = tmpvar_5.zw;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_7 * (((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform sampler2D unity_Lightmap;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump float tmpvar_4;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.x = xlv_TEXCOORD3.x;
  tmpvar_5.y = xlv_TEXCOORD3.y;
  tmpvar_5.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_6;
  tmpvar_6 = normalize (tmpvar_5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = ((tmpvar_6.x + 1.0) * 0.5);
  tmpvar_7.y = ((tmpvar_6.y + 1.0) * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_8).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = normal;
  DistortNormal = tmpvar_9;
  highp vec2 tmpvar_10;
  tmpvar_10 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Reflection, (tmpvar_7 + tmpvar_10));
  Tex2D2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD3.x;
  tmpvar_12.y = xlv_TEXCOORD3.y;
  tmpvar_12.z = xlv_TEXCOORD3.z;
  highp float tmpvar_13;
  tmpvar_13 = (1.0 - dot (normalize (tmpvar_12), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_14;
  tmpvar_14 = (Tex2D2 * (_ReflectPower * tmpvar_13));
  highp vec2 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Texture1, (tmpvar_15 + tmpvar_10));
  Tex2D0 = tmpvar_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture2, (tmpvar_17 + tmpvar_10));
  Tex2D1 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = (tmpvar_14 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_19;
  TexNReflex.xy = (tmpvar_19.xy + tmpvar_10);
  highp vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_BumpMap1, (tmpvar_20 + tmpvar_10));
  Tex2D3 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_22;
  highp vec2 tmpvar_23;
  tmpvar_23 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_BumpMap2, (Bump2UV + tmpvar_10));
  mediump vec4 tmpvar_25;
  tmpvar_25 = ((Tex2D3 + tmpvar_24) / 2.0);
  AvgBump = tmpvar_25;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = normal_i0;
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_13 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = tmpvar_26.xyz;
  tmpvar_2 = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = tmpvar_14.xyz;
  tmpvar_3 = tmpvar_31;
  tmpvar_4 = FinalAlpha;
  tmpvar_2 = normalize (tmpvar_2);
  lowp vec4 tmpvar_32;
  tmpvar_32 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5);
  c = vec4(0.0, 0.0, 0.0, 0.0);
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  lowp vec3 tmpvar_34;
  tmpvar_34 = ((8.0 * tmpvar_33.w) * tmpvar_33.xyz);
  lowp vec3 tmpvar_35;
  tmpvar_35 = max (min (tmpvar_34, ((tmpvar_32.x * 2.0) * tmpvar_33.xyz)), (tmpvar_34 * tmpvar_32.x));
  mediump vec3 tmpvar_36;
  tmpvar_36 = (tmpvar_1 * tmpvar_35);
  c.xyz = tmpvar_36;
  c.w = tmpvar_4;
  mediump vec3 tmpvar_37;
  tmpvar_37 = (c.xyz + tmpvar_3);
  c.xyz = tmpvar_37;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [_DistortionMap_ST]
Vector 32 [_Texture1_ST]
Vector 33 [_Texture2_ST]
Vector 34 [_BumpMap1_ST]
Vector 35 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 78 ALU
PARAM c[36] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..35] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[13].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[17];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[16];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[18];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[19];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[21];
MAD R1.xyz, R0.x, c[20], R1;
MAD R0.xyz, R0.z, c[22], R1;
MAD R1.xyz, R0.w, c[23], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[29];
DP4 R3.y, R0, c[28];
DP4 R3.x, R0, c[27];
MUL R1.w, R3, R3;
MAD R0.x, R4, R4, -R1.w;
MOV R0.w, c[0].x;
DP4 R2.z, R4, c[26];
DP4 R2.y, R4, c[25];
DP4 R2.x, R4, c[24];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[30];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[5].xyz, R3, R1;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0.xyz, c[14];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[13].w, -vertex.position;
MUL R2.xyz, R1, vertex.attrib[14].w;
MOV R1, c[15];
DP4 R3.z, R1, c[11];
DP4 R3.x, R1, c[9];
DP4 R3.y, R1, c[10];
DP3 result.texcoord[3].y, R0, R2;
DP3 result.texcoord[4].y, R2, R3;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[32].xyxy, c[32];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[31], c[31].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[34].xyxy, c[34];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[33], c[33].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[35], c[35].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 78 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
Vector 30 [_DistortionMap_ST]
Vector 31 [_Texture1_ST]
Vector 32 [_Texture2_ST]
Vector 33 [_BumpMap1_ST]
Vector 34 [_BumpMap2_ST]
"vs_3_0
; 81 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c35, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c12.w
dp4 r0.x, v0, c5
add r1, -r0.x, c16
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c15
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c35.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c17
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c18
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c35.x
dp4 r2.z, r4, c25
dp4 r2.y, r4, c24
dp4 r2.x, r4, c23
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c35.y
mul r0, r0, r1
mul r1.xyz, r0.y, c20
mad r1.xyz, r0.x, c19, r1
mad r0.xyz, r0.z, c21, r1
mad r1.xyz, r0.w, c22, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c28
dp4 r3.y, r0, c27
dp4 r3.x, r0, c26
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c29
add r2.xyz, r2, r3
add r2.xyz, r2, r0
add o6.xyz, r2, r1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r3.xyz, r0, v1.w
mov r0, c10
dp4 r4.z, c14, r0
mov r0, c9
mov r1.w, c35.x
mov r1.xyz, c13
dp4 r4.y, c14, r0
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c12.w, -v0
mov r1, c8
dp4 r4.x, c14, r1
dp3 o4.y, r2, r3
dp3 o5.y, r3, r4
dp3 o4.z, v2, r2
dp3 o4.x, r2, v1
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
mad o1.zw, v3.xyxy, c31.xyxy, c31
mad o1.xy, v3, c30, c30.zwzw
mad o2.zw, v3.xyxy, c33.xyxy, c33
mad o2.xy, v3, c32, c32.zwzw
mad o3.xy, v3, c34, c34.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = tmpvar_1.xyz;
  tmpvar_9[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_9[2] = tmpvar_2;
  mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_9[0].x;
  tmpvar_10[0].y = tmpvar_9[1].x;
  tmpvar_10[0].z = tmpvar_9[2].x;
  tmpvar_10[1].x = tmpvar_9[0].y;
  tmpvar_10[1].y = tmpvar_9[1].y;
  tmpvar_10[1].z = tmpvar_9[2].y;
  tmpvar_10[2].x = tmpvar_9[0].z;
  tmpvar_10[2].y = tmpvar_9[1].z;
  tmpvar_10[2].z = tmpvar_9[2].z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_8;
  mediump vec3 tmpvar_14;
  mediump vec4 normal;
  normal = tmpvar_13;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal);
  x1.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal);
  x1.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal);
  x1.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC);
  x3 = tmpvar_23;
  tmpvar_14 = ((x1 + x2) + x3);
  shlight = tmpvar_14;
  tmpvar_6 = shlight;
  highp vec3 tmpvar_24;
  tmpvar_24 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_24.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_24.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_24.z);
  highp vec4 tmpvar_28;
  tmpvar_28 = (((tmpvar_25 * tmpvar_25) + (tmpvar_26 * tmpvar_26)) + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_29;
  tmpvar_29 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_25 * tmpvar_8.x) + (tmpvar_26 * tmpvar_8.y)) + (tmpvar_27 * tmpvar_8.z)) * inversesqrt (tmpvar_28))) * (1.0/((1.0 + (tmpvar_28 * unity_4LightAtten0)))));
  highp vec3 tmpvar_30;
  tmpvar_30 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_29.x) + (unity_LightColor[1].xyz * tmpvar_29.y)) + (unity_LightColor[2].xyz * tmpvar_29.z)) + (unity_LightColor[3].xyz * tmpvar_29.w)));
  tmpvar_6 = tmpvar_30;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_10 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump float tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = ((texture2D (_DistortionMap, tmpvar_10).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_2 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_3 = tmpvar_33;
  tmpvar_5 = _Gloss;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_4 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  mediump vec3 tmpvar_35;
  tmpvar_35 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_35;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize (xlv_TEXCOORD3);
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD4;
  mediump vec3 viewDir;
  viewDir = tmpvar_36;
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, dot (tmpvar_35, normalize ((lightDir + viewDir))));
  nh = tmpvar_37;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir, tmpvar_35)));
  lowp float tmpvar_38;
  tmpvar_38 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_39;
  tmpvar_39 = (pow (nh, (tmpvar_5 * 128.0)) * tmpvar_38);
  res.w = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40 = (res * 2.0);
  res = tmpvar_40;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_40.xyz) + (tmpvar_40.xyz * (tmpvar_40.w * tmpvar_4)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  mediump vec3 tmpvar_41;
  tmpvar_41 = (c.xyz + (tmpvar_1 * xlv_TEXCOORD5));
  c.xyz = tmpvar_41;
  mediump vec3 tmpvar_42;
  tmpvar_42 = (c.xyz + tmpvar_3);
  c.xyz = tmpvar_42;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (tmpvar_2 * unity_Scale.w));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = tmpvar_1.xyz;
  tmpvar_9[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_9[2] = tmpvar_2;
  mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_9[0].x;
  tmpvar_10[0].y = tmpvar_9[1].x;
  tmpvar_10[0].z = tmpvar_9[2].x;
  tmpvar_10[1].x = tmpvar_9[0].y;
  tmpvar_10[1].y = tmpvar_9[1].y;
  tmpvar_10[1].z = tmpvar_9[2].y;
  tmpvar_10[2].x = tmpvar_9[0].z;
  tmpvar_10[2].y = tmpvar_9[1].z;
  tmpvar_10[2].z = tmpvar_9[2].z;
  highp vec3 tmpvar_11;
  tmpvar_11 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_8;
  mediump vec3 tmpvar_14;
  mediump vec4 normal;
  normal = tmpvar_13;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_15;
  tmpvar_15 = dot (unity_SHAr, normal);
  x1.x = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAg, normal);
  x1.y = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAb, normal);
  x1.z = tmpvar_17;
  mediump vec4 tmpvar_18;
  tmpvar_18 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_19;
  tmpvar_19 = dot (unity_SHBr, tmpvar_18);
  x2.x = tmpvar_19;
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBg, tmpvar_18);
  x2.y = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBb, tmpvar_18);
  x2.z = tmpvar_21;
  mediump float tmpvar_22;
  tmpvar_22 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_22;
  highp vec3 tmpvar_23;
  tmpvar_23 = (unity_SHC.xyz * vC);
  x3 = tmpvar_23;
  tmpvar_14 = ((x1 + x2) + x3);
  shlight = tmpvar_14;
  tmpvar_6 = shlight;
  highp vec3 tmpvar_24;
  tmpvar_24 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_24.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_24.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_24.z);
  highp vec4 tmpvar_28;
  tmpvar_28 = (((tmpvar_25 * tmpvar_25) + (tmpvar_26 * tmpvar_26)) + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_29;
  tmpvar_29 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_25 * tmpvar_8.x) + (tmpvar_26 * tmpvar_8.y)) + (tmpvar_27 * tmpvar_8.z)) * inversesqrt (tmpvar_28))) * (1.0/((1.0 + (tmpvar_28 * unity_4LightAtten0)))));
  highp vec3 tmpvar_30;
  tmpvar_30 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_29.x) + (unity_LightColor[1].xyz * tmpvar_29.y)) + (unity_LightColor[2].xyz * tmpvar_29.z)) + (unity_LightColor[3].xyz * tmpvar_29.w)));
  tmpvar_6 = tmpvar_30;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_10 * (((_World2Object * tmpvar_12).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
}



#endif
#ifdef FRAGMENT

varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump float tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_10).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = normal;
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = normal_i0;
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_2 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_3 = tmpvar_33;
  tmpvar_5 = _Gloss;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_4 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  mediump vec3 tmpvar_35;
  tmpvar_35 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_35;
  highp vec3 tmpvar_36;
  tmpvar_36 = normalize (xlv_TEXCOORD3);
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD4;
  mediump vec3 viewDir;
  viewDir = tmpvar_36;
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, dot (tmpvar_35, normalize ((lightDir + viewDir))));
  nh = tmpvar_37;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir, tmpvar_35)));
  lowp float tmpvar_38;
  tmpvar_38 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_39;
  tmpvar_39 = (pow (nh, (tmpvar_5 * 128.0)) * tmpvar_38);
  res.w = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40 = (res * 2.0);
  res = tmpvar_40;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_40.xyz) + (tmpvar_40.xyz * (tmpvar_40.w * tmpvar_4)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  mediump vec3 tmpvar_41;
  tmpvar_41 = (c.xyz + (tmpvar_1 * xlv_TEXCOORD5));
  c.xyz = tmpvar_41;
  mediump vec3 tmpvar_42;
  tmpvar_42 = (c.xyz + tmpvar_3);
  c.xyz = tmpvar_42;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
Vector 32 [_DistortionMap_ST]
Vector 33 [_Texture1_ST]
Vector 34 [_Texture2_ST]
Vector 35 [_BumpMap1_ST]
Vector 36 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 83 ALU
PARAM c[37] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..36] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[14].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[18];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[17];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[19];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[20];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[22];
MAD R1.xyz, R0.x, c[21], R1;
MAD R0.xyz, R0.z, c[23], R1;
MAD R1.xyz, R0.w, c[24], R0;
MUL R0, R4.xyzz, R4.yzzx;
DP4 R3.z, R0, c[30];
DP4 R3.y, R0, c[29];
DP4 R3.x, R0, c[28];
MUL R1.w, R3, R3;
MOV R0.w, c[0].x;
MAD R0.x, R4, R4, -R1.w;
DP4 R2.z, R4, c[27];
DP4 R2.y, R4, c[26];
DP4 R2.x, R4, c[25];
ADD R2.xyz, R2, R3;
MUL R3.xyz, R0.x, c[31];
ADD R3.xyz, R2, R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
ADD result.texcoord[5].xyz, R3, R1;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R0.xyz, c[15];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[14].w, -vertex.position;
MUL R2.xyz, R1, vertex.attrib[14].w;
MOV R1, c[16];
DP4 R3.z, R1, c[11];
DP4 R3.x, R1, c[9];
DP4 R3.y, R1, c[10];
DP3 result.texcoord[3].y, R0, R2;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[4];
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[13].x;
DP3 result.texcoord[4].y, R2, R3;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
ADD result.texcoord[6].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[6].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[33].xyxy, c[33];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[32], c[32].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[35].xyxy, c[35];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[34], c[34].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[36], c[36].zwzw;
END
# 83 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
Vector 32 [_DistortionMap_ST]
Vector 33 [_Texture1_ST]
Vector 34 [_Texture2_ST]
Vector 35 [_BumpMap1_ST]
Vector 36 [_BumpMap2_ST]
"vs_3_0
; 86 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c37, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c14.w
dp4 r0.x, v0, c5
add r1, -r0.x, c18
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c17
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c37.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c19
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c20
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c37.x
dp4 r2.z, r4, c27
dp4 r2.y, r4, c26
dp4 r2.x, r4, c25
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c37.y
mul r0, r0, r1
mul r1.xyz, r0.y, c22
mad r1.xyz, r0.x, c21, r1
mad r0.xyz, r0.z, c23, r1
mad r1.xyz, r0.w, c24, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c30
dp4 r3.y, r0, c29
dp4 r3.x, r0, c28
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c31
add r2.xyz, r2, r3
add r2.xyz, r2, r0
add o6.xyz, r2, r1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r3.xyz, r0, v1.w
mov r0, c10
dp4 r4.z, c16, r0
mov r0, c9
dp4 r4.y, c16, r0
mov r1.w, c37.x
mov r1.xyz, c15
dp4 r0.w, v0, c3
dp4 r0.z, v0, c2
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c14.w, -v0
mov r1, c8
dp4 r4.x, c16, r1
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c37.z
mul r1.y, r1, c12.x
dp3 o4.y, r2, r3
dp3 o5.y, r3, r4
dp3 o4.z, v2, r2
dp3 o4.x, r2, v1
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
mad o7.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o7.zw, r0
mad o1.zw, v3.xyxy, c33.xyxy, c33
mad o1.xy, v3, c32, c32.zwzw
mad o2.zw, v3.xyxy, c35.xyxy, c35
mad o2.xy, v3, c34, c34.zwzw
mad o3.xy, v3, c36, c36.zwzw
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (tmpvar_2 * unity_Scale.w));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = tmpvar_1.xyz;
  tmpvar_10[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_10[2] = tmpvar_2;
  mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_10[0].x;
  tmpvar_11[0].y = tmpvar_10[1].x;
  tmpvar_11[0].z = tmpvar_10[2].x;
  tmpvar_11[1].x = tmpvar_10[0].y;
  tmpvar_11[1].y = tmpvar_10[1].y;
  tmpvar_11[1].z = tmpvar_10[2].y;
  tmpvar_11[2].x = tmpvar_10[0].z;
  tmpvar_11[2].y = tmpvar_10[1].z;
  tmpvar_11[2].z = tmpvar_10[2].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_9;
  mediump vec3 tmpvar_15;
  mediump vec4 normal;
  normal = tmpvar_14;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAr, normal);
  x1.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAg, normal);
  x1.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAb, normal);
  x1.z = tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBr, tmpvar_19);
  x2.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBg, tmpvar_19);
  x2.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBb, tmpvar_19);
  x2.z = tmpvar_22;
  mediump float tmpvar_23;
  tmpvar_23 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (unity_SHC.xyz * vC);
  x3 = tmpvar_24;
  tmpvar_15 = ((x1 + x2) + x3);
  shlight = tmpvar_15;
  tmpvar_6 = shlight;
  highp vec3 tmpvar_25;
  tmpvar_25 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_25.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_25.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_25.z);
  highp vec4 tmpvar_29;
  tmpvar_29 = (((tmpvar_26 * tmpvar_26) + (tmpvar_27 * tmpvar_27)) + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_30;
  tmpvar_30 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_26 * tmpvar_9.x) + (tmpvar_27 * tmpvar_9.y)) + (tmpvar_28 * tmpvar_9.z)) * inversesqrt (tmpvar_29))) * (1.0/((1.0 + (tmpvar_29 * unity_4LightAtten0)))));
  highp vec3 tmpvar_31;
  tmpvar_31 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_30.x) + (unity_LightColor[1].xyz * tmpvar_30.y)) + (unity_LightColor[2].xyz * tmpvar_30.z)) + (unity_LightColor[3].xyz * tmpvar_30.w)));
  tmpvar_6 = tmpvar_31;
  highp vec4 o_i0;
  highp vec4 tmpvar_32;
  tmpvar_32 = (tmpvar_7 * 0.5);
  o_i0 = tmpvar_32;
  highp vec2 tmpvar_33;
  tmpvar_33.x = tmpvar_32.x;
  tmpvar_33.y = (tmpvar_32.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_33 + tmpvar_32.w);
  o_i0.zw = tmpvar_7.zw;
  gl_Position = tmpvar_7;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_11 * (((_World2Object * tmpvar_13).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump float tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = ((texture2D (_DistortionMap, tmpvar_10).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_2 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_3 = tmpvar_33;
  tmpvar_5 = _Gloss;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_4 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  mediump vec3 tmpvar_35;
  tmpvar_35 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_35;
  lowp float tmpvar_36;
  tmpvar_36 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize (xlv_TEXCOORD3);
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD4;
  mediump vec3 viewDir;
  viewDir = tmpvar_37;
  mediump float atten_i0;
  atten_i0 = tmpvar_36;
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_38;
  tmpvar_38 = max (0.0, dot (tmpvar_35, normalize ((lightDir + viewDir))));
  nh = tmpvar_38;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir, tmpvar_35)));
  lowp float tmpvar_39;
  tmpvar_39 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_40;
  tmpvar_40 = (pow (nh, (tmpvar_5 * 128.0)) * tmpvar_39);
  res.w = tmpvar_40;
  mediump vec4 tmpvar_41;
  tmpvar_41 = (res * (atten_i0 * 2.0));
  res = tmpvar_41;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_41.xyz) + (tmpvar_41.xyz * (tmpvar_41.w * tmpvar_4)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  mediump vec3 tmpvar_42;
  tmpvar_42 = (c.xyz + (tmpvar_1 * xlv_TEXCOORD5));
  c.xyz = tmpvar_42;
  mediump vec3 tmpvar_43;
  tmpvar_43 = (c.xyz + tmpvar_3);
  c.xyz = tmpvar_43;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_8 * (tmpvar_2 * unity_Scale.w));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = tmpvar_1.xyz;
  tmpvar_10[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_10[2] = tmpvar_2;
  mat3 tmpvar_11;
  tmpvar_11[0].x = tmpvar_10[0].x;
  tmpvar_11[0].y = tmpvar_10[1].x;
  tmpvar_11[0].z = tmpvar_10[2].x;
  tmpvar_11[1].x = tmpvar_10[0].y;
  tmpvar_11[1].y = tmpvar_10[1].y;
  tmpvar_11[1].z = tmpvar_10[2].y;
  tmpvar_11[2].x = tmpvar_10[0].z;
  tmpvar_11[2].y = tmpvar_10[1].z;
  tmpvar_11[2].z = tmpvar_10[2].z;
  highp vec3 tmpvar_12;
  tmpvar_12 = (tmpvar_11 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_9;
  mediump vec3 tmpvar_15;
  mediump vec4 normal;
  normal = tmpvar_14;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHAr, normal);
  x1.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHAg, normal);
  x1.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHAb, normal);
  x1.z = tmpvar_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_20;
  tmpvar_20 = dot (unity_SHBr, tmpvar_19);
  x2.x = tmpvar_20;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHBg, tmpvar_19);
  x2.y = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHBb, tmpvar_19);
  x2.z = tmpvar_22;
  mediump float tmpvar_23;
  tmpvar_23 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (unity_SHC.xyz * vC);
  x3 = tmpvar_24;
  tmpvar_15 = ((x1 + x2) + x3);
  shlight = tmpvar_15;
  tmpvar_6 = shlight;
  highp vec3 tmpvar_25;
  tmpvar_25 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosX0 - tmpvar_25.x);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosY0 - tmpvar_25.y);
  highp vec4 tmpvar_28;
  tmpvar_28 = (unity_4LightPosZ0 - tmpvar_25.z);
  highp vec4 tmpvar_29;
  tmpvar_29 = (((tmpvar_26 * tmpvar_26) + (tmpvar_27 * tmpvar_27)) + (tmpvar_28 * tmpvar_28));
  highp vec4 tmpvar_30;
  tmpvar_30 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_26 * tmpvar_9.x) + (tmpvar_27 * tmpvar_9.y)) + (tmpvar_28 * tmpvar_9.z)) * inversesqrt (tmpvar_29))) * (1.0/((1.0 + (tmpvar_29 * unity_4LightAtten0)))));
  highp vec3 tmpvar_31;
  tmpvar_31 = (tmpvar_6 + ((((unity_LightColor[0].xyz * tmpvar_30.x) + (unity_LightColor[1].xyz * tmpvar_30.y)) + (unity_LightColor[2].xyz * tmpvar_30.z)) + (unity_LightColor[3].xyz * tmpvar_30.w)));
  tmpvar_6 = tmpvar_31;
  highp vec4 o_i0;
  highp vec4 tmpvar_32;
  tmpvar_32 = (tmpvar_7 * 0.5);
  o_i0 = tmpvar_32;
  highp vec2 tmpvar_33;
  tmpvar_33.x = tmpvar_32.x;
  tmpvar_33.y = (tmpvar_32.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_33 + tmpvar_32.w);
  o_i0.zw = tmpvar_7.zw;
  gl_Position = tmpvar_7;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_11 * (((_World2Object * tmpvar_13).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _ShadowMapTexture;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump float tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_10).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = normal;
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = normal_i0;
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_2 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_3 = tmpvar_33;
  tmpvar_5 = _Gloss;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_4 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  mediump vec3 tmpvar_35;
  tmpvar_35 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_35;
  lowp float tmpvar_36;
  tmpvar_36 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD6).x;
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize (xlv_TEXCOORD3);
  mediump vec3 lightDir;
  lightDir = xlv_TEXCOORD4;
  mediump vec3 viewDir;
  viewDir = tmpvar_37;
  mediump float atten_i0;
  atten_i0 = tmpvar_36;
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_38;
  tmpvar_38 = max (0.0, dot (tmpvar_35, normalize ((lightDir + viewDir))));
  nh = tmpvar_38;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir, tmpvar_35)));
  lowp float tmpvar_39;
  tmpvar_39 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_40;
  tmpvar_40 = (pow (nh, (tmpvar_5 * 128.0)) * tmpvar_39);
  res.w = tmpvar_40;
  mediump vec4 tmpvar_41;
  tmpvar_41 = (res * (atten_i0 * 2.0));
  res = tmpvar_41;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_41.xyz) + (tmpvar_41.xyz * (tmpvar_41.w * tmpvar_4)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  mediump vec3 tmpvar_42;
  tmpvar_42 = (c.xyz + (tmpvar_1 * xlv_TEXCOORD5));
  c.xyz = tmpvar_42;
  mediump vec3 tmpvar_43;
  tmpvar_43 = (c.xyz + tmpvar_3);
  c.xyz = tmpvar_43;
  gl_FragData[0] = c;
}



#endif"
}

}
Program "fp" {
// Fragment combos: 4
//   opengl - ALU: 37 to 76, TEX: 5 to 7
//   d3d9 - ALU: 32 to 71, TEX: 5 to 7
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_MainTexSpeed]
Float 4 [_Bump1Speed]
Float 5 [_Texture2Speed]
Float 6 [_Bump2Speed]
Float 7 [_DistortionSpeed]
Float 8 [_DistortionPower]
Float 9 [_Specular]
Float 10 [_Gloss]
Float 11 [_Opacity]
Float 12 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 4 [_BumpMap1] 2D
SetTexture 5 [_BumpMap2] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 74 ALU, 6 TEX
PARAM c[16] = { program.local[0..12],
		{ 1, 10, 0, 2 },
		{ 0.5, 128, 0.80000001 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.y, c[4].x;
MOV R0.z, c[6].x;
MAD R1.xy, R0.y, c[0].x, fragment.texcoord[1].zwzw;
MOV R0.x, c[0];
MAD R0.xy, R0.x, c[7].x, fragment.texcoord[0];
TEX R0.yw, R0, texture[0], 2D;
MAD R4.xy, R0.wyzw, c[13].w, -c[13].x;
MAD R1.zw, R0.z, c[0].x, fragment.texcoord[2].xyxy;
MAD R0.zw, R4.xyxy, c[8].x, R1;
MAD R0.xy, R4, c[8].x, R1;
TEX R1.yw, R0.zwzw, texture[5], 2D;
TEX R0.yw, R0, texture[4], 2D;
ADD R0.xy, R0.ywzw, R1.ywzw;
ADD R0.xy, R0.yxzw, -c[13].x;
MUL R0.z, R0.y, R0.y;
MAD R0.z, -R0.x, R0.x, -R0;
ADD R0.z, R0, c[13].x;
RSQ R0.z, R0.z;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.w, R0.w;
MOV R1.xyz, fragment.texcoord[4];
MAD R1.xyz, fragment.texcoord[3], R0.w, R1;
RCP R0.z, R0.z;
DP3 R1.w, R1, R1;
DP3 R0.w, R0, R0;
RSQ R1.w, R1.w;
MUL R1.xyz, R1.w, R1;
RSQ R0.w, R0.w;
MUL R0.xyz, R0.w, R0;
DP3 R0.w, R0, R1;
DP3 R1.y, R0, fragment.texcoord[4];
MAX R1.x, R0.w, c[13].z;
MOV R0.xyz, c[15];
MOV R0.w, c[14].y;
DP3 R0.y, R0, c[1];
MUL R0.w, R0, c[10].x;
POW R0.x, R1.x, R0.w;
MUL R0.w, R0.x, R0.y;
MAX R0.x, R1.y, c[13].z;
MUL R0.xyz, R0.x, c[1];
MUL R3, R0, c[13].w;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.z, R0.z;
MUL R1.xyz, fragment.texcoord[3], c[13].xxyw;
MOV R1.w, c[13].z;
DP4 R1.x, R1, R1;
RSQ R1.x, R1.x;
MAD R0.x, R1, fragment.texcoord[3], c[13];
MAD R0.y, R1.x, fragment.texcoord[3], c[13].x;
MAD R0.w, fragment.texcoord[3].z, -R0.z, c[13].x;
MUL R1.x, R0.w, c[12];
MUL R0.w, R0, c[14].z;
MUL R1.w, R3, c[9].x;
MUL R0.x, R0, c[14];
MUL R0.y, R0, c[14].x;
MAD R0.xy, R4, c[8].x, R0;
TEX R0.xyz, R0, texture[1], 2D;
MUL R2.xyz, R0, R1.x;
MOV R0.z, c[5].x;
MAD R1.xy, R0.z, c[0].x, fragment.texcoord[1];
MOV R0.x, c[3];
MAD R0.xy, R0.x, c[0].x, fragment.texcoord[0].zwzw;
MAD R0.xy, R4, c[8].x, R0;
MAD R1.xy, R4, c[8].x, R1;
TEX R1.xyz, R1, texture[3], 2D;
TEX R0.xyz, R0, texture[2], 2D;
MAD R0.xyz, R0, R1, R2;
MAD R0.xy, R4, c[8].x, R0;
MUL R0.xyz, R0, c[2];
MUL R1.xyz, R3, R1.w;
MAD R1.xyz, R0, R3, R1;
MAD R0.xyz, R0, fragment.texcoord[5], R1;
ADD result.color.xyz, R0, R2;
ADD result.color.w, R0, c[11].x;
END
# 74 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_MainTexSpeed]
Float 4 [_Bump1Speed]
Float 5 [_Texture2Speed]
Float 6 [_Bump2Speed]
Float 7 [_DistortionSpeed]
Float 8 [_DistortionPower]
Float 9 [_Specular]
Float 10 [_Gloss]
Float 11 [_Opacity]
Float 12 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 4 [_BumpMap1] 2D
SetTexture 5 [_BumpMap2] 2D
"ps_3_0
; 70 ALU, 6 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c13, 2.00000000, -1.00000000, 1.00000000, 10.00000000
def c14, 0.00000000, 0.50000000, 128.00000000, 0.80000001
def c15, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
mov r0.y, c0.x
mad r0.zw, c4.x, r0.y, v1
mov r0.x, c7
mad r0.xy, c0.x, r0.x, v0
texld r1.yw, r0, s0
mov r1.x, c0
mad_pp r4.xy, r1.wyzw, c13.x, c13.y
mad r0.xy, c6.x, r1.x, v2
mad r1.xy, r4, c8.x, r0
mad r0.xy, r4, c8.x, r0.zwzw
texld r1.yw, r1, s5
texld r0.yw, r0, s4
add_pp r0.xy, r0.ywzw, r1.ywzw
add_pp r0.xy, r0.yxzw, c13.y
mul_pp r0.z, r0.y, r0.y
mad_pp r0.z, -r0.x, r0.x, -r0
add_pp r0.z, r0, c13
rsq_pp r0.z, r0.z
rcp_pp r0.z, r0.z
dp3_pp r0.w, r0, r0
rsq_pp r0.w, r0.w
dp3_pp r1.w, v3, v3
mul_pp r0.xyz, r0.w, r0
rsq_pp r1.w, r1.w
mov_pp r1.xyz, v4
mad_pp r1.xyz, v3, r1.w, r1
dp3_pp r1.w, r1, r1
rsq_pp r0.w, r1.w
mul_pp r1.xyz, r0.w, r1
dp3_pp r1.w, r0, v4
dp3_pp r0.x, r0, r1
mov_pp r0.w, c10.x
mul_pp r1.y, c14.z, r0.w
max_pp r1.x, r0, c14
pow r0, r1.x, r1.y
mov_pp r1.xyz, c1
dp3_pp r0.y, c15, r1
mul r0.w, r0.x, r0.y
max_pp r0.x, r1.w, c14
mul_pp r0.xyz, r0.x, c1
mul_pp r3, r0, c13.x
dp3 r0.z, v3, v3
rsq r0.z, r0.z
mul r1.xyz, v3, c13.zzww
mov r1.w, c14.x
dp4 r1.x, r1, r1
rsq r1.x, r1.x
mad r0.x, r1, v3, c13.z
mad r0.y, r1.x, v3, c13.z
mad r0.w, v3.z, -r0.z, c13.z
mul r1.x, r0.w, c12
mul r0.w, r0, c14
mul_pp r1.w, r3, c9.x
mul r0.x, r0, c14.y
mul r0.y, r0, c14
mad r0.xy, r4, c8.x, r0
texld r0.xyz, r0, s1
mul r2.xyz, r0, r1.x
mov r0.z, c0.x
mad r1.xy, c5.x, r0.z, v1
mov r0.x, c0
mad r0.xy, c3.x, r0.x, v0.zwzw
mad r0.xy, r4, c8.x, r0
mad r1.xy, r4, c8.x, r1
texld r1.xyz, r1, s3
texld r0.xyz, r0, s2
mad r0.xyz, r0, r1, r2
mad r0.xy, r4, c8.x, r0
mul r0.xyz, r0, c2
mul_pp r1.xyz, r3, r1.w
mad_pp r1.xyz, r0, r3, r1
mad_pp r0.xyz, r0, v5, r1
add_pp oC0.xyz, r0, r2
add oC0.w, r0, c11.x
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_Time]
Vector 1 [_Color]
Float 2 [_MainTexSpeed]
Float 4 [_Texture2Speed]
Float 6 [_DistortionSpeed]
Float 7 [_DistortionPower]
Float 8 [_Opacity]
Float 9 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 6 [unity_Lightmap] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 37 ALU, 5 TEX
PARAM c[12] = { program.local[0..9],
		{ 1, 10, 0, 2 },
		{ 0.5, 8, 0.80000001 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, fragment.texcoord[3], c[10].xxyw;
MOV R0.w, c[10].z;
DP4 R0.x, R0, R0;
RSQ R0.x, R0.x;
MAD R0.y, R0.x, fragment.texcoord[3].x, c[10].x;
MUL R1.x, R0.y, c[11];
MAD R0.y, R0.x, fragment.texcoord[3], c[10].x;
MUL R1.y, R0, c[11].x;
MOV R0.x, c[0];
MAD R0.xy, R0.x, c[6].x, fragment.texcoord[0];
TEX R0.yw, R0, texture[0], 2D;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.z;
MAD R3.xy, R0.wyzw, c[10].w, -c[10].x;
MAD R1.w, fragment.texcoord[3].z, -R0.x, c[10].x;
MAD R0.xy, R3, c[7].x, R1;
TEX R0.xyz, R0, texture[1], 2D;
MUL R0.w, R1, c[9].x;
MUL R2.xyz, R0, R0.w;
MOV R0.x, c[2];
MOV R0.z, c[4].x;
MAD R0.zw, R0.z, c[0].x, fragment.texcoord[1].xyxy;
MAD R1.xy, R3, c[7].x, R0.zwzw;
MAD R0.xy, R0.x, c[0].x, fragment.texcoord[0].zwzw;
MAD R0.xy, R3, c[7].x, R0;
TEX R1.xyz, R1, texture[3], 2D;
TEX R0.xyz, R0, texture[2], 2D;
MAD R0.xyz, R0, R1, R2;
MAD R1.xy, R3, c[7].x, R0;
MOV R1.z, R0;
TEX R0, fragment.texcoord[4], texture[6], 2D;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, R1, c[1];
MUL R0.xyz, R0, R1;
MUL R0.w, R1, c[11].z;
MAD result.color.xyz, R0, c[11].y, R2;
ADD result.color.w, R0, c[8].x;
END
# 37 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_Time]
Vector 1 [_Color]
Float 2 [_MainTexSpeed]
Float 3 [_Texture2Speed]
Float 4 [_DistortionSpeed]
Float 5 [_DistortionPower]
Float 6 [_Opacity]
Float 7 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 6 [unity_Lightmap] 2D
"ps_3_0
; 32 ALU, 5 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s6
def c8, 2.00000000, -1.00000000, 1.00000000, 10.00000000
def c9, 0.00000000, 0.50000000, 8.00000000, 0.80000001
dcl_texcoord0 v0
dcl_texcoord1 v1.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xy
mul r0.xyz, v3, c8.zzww
mov r0.w, c9.x
dp4 r0.x, r0, r0
rsq r0.x, r0.x
mad r0.y, r0.x, v3.x, c8.z
mul r0.z, r0.y, c9.y
mad r0.y, r0.x, v3, c8.z
mul r0.w, r0.y, c9.y
mov r0.x, c4
mad r0.xy, c0.x, r0.x, v0
texld r1.yw, r0, s0
dp3 r1.x, v3, v3
mad_pp r3.xy, r1.wyzw, c8.x, c8.y
rsq r0.x, r1.x
mad r1.w, v3.z, -r0.x, c8.z
mad r0.xy, r3, c5.x, r0.zwzw
texld r0.xyz, r0, s1
mul r0.w, r1, c7.x
mul r2.xyz, r0, r0.w
mov r0.x, c0
mov r0.z, c0.x
mad r0.zw, c3.x, r0.z, v1.xyxy
mad r1.xy, r3, c5.x, r0.zwzw
mad r0.xy, c2.x, r0.x, v0.zwzw
mad r0.xy, r3, c5.x, r0
texld r1.xyz, r1, s3
texld r0.xyz, r0, s2
mad r0.xyz, r0, r1, r2
mad r1.xy, r3, c5.x, r0
mov r1.z, r0
texld r0, v4, s6
mul_pp r0.xyz, r0.w, r0
mul r1.xyz, r1, c1
mul_pp r0.xyz, r0, r1
mul r0.w, r1, c9
mad_pp oC0.xyz, r0, c9.z, r2
add oC0.w, r0, c6.x
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_MainTexSpeed]
Float 4 [_Bump1Speed]
Float 5 [_Texture2Speed]
Float 6 [_Bump2Speed]
Float 7 [_DistortionSpeed]
Float 8 [_DistortionPower]
Float 9 [_Specular]
Float 10 [_Gloss]
Float 11 [_Opacity]
Float 12 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 4 [_BumpMap1] 2D
SetTexture 5 [_BumpMap2] 2D
SetTexture 6 [_ShadowMapTexture] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 76 ALU, 7 TEX
PARAM c[16] = { program.local[0..12],
		{ 1, 10, 0, 2 },
		{ 0.5, 128, 0.80000001 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MOV R0.y, c[4].x;
MOV R0.z, c[6].x;
MAD R1.xy, R0.y, c[0].x, fragment.texcoord[1].zwzw;
MOV R0.x, c[0];
MAD R0.xy, R0.x, c[7].x, fragment.texcoord[0];
TEX R0.yw, R0, texture[0], 2D;
MAD R4.xy, R0.wyzw, c[13].w, -c[13].x;
MAD R1.zw, R0.z, c[0].x, fragment.texcoord[2].xyxy;
MAD R0.zw, R4.xyxy, c[8].x, R1;
MAD R0.xy, R4, c[8].x, R1;
TEX R1.yw, R0.zwzw, texture[5], 2D;
TEX R0.yw, R0, texture[4], 2D;
ADD R0.xy, R0.ywzw, R1.ywzw;
ADD R1.xy, R0.yxzw, -c[13].x;
MUL R0.x, R1.y, R1.y;
MAD R0.x, -R1, R1, -R0;
ADD R0.x, R0, c[13];
RSQ R0.x, R0.x;
RCP R1.z, R0.x;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.w, R0.w;
MOV R0.xyz, fragment.texcoord[4];
MAD R0.xyz, fragment.texcoord[3], R0.w, R0;
DP3 R0.w, R1, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
RSQ R1.w, R1.w;
MUL R0.xyz, R1.w, R0;
DP3 R0.w, R1, fragment.texcoord[4];
DP3 R0.x, R1, R0;
MAX R1.y, R0.w, c[13].z;
MAX R1.x, R0, c[13].z;
MOV R0.xyz, c[15];
MOV R0.w, c[14].y;
DP3 R0.y, R0, c[1];
MUL R0.w, R0, c[10].x;
POW R0.x, R1.x, R0.w;
MUL R0.w, R0.x, R0.y;
MUL R0.xyz, R1.y, c[1];
MUL R1.xyz, fragment.texcoord[3], c[13].xxyw;
MOV R1.w, c[13].z;
DP4 R1.y, R1, R1;
TXP R1.x, fragment.texcoord[6], texture[6], 2D;
MUL R0, R1.x, R0;
MUL R3, R0, c[13].w;
RSQ R1.x, R1.y;
MAD R0.x, R1, fragment.texcoord[3], c[13];
MAD R0.y, R1.x, fragment.texcoord[3], c[13].x;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.z, R0.z;
MAD R0.w, fragment.texcoord[3].z, -R0.z, c[13].x;
MUL R1.x, R0.w, c[12];
MUL R0.w, R0, c[14].z;
MUL R1.w, R3, c[9].x;
MUL R0.x, R0, c[14];
MUL R0.y, R0, c[14].x;
MAD R0.xy, R4, c[8].x, R0;
TEX R0.xyz, R0, texture[1], 2D;
MUL R2.xyz, R0, R1.x;
MOV R0.z, c[5].x;
MAD R1.xy, R0.z, c[0].x, fragment.texcoord[1];
MOV R0.x, c[3];
MAD R0.xy, R0.x, c[0].x, fragment.texcoord[0].zwzw;
MAD R0.xy, R4, c[8].x, R0;
MAD R1.xy, R4, c[8].x, R1;
TEX R1.xyz, R1, texture[3], 2D;
TEX R0.xyz, R0, texture[2], 2D;
MAD R0.xyz, R0, R1, R2;
MAD R0.xy, R4, c[8].x, R0;
MUL R0.xyz, R0, c[2];
MUL R1.xyz, R3, R1.w;
MAD R1.xyz, R0, R3, R1;
MAD R0.xyz, R0, fragment.texcoord[5], R1;
ADD result.color.xyz, R0, R2;
ADD result.color.w, R0, c[11].x;
END
# 76 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_MainTexSpeed]
Float 4 [_Bump1Speed]
Float 5 [_Texture2Speed]
Float 6 [_Bump2Speed]
Float 7 [_DistortionSpeed]
Float 8 [_DistortionPower]
Float 9 [_Specular]
Float 10 [_Gloss]
Float 11 [_Opacity]
Float 12 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 4 [_BumpMap1] 2D
SetTexture 5 [_BumpMap2] 2D
SetTexture 6 [_ShadowMapTexture] 2D
"ps_3_0
; 71 ALU, 7 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c13, 2.00000000, -1.00000000, 1.00000000, 10.00000000
def c14, 0.00000000, 0.50000000, 128.00000000, 0.80000001
def c15, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6
mov r0.y, c0.x
mad r0.zw, c4.x, r0.y, v1
mov r0.x, c7
mad r0.xy, c0.x, r0.x, v0
texld r1.yw, r0, s0
mov r1.x, c0
mad_pp r4.xy, r1.wyzw, c13.x, c13.y
mad r0.xy, c6.x, r1.x, v2
mad r1.xy, r4, c8.x, r0
mad r0.xy, r4, c8.x, r0.zwzw
texld r1.yw, r1, s5
texld r0.yw, r0, s4
add_pp r0.xy, r0.ywzw, r1.ywzw
add_pp r0.xy, r0.yxzw, c13.y
mul_pp r0.z, r0.y, r0.y
mad_pp r0.z, -r0.x, r0.x, -r0
add_pp r0.z, r0, c13
rsq_pp r0.z, r0.z
rcp_pp r0.z, r0.z
dp3_pp r0.w, r0, r0
rsq_pp r0.w, r0.w
dp3_pp r1.w, v3, v3
mul_pp r0.xyz, r0.w, r0
rsq_pp r1.w, r1.w
mov_pp r1.xyz, v4
mad_pp r1.xyz, v3, r1.w, r1
dp3_pp r1.w, r0, v4
dp3_pp r0.w, r1, r1
rsq_pp r0.w, r0.w
mul_pp r1.xyz, r0.w, r1
dp3_pp r0.x, r0, r1
mov_pp r0.w, c10.x
mul_pp r1.y, c14.z, r0.w
max_pp r1.x, r0, c14
pow r0, r1.x, r1.y
mov_pp r1.xyz, c1
dp3_pp r0.y, c15, r1
mul r1.xyz, v3, c13.zzww
max_pp r1.w, r1, c14.x
mul r0.w, r0.x, r0.y
mul_pp r0.xyz, r1.w, c1
mov r1.w, c14.x
dp4 r1.y, r1, r1
texldp r1.x, v6, s6
mul_pp r0, r1.x, r0
mul_pp r3, r0, c13.x
rsq r1.x, r1.y
mad r0.x, r1, v3, c13.z
mad r0.y, r1.x, v3, c13.z
dp3 r0.z, v3, v3
rsq r0.z, r0.z
mad r0.w, v3.z, -r0.z, c13.z
mul r1.x, r0.w, c12
mul r0.w, r0, c14
mul_pp r1.w, r3, c9.x
mul r0.x, r0, c14.y
mul r0.y, r0, c14
mad r0.xy, r4, c8.x, r0
texld r0.xyz, r0, s1
mul r2.xyz, r0, r1.x
mov r0.z, c0.x
mad r1.xy, c5.x, r0.z, v1
mov r0.x, c0
mad r0.xy, c3.x, r0.x, v0.zwzw
mad r0.xy, r4, c8.x, r0
mad r1.xy, r4, c8.x, r1
texld r1.xyz, r1, s3
texld r0.xyz, r0, s2
mad r0.xyz, r0, r1, r2
mad r0.xy, r4, c8.x, r0
mul r0.xyz, r0, c2
mul_pp r1.xyz, r3, r1.w
mad_pp r1.xyz, r0, r3, r1
mad_pp r0.xyz, r0, v5, r1
add_pp oC0.xyz, r0, r2
add oC0.w, r0, c11.x
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_Time]
Vector 1 [_Color]
Float 2 [_MainTexSpeed]
Float 4 [_Texture2Speed]
Float 6 [_DistortionSpeed]
Float 7 [_DistortionPower]
Float 8 [_Opacity]
Float 9 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 6 [_ShadowMapTexture] 2D
SetTexture 7 [unity_Lightmap] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 42 ALU, 6 TEX
PARAM c[12] = { program.local[0..9],
		{ 1, 10, 0, 2 },
		{ 0.5, 8, 0.80000001 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R0.xyz, fragment.texcoord[3], c[10].xxyw;
MOV R0.w, c[10].z;
DP4 R0.x, R0, R0;
RSQ R0.x, R0.x;
MAD R0.y, R0.x, fragment.texcoord[3].x, c[10].x;
MUL R1.x, R0.y, c[11];
MAD R0.y, R0.x, fragment.texcoord[3], c[10].x;
MUL R1.y, R0, c[11].x;
MOV R0.x, c[0];
MAD R0.xy, R0.x, c[6].x, fragment.texcoord[0];
TEX R0.yw, R0, texture[0], 2D;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.z;
MAD R3.xy, R0.wyzw, c[10].w, -c[10].x;
MAD R1.w, fragment.texcoord[3].z, -R0.x, c[10].x;
MAD R0.xy, R3, c[7].x, R1;
TEX R0.xyz, R0, texture[1], 2D;
MUL R0.w, R1, c[9].x;
MUL R1.xyz, R0, R0.w;
MOV R0.x, c[2];
MOV R0.z, c[4].x;
MAD R0.zw, R0.z, c[0].x, fragment.texcoord[1].xyxy;
MAD R2.xy, R3, c[7].x, R0.zwzw;
MAD R0.xy, R0.x, c[0].x, fragment.texcoord[0].zwzw;
MAD R0.xy, R3, c[7].x, R0;
TEX R2.xyz, R2, texture[3], 2D;
TEX R0.xyz, R0, texture[2], 2D;
MAD R0.xyz, R0, R2, R1;
MAD R0.xy, R3, c[7].x, R0;
MUL R2.xyz, R0, c[1];
TEX R0, fragment.texcoord[4], texture[7], 2D;
MUL R3.xyz, R0.w, R0;
TXP R4.x, fragment.texcoord[5], texture[6], 2D;
MUL R0.xyz, R0, R4.x;
MUL R3.xyz, R3, c[11].y;
MUL R0.xyz, R0, c[10].w;
MUL R0.w, R1, c[11].z;
MUL R4.xyz, R3, R4.x;
MIN R0.xyz, R3, R0;
MAX R0.xyz, R0, R4;
MAD result.color.xyz, R2, R0, R1;
ADD result.color.w, R0, c[8].x;
END
# 42 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_Time]
Vector 1 [_Color]
Float 2 [_MainTexSpeed]
Float 3 [_Texture2Speed]
Float 4 [_DistortionSpeed]
Float 5 [_DistortionPower]
Float 6 [_Opacity]
Float 7 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 6 [_ShadowMapTexture] 2D
SetTexture 7 [unity_Lightmap] 2D
"ps_3_0
; 36 ALU, 6 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s6
dcl_2d s7
def c8, 2.00000000, -1.00000000, 1.00000000, 10.00000000
def c9, 0.00000000, 0.50000000, 8.00000000, 0.80000001
dcl_texcoord0 v0
dcl_texcoord1 v1.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xy
dcl_texcoord5 v5
mul r0.xyz, v3, c8.zzww
mov r0.w, c9.x
dp4 r0.x, r0, r0
rsq r0.x, r0.x
mad r0.y, r0.x, v3.x, c8.z
mul r1.x, r0.y, c9.y
mad r0.y, r0.x, v3, c8.z
mul r1.y, r0, c9
mov r0.x, c4
mad r0.xy, c0.x, r0.x, v0
texld r0.yw, r0, s0
dp3 r0.z, v3, v3
rsq r0.x, r0.z
mad_pp r3.xy, r0.wyzw, c8.x, c8.y
mad r1.w, v3.z, -r0.x, c8.z
mad r0.xy, r3, c5.x, r1
texld r0.xyz, r0, s1
mul r0.w, r1, c7.x
mul r1.xyz, r0, r0.w
mov r0.x, c0
mov r0.z, c0.x
mad r0.zw, c3.x, r0.z, v1.xyxy
mad r2.xy, r3, c5.x, r0.zwzw
mad r0.xy, c2.x, r0.x, v0.zwzw
mad r0.xy, r3, c5.x, r0
texld r2.xyz, r2, s3
texld r0.xyz, r0, s2
mad r0.xyz, r0, r2, r1
mad r0.xy, r3, c5.x, r0
mul r2.xyz, r0, c1
texld r0, v4, s7
mul_pp r3.xyz, r0.w, r0
texldp r4.x, v5, s6
mul_pp r0.xyz, r0, r4.x
mul_pp r3.xyz, r3, c9.z
mul_pp r0.xyz, r0, c8.x
mul r0.w, r1, c9
mul_pp r4.xyz, r3, r4.x
min_pp r0.xyz, r3, r0
max_pp r0.xyz, r0, r4
mad_pp oC0.xyz, r2, r0, r1
add oC0.w, r0, c6.x
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES"
}

}
	}
	Pass {
		Name "FORWARD"
		Tags { "LightMode" = "ForwardAdd" }
		ZWrite Off Blend One One Fog { Color (0,0,0,0) }
Program "vp" {
// Vertex combos: 5
//   opengl - ALU: 29 to 38
//   d3d9 - ALU: 32 to 41
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_DistortionMap_ST]
Vector 21 [_Texture1_ST]
Vector 22 [_Texture2_ST]
Vector 23 [_BumpMap1_ST]
Vector 24 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 37 ALU
PARAM c[25] = { { 1 },
		state.matrix.mvp,
		program.local[5..24] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1, c[19];
MOV R0.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R2.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[18];
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[17].w, -vertex.position;
DP3 result.texcoord[3].y, R0, R1;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[23].xyxy, c[23];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[24], c[24].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 37 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_DistortionMap_ST]
Vector 20 [_Texture1_ST]
Vector 21 [_Texture2_ST]
Vector 22 [_BumpMap1_ST]
Vector 23 [_BumpMap2_ST]
"vs_3_0
; 40 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c24, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r1.xyz, v1
mov r0, c10
dp4 r3.z, c18, r0
mov r0, c9
dp4 r3.y, c18, r0
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r3.x, c18, r1
mad r0.xyz, r3, c16.w, -v0
mul r2.xyz, r2, v1.w
mov r1.xyz, c17
mov r1.w, c24.x
dp3 o5.y, r2, r0
dp3 o5.z, v2, r0
dp3 o5.x, v1, r0
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r3.z, r1, c10
dp4 r3.x, r1, c8
dp4 r3.y, r1, c9
mad r1.xyz, r3, c16.w, -v0
dp3 o4.y, r1, r2
dp3 o4.z, v2, r1
dp3 o4.x, r1, v1
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
mad o1.zw, v3.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
mad o2.zw, v3.xyxy, c22.xyxy, c22
mad o2.xy, v3, c21, c21.zwzw
mad o3.xy, v3, c23, c23.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = tmpvar_1.xyz;
  tmpvar_6[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_6[2] = tmpvar_2;
  mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_6[0].x;
  tmpvar_7[0].y = tmpvar_6[1].x;
  tmpvar_7[0].z = tmpvar_6[2].x;
  tmpvar_7[1].x = tmpvar_6[0].y;
  tmpvar_7[1].y = tmpvar_6[1].y;
  tmpvar_7[1].z = tmpvar_6[2].y;
  tmpvar_7[2].x = tmpvar_6[0].z;
  tmpvar_7[2].y = tmpvar_6[1].z;
  tmpvar_7[2].z = tmpvar_6[2].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_7 * (((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump float tmpvar_4;
  mediump float tmpvar_5;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 0.0;
  tmpvar_6.x = xlv_TEXCOORD3.x;
  tmpvar_6.y = xlv_TEXCOORD3.y;
  tmpvar_6.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_7;
  tmpvar_7 = normalize (tmpvar_6);
  highp vec2 tmpvar_8;
  tmpvar_8.x = ((tmpvar_7.x + 1.0) * 0.5);
  tmpvar_8.y = ((tmpvar_7.y + 1.0) * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = ((texture2D (_DistortionMap, tmpvar_9).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_10;
  highp vec2 tmpvar_11;
  tmpvar_11 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Reflection, (tmpvar_8 + tmpvar_11));
  Tex2D2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = xlv_TEXCOORD3.x;
  tmpvar_13.y = xlv_TEXCOORD3.y;
  tmpvar_13.z = xlv_TEXCOORD3.z;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - dot (normalize (tmpvar_13), vec3(0.0, 0.0, 1.0)));
  highp vec2 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Texture1, (tmpvar_15 + tmpvar_11));
  Tex2D0 = tmpvar_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture2, (tmpvar_17 + tmpvar_11));
  Tex2D1 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = ((Tex2D2 * (_ReflectPower * tmpvar_14)) + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_19;
  TexNReflex.xy = (tmpvar_19.xy + tmpvar_11);
  highp vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_BumpMap1, (tmpvar_20 + tmpvar_11));
  Tex2D3 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_22;
  highp vec2 tmpvar_23;
  tmpvar_23 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_BumpMap2, (Bump2UV + tmpvar_11));
  mediump vec4 tmpvar_25;
  tmpvar_25 = ((Tex2D3 + tmpvar_24) / 2.0);
  AvgBump = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_14 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = tmpvar_26.xyz;
  tmpvar_2 = tmpvar_30;
  tmpvar_4 = _Gloss;
  lowp vec3 tmpvar_31;
  tmpvar_31 = vec3(_Specular);
  tmpvar_3 = tmpvar_31;
  tmpvar_5 = FinalAlpha;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = normalize (xlv_TEXCOORD4);
  lightDir = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = normalize (xlv_TEXCOORD3);
  highp vec2 tmpvar_35;
  tmpvar_35 = vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_LightTexture0, tmpvar_35);
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump vec3 viewDir;
  viewDir = tmpvar_34;
  mediump float atten;
  atten = tmpvar_36.w;
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, dot (tmpvar_32, normalize ((lightDir_i0 + viewDir))));
  nh = tmpvar_37;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir_i0, tmpvar_32)));
  lowp float tmpvar_38;
  tmpvar_38 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_39;
  tmpvar_39 = (pow (nh, (tmpvar_4 * 128.0)) * tmpvar_38);
  res.w = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40 = (res * (atten * 2.0));
  res = tmpvar_40;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_40.xyz) + (tmpvar_40.xyz * (tmpvar_40.w * tmpvar_3)));
  c_i0.w = tmpvar_5;
  c = c_i0;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "POINT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = tmpvar_1.xyz;
  tmpvar_6[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_6[2] = tmpvar_2;
  mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_6[0].x;
  tmpvar_7[0].y = tmpvar_6[1].x;
  tmpvar_7[0].z = tmpvar_6[2].x;
  tmpvar_7[1].x = tmpvar_6[0].y;
  tmpvar_7[1].y = tmpvar_6[1].y;
  tmpvar_7[1].z = tmpvar_6[2].y;
  tmpvar_7[2].x = tmpvar_6[0].z;
  tmpvar_7[2].y = tmpvar_6[1].z;
  tmpvar_7[2].z = tmpvar_6[2].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_7 * (((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump float tmpvar_4;
  mediump float tmpvar_5;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 0.0;
  tmpvar_6.x = xlv_TEXCOORD3.x;
  tmpvar_6.y = xlv_TEXCOORD3.y;
  tmpvar_6.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_7;
  tmpvar_7 = normalize (tmpvar_6);
  highp vec2 tmpvar_8;
  tmpvar_8.x = ((tmpvar_7.x + 1.0) * 0.5);
  tmpvar_8.y = ((tmpvar_7.y + 1.0) * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_9).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = normal;
  DistortNormal = tmpvar_10;
  highp vec2 tmpvar_11;
  tmpvar_11 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Reflection, (tmpvar_8 + tmpvar_11));
  Tex2D2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = xlv_TEXCOORD3.x;
  tmpvar_13.y = xlv_TEXCOORD3.y;
  tmpvar_13.z = xlv_TEXCOORD3.z;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - dot (normalize (tmpvar_13), vec3(0.0, 0.0, 1.0)));
  highp vec2 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Texture1, (tmpvar_15 + tmpvar_11));
  Tex2D0 = tmpvar_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture2, (tmpvar_17 + tmpvar_11));
  Tex2D1 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = ((Tex2D2 * (_ReflectPower * tmpvar_14)) + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_19;
  TexNReflex.xy = (tmpvar_19.xy + tmpvar_11);
  highp vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_BumpMap1, (tmpvar_20 + tmpvar_11));
  Tex2D3 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_22;
  highp vec2 tmpvar_23;
  tmpvar_23 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_BumpMap2, (Bump2UV + tmpvar_11));
  mediump vec4 tmpvar_25;
  tmpvar_25 = ((Tex2D3 + tmpvar_24) / 2.0);
  AvgBump = tmpvar_25;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = normal_i0;
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_14 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = tmpvar_26.xyz;
  tmpvar_2 = tmpvar_30;
  tmpvar_4 = _Gloss;
  lowp vec3 tmpvar_31;
  tmpvar_31 = vec3(_Specular);
  tmpvar_3 = tmpvar_31;
  tmpvar_5 = FinalAlpha;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = normalize (xlv_TEXCOORD4);
  lightDir = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = normalize (xlv_TEXCOORD3);
  highp vec2 tmpvar_35;
  tmpvar_35 = vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_LightTexture0, tmpvar_35);
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump vec3 viewDir;
  viewDir = tmpvar_34;
  mediump float atten;
  atten = tmpvar_36.w;
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_37;
  tmpvar_37 = max (0.0, dot (tmpvar_32, normalize ((lightDir_i0 + viewDir))));
  nh = tmpvar_37;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir_i0, tmpvar_32)));
  lowp float tmpvar_38;
  tmpvar_38 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_39;
  tmpvar_39 = (pow (nh, (tmpvar_4 * 128.0)) * tmpvar_38);
  res.w = tmpvar_39;
  mediump vec4 tmpvar_40;
  tmpvar_40 = (res * (atten * 2.0));
  res = tmpvar_40;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_40.xyz) + (tmpvar_40.xyz * (tmpvar_40.w * tmpvar_3)));
  c_i0.w = tmpvar_5;
  c = c_i0;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 9 [unity_Scale]
Vector 10 [_WorldSpaceCameraPos]
Vector 11 [_WorldSpaceLightPos0]
Matrix 5 [_World2Object]
Vector 12 [_DistortionMap_ST]
Vector 13 [_Texture1_ST]
Vector 14 [_Texture2_ST]
Vector 15 [_BumpMap1_ST]
Vector 16 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 29 ALU
PARAM c[17] = { { 1 },
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0.xyz, c[10];
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[7];
DP4 R2.x, R0, c[5];
DP4 R2.y, R0, c[6];
MAD R0.xyz, R2, c[9].w, -vertex.position;
MUL R2.xyz, R1, vertex.attrib[14].w;
MOV R1, c[11];
DP4 R3.z, R1, c[7];
DP4 R3.x, R1, c[5];
DP4 R3.y, R1, c[6];
DP3 result.texcoord[3].y, R0, R2;
DP3 result.texcoord[4].y, R2, R3;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[13].xyxy, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[12], c[12].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[15].xyxy, c[15];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[14], c[14].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[16], c[16].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 29 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 8 [unity_Scale]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_WorldSpaceLightPos0]
Matrix 4 [_World2Object]
Vector 11 [_DistortionMap_ST]
Vector 12 [_Texture1_ST]
Vector 13 [_Texture2_ST]
Vector 14 [_BumpMap1_ST]
Vector 15 [_BumpMap2_ST]
"vs_3_0
; 32 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
def c16, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r3.xyz, r0, v1.w
mov r0, c6
dp4 r4.z, c10, r0
mov r0, c5
mov r1.w, c16.x
mov r1.xyz, c9
dp4 r4.y, c10, r0
dp4 r2.z, r1, c6
dp4 r2.x, r1, c4
dp4 r2.y, r1, c5
mad r2.xyz, r2, c8.w, -v0
mov r1, c4
dp4 r4.x, c10, r1
dp3 o4.y, r2, r3
dp3 o5.y, r3, r4
dp3 o4.z, v2, r2
dp3 o4.x, r2, v1
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
mad o1.zw, v3.xyxy, c12.xyxy, c12
mad o1.xy, v3, c11, c11.zwzw
mad o2.zw, v3.xyxy, c14.xyxy, c14
mad o2.xy, v3, c13, c13.zwzw
mad o3.xy, v3, c15, c15.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = tmpvar_1.xyz;
  tmpvar_6[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_6[2] = tmpvar_2;
  mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_6[0].x;
  tmpvar_7[0].y = tmpvar_6[1].x;
  tmpvar_7[0].z = tmpvar_6[2].x;
  tmpvar_7[1].x = tmpvar_6[0].y;
  tmpvar_7[1].y = tmpvar_6[1].y;
  tmpvar_7[1].z = tmpvar_6[2].y;
  tmpvar_7[2].x = tmpvar_6[0].z;
  tmpvar_7[2].y = tmpvar_6[1].z;
  tmpvar_7[2].z = tmpvar_6[2].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_7 * (((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump float tmpvar_4;
  mediump float tmpvar_5;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 0.0;
  tmpvar_6.x = xlv_TEXCOORD3.x;
  tmpvar_6.y = xlv_TEXCOORD3.y;
  tmpvar_6.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_7;
  tmpvar_7 = normalize (tmpvar_6);
  highp vec2 tmpvar_8;
  tmpvar_8.x = ((tmpvar_7.x + 1.0) * 0.5);
  tmpvar_8.y = ((tmpvar_7.y + 1.0) * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = ((texture2D (_DistortionMap, tmpvar_9).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_10;
  highp vec2 tmpvar_11;
  tmpvar_11 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Reflection, (tmpvar_8 + tmpvar_11));
  Tex2D2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = xlv_TEXCOORD3.x;
  tmpvar_13.y = xlv_TEXCOORD3.y;
  tmpvar_13.z = xlv_TEXCOORD3.z;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - dot (normalize (tmpvar_13), vec3(0.0, 0.0, 1.0)));
  highp vec2 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Texture1, (tmpvar_15 + tmpvar_11));
  Tex2D0 = tmpvar_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture2, (tmpvar_17 + tmpvar_11));
  Tex2D1 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = ((Tex2D2 * (_ReflectPower * tmpvar_14)) + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_19;
  TexNReflex.xy = (tmpvar_19.xy + tmpvar_11);
  highp vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_BumpMap1, (tmpvar_20 + tmpvar_11));
  Tex2D3 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_22;
  highp vec2 tmpvar_23;
  tmpvar_23 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_BumpMap2, (Bump2UV + tmpvar_11));
  mediump vec4 tmpvar_25;
  tmpvar_25 = ((Tex2D3 + tmpvar_24) / 2.0);
  AvgBump = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_14 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = tmpvar_26.xyz;
  tmpvar_2 = tmpvar_30;
  tmpvar_4 = _Gloss;
  lowp vec3 tmpvar_31;
  tmpvar_31 = vec3(_Specular);
  tmpvar_3 = tmpvar_31;
  tmpvar_5 = FinalAlpha;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_32;
  lightDir = xlv_TEXCOORD4;
  highp vec3 tmpvar_33;
  tmpvar_33 = normalize (xlv_TEXCOORD3);
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump vec3 viewDir;
  viewDir = tmpvar_33;
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_34;
  tmpvar_34 = max (0.0, dot (tmpvar_32, normalize ((lightDir_i0 + viewDir))));
  nh = tmpvar_34;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir_i0, tmpvar_32)));
  lowp float tmpvar_35;
  tmpvar_35 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_36;
  tmpvar_36 = (pow (nh, (tmpvar_4 * 128.0)) * tmpvar_35);
  res.w = tmpvar_36;
  mediump vec4 tmpvar_37;
  tmpvar_37 = (res * 2.0);
  res = tmpvar_37;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_37.xyz) + (tmpvar_37.xyz * (tmpvar_37.w * tmpvar_3)));
  c_i0.w = tmpvar_5;
  c = c_i0;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = tmpvar_1.xyz;
  tmpvar_6[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_6[2] = tmpvar_2;
  mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_6[0].x;
  tmpvar_7[0].y = tmpvar_6[1].x;
  tmpvar_7[0].z = tmpvar_6[2].x;
  tmpvar_7[1].x = tmpvar_6[0].y;
  tmpvar_7[1].y = tmpvar_6[1].y;
  tmpvar_7[1].z = tmpvar_6[2].y;
  tmpvar_7[2].x = tmpvar_6[0].z;
  tmpvar_7[2].y = tmpvar_6[1].z;
  tmpvar_7[2].z = tmpvar_6[2].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_7 * (((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump float tmpvar_4;
  mediump float tmpvar_5;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 0.0;
  tmpvar_6.x = xlv_TEXCOORD3.x;
  tmpvar_6.y = xlv_TEXCOORD3.y;
  tmpvar_6.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_7;
  tmpvar_7 = normalize (tmpvar_6);
  highp vec2 tmpvar_8;
  tmpvar_8.x = ((tmpvar_7.x + 1.0) * 0.5);
  tmpvar_8.y = ((tmpvar_7.y + 1.0) * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_9).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = normal;
  DistortNormal = tmpvar_10;
  highp vec2 tmpvar_11;
  tmpvar_11 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Reflection, (tmpvar_8 + tmpvar_11));
  Tex2D2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = xlv_TEXCOORD3.x;
  tmpvar_13.y = xlv_TEXCOORD3.y;
  tmpvar_13.z = xlv_TEXCOORD3.z;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - dot (normalize (tmpvar_13), vec3(0.0, 0.0, 1.0)));
  highp vec2 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Texture1, (tmpvar_15 + tmpvar_11));
  Tex2D0 = tmpvar_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture2, (tmpvar_17 + tmpvar_11));
  Tex2D1 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = ((Tex2D2 * (_ReflectPower * tmpvar_14)) + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_19;
  TexNReflex.xy = (tmpvar_19.xy + tmpvar_11);
  highp vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_BumpMap1, (tmpvar_20 + tmpvar_11));
  Tex2D3 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_22;
  highp vec2 tmpvar_23;
  tmpvar_23 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_BumpMap2, (Bump2UV + tmpvar_11));
  mediump vec4 tmpvar_25;
  tmpvar_25 = ((Tex2D3 + tmpvar_24) / 2.0);
  AvgBump = tmpvar_25;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = normal_i0;
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_14 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = tmpvar_26.xyz;
  tmpvar_2 = tmpvar_30;
  tmpvar_4 = _Gloss;
  lowp vec3 tmpvar_31;
  tmpvar_31 = vec3(_Specular);
  tmpvar_3 = tmpvar_31;
  tmpvar_5 = FinalAlpha;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_32;
  lightDir = xlv_TEXCOORD4;
  highp vec3 tmpvar_33;
  tmpvar_33 = normalize (xlv_TEXCOORD3);
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump vec3 viewDir;
  viewDir = tmpvar_33;
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_34;
  tmpvar_34 = max (0.0, dot (tmpvar_32, normalize ((lightDir_i0 + viewDir))));
  nh = tmpvar_34;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir_i0, tmpvar_32)));
  lowp float tmpvar_35;
  tmpvar_35 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_36;
  tmpvar_36 = (pow (nh, (tmpvar_4 * 128.0)) * tmpvar_35);
  res.w = tmpvar_36;
  mediump vec4 tmpvar_37;
  tmpvar_37 = (res * 2.0);
  res = tmpvar_37;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_37.xyz) + (tmpvar_37.xyz * (tmpvar_37.w * tmpvar_3)));
  c_i0.w = tmpvar_5;
  c = c_i0;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_DistortionMap_ST]
Vector 21 [_Texture1_ST]
Vector 22 [_Texture2_ST]
Vector 23 [_BumpMap1_ST]
Vector 24 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 38 ALU
PARAM c[25] = { { 1 },
		state.matrix.mvp,
		program.local[5..24] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1, c[19];
MOV R0.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R2.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[18];
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[17].w, -vertex.position;
DP4 R0.w, vertex.position, c[8];
DP3 result.texcoord[3].y, R0, R1;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
DP4 result.texcoord[5].w, R0, c[16];
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[23].xyxy, c[23];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[24], c[24].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 38 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_DistortionMap_ST]
Vector 20 [_Texture1_ST]
Vector 21 [_Texture2_ST]
Vector 22 [_BumpMap1_ST]
Vector 23 [_BumpMap2_ST]
"vs_3_0
; 41 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c24, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r1.xyz, v1
mov r0, c10
dp4 r3.z, c18, r0
mov r0, c9
dp4 r3.y, c18, r0
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r3.x, c18, r1
mad r0.xyz, r3, c16.w, -v0
mul r2.xyz, r2, v1.w
mov r1.xyz, c17
mov r1.w, c24.x
dp4 r0.w, v0, c7
dp3 o5.y, r2, r0
dp3 o5.z, v2, r0
dp3 o5.x, v1, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r3.z, r1, c10
dp4 r3.x, r1, c8
dp4 r3.y, r1, c9
mad r1.xyz, r3, c16.w, -v0
dp3 o4.y, r1, r2
dp3 o4.z, v2, r1
dp3 o4.x, r1, v1
dp4 o6.w, r0, c15
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
mad o1.zw, v3.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
mad o2.zw, v3.xyxy, c22.xyxy, c22
mad o2.xy, v3, c21, c21.zwzw
mad o3.xy, v3, c23, c23.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = tmpvar_1.xyz;
  tmpvar_6[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_6[2] = tmpvar_2;
  mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_6[0].x;
  tmpvar_7[0].y = tmpvar_6[1].x;
  tmpvar_7[0].z = tmpvar_6[2].x;
  tmpvar_7[1].x = tmpvar_6[0].y;
  tmpvar_7[1].y = tmpvar_6[1].y;
  tmpvar_7[1].z = tmpvar_6[2].y;
  tmpvar_7[2].x = tmpvar_6[0].z;
  tmpvar_7[2].y = tmpvar_6[1].z;
  tmpvar_7[2].z = tmpvar_6[2].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_7 * (((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump float tmpvar_4;
  mediump float tmpvar_5;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 0.0;
  tmpvar_6.x = xlv_TEXCOORD3.x;
  tmpvar_6.y = xlv_TEXCOORD3.y;
  tmpvar_6.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_7;
  tmpvar_7 = normalize (tmpvar_6);
  highp vec2 tmpvar_8;
  tmpvar_8.x = ((tmpvar_7.x + 1.0) * 0.5);
  tmpvar_8.y = ((tmpvar_7.y + 1.0) * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = ((texture2D (_DistortionMap, tmpvar_9).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_10;
  highp vec2 tmpvar_11;
  tmpvar_11 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Reflection, (tmpvar_8 + tmpvar_11));
  Tex2D2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = xlv_TEXCOORD3.x;
  tmpvar_13.y = xlv_TEXCOORD3.y;
  tmpvar_13.z = xlv_TEXCOORD3.z;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - dot (normalize (tmpvar_13), vec3(0.0, 0.0, 1.0)));
  highp vec2 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Texture1, (tmpvar_15 + tmpvar_11));
  Tex2D0 = tmpvar_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture2, (tmpvar_17 + tmpvar_11));
  Tex2D1 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = ((Tex2D2 * (_ReflectPower * tmpvar_14)) + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_19;
  TexNReflex.xy = (tmpvar_19.xy + tmpvar_11);
  highp vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_BumpMap1, (tmpvar_20 + tmpvar_11));
  Tex2D3 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_22;
  highp vec2 tmpvar_23;
  tmpvar_23 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_BumpMap2, (Bump2UV + tmpvar_11));
  mediump vec4 tmpvar_25;
  tmpvar_25 = ((Tex2D3 + tmpvar_24) / 2.0);
  AvgBump = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_14 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = tmpvar_26.xyz;
  tmpvar_2 = tmpvar_30;
  tmpvar_4 = _Gloss;
  lowp vec3 tmpvar_31;
  tmpvar_31 = vec3(_Specular);
  tmpvar_3 = tmpvar_31;
  tmpvar_5 = FinalAlpha;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = normalize (xlv_TEXCOORD4);
  lightDir = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = normalize (xlv_TEXCOORD3);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_LightTexture0, ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5));
  highp vec3 LightCoord_i0;
  LightCoord_i0 = xlv_TEXCOORD5.xyz;
  highp vec2 tmpvar_36;
  tmpvar_36 = vec2(dot (LightCoord_i0, LightCoord_i0));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_LightTextureB0, tmpvar_36);
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump vec3 viewDir;
  viewDir = tmpvar_34;
  mediump float atten;
  atten = ((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_35.w) * tmpvar_37.w);
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_38;
  tmpvar_38 = max (0.0, dot (tmpvar_32, normalize ((lightDir_i0 + viewDir))));
  nh = tmpvar_38;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir_i0, tmpvar_32)));
  lowp float tmpvar_39;
  tmpvar_39 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_40;
  tmpvar_40 = (pow (nh, (tmpvar_4 * 128.0)) * tmpvar_39);
  res.w = tmpvar_40;
  mediump vec4 tmpvar_41;
  tmpvar_41 = (res * (atten * 2.0));
  res = tmpvar_41;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_41.xyz) + (tmpvar_41.xyz * (tmpvar_41.w * tmpvar_3)));
  c_i0.w = tmpvar_5;
  c = c_i0;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "SPOT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = tmpvar_1.xyz;
  tmpvar_6[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_6[2] = tmpvar_2;
  mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_6[0].x;
  tmpvar_7[0].y = tmpvar_6[1].x;
  tmpvar_7[0].z = tmpvar_6[2].x;
  tmpvar_7[1].x = tmpvar_6[0].y;
  tmpvar_7[1].y = tmpvar_6[1].y;
  tmpvar_7[1].z = tmpvar_6[2].y;
  tmpvar_7[2].x = tmpvar_6[0].z;
  tmpvar_7[2].y = tmpvar_6[1].z;
  tmpvar_7[2].z = tmpvar_6[2].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_7 * (((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump float tmpvar_4;
  mediump float tmpvar_5;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 0.0;
  tmpvar_6.x = xlv_TEXCOORD3.x;
  tmpvar_6.y = xlv_TEXCOORD3.y;
  tmpvar_6.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_7;
  tmpvar_7 = normalize (tmpvar_6);
  highp vec2 tmpvar_8;
  tmpvar_8.x = ((tmpvar_7.x + 1.0) * 0.5);
  tmpvar_8.y = ((tmpvar_7.y + 1.0) * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_9).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = normal;
  DistortNormal = tmpvar_10;
  highp vec2 tmpvar_11;
  tmpvar_11 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Reflection, (tmpvar_8 + tmpvar_11));
  Tex2D2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = xlv_TEXCOORD3.x;
  tmpvar_13.y = xlv_TEXCOORD3.y;
  tmpvar_13.z = xlv_TEXCOORD3.z;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - dot (normalize (tmpvar_13), vec3(0.0, 0.0, 1.0)));
  highp vec2 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Texture1, (tmpvar_15 + tmpvar_11));
  Tex2D0 = tmpvar_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture2, (tmpvar_17 + tmpvar_11));
  Tex2D1 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = ((Tex2D2 * (_ReflectPower * tmpvar_14)) + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_19;
  TexNReflex.xy = (tmpvar_19.xy + tmpvar_11);
  highp vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_BumpMap1, (tmpvar_20 + tmpvar_11));
  Tex2D3 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_22;
  highp vec2 tmpvar_23;
  tmpvar_23 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_BumpMap2, (Bump2UV + tmpvar_11));
  mediump vec4 tmpvar_25;
  tmpvar_25 = ((Tex2D3 + tmpvar_24) / 2.0);
  AvgBump = tmpvar_25;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = normal_i0;
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_14 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = tmpvar_26.xyz;
  tmpvar_2 = tmpvar_30;
  tmpvar_4 = _Gloss;
  lowp vec3 tmpvar_31;
  tmpvar_31 = vec3(_Specular);
  tmpvar_3 = tmpvar_31;
  tmpvar_5 = FinalAlpha;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = normalize (xlv_TEXCOORD4);
  lightDir = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = normalize (xlv_TEXCOORD3);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_LightTexture0, ((xlv_TEXCOORD5.xy / xlv_TEXCOORD5.w) + 0.5));
  highp vec3 LightCoord_i0;
  LightCoord_i0 = xlv_TEXCOORD5.xyz;
  highp vec2 tmpvar_36;
  tmpvar_36 = vec2(dot (LightCoord_i0, LightCoord_i0));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_LightTextureB0, tmpvar_36);
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump vec3 viewDir;
  viewDir = tmpvar_34;
  mediump float atten;
  atten = ((float((xlv_TEXCOORD5.z > 0.0)) * tmpvar_35.w) * tmpvar_37.w);
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_38;
  tmpvar_38 = max (0.0, dot (tmpvar_32, normalize ((lightDir_i0 + viewDir))));
  nh = tmpvar_38;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir_i0, tmpvar_32)));
  lowp float tmpvar_39;
  tmpvar_39 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_40;
  tmpvar_40 = (pow (nh, (tmpvar_4 * 128.0)) * tmpvar_39);
  res.w = tmpvar_40;
  mediump vec4 tmpvar_41;
  tmpvar_41 = (res * (atten * 2.0));
  res = tmpvar_41;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_41.xyz) + (tmpvar_41.xyz * (tmpvar_41.w * tmpvar_3)));
  c_i0.w = tmpvar_5;
  c = c_i0;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_DistortionMap_ST]
Vector 21 [_Texture1_ST]
Vector 22 [_Texture2_ST]
Vector 23 [_BumpMap1_ST]
Vector 24 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 37 ALU
PARAM c[25] = { { 1 },
		state.matrix.mvp,
		program.local[5..24] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R2.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R2;
MOV R1, c[19];
MOV R0.w, c[0].x;
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R2.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, R0, vertex.attrib[14].w;
MOV R0.xyz, c[18];
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[17].w, -vertex.position;
DP3 result.texcoord[3].y, R0, R1;
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R1, R2;
DP3 result.texcoord[4].z, vertex.normal, R2;
DP3 result.texcoord[4].x, vertex.attrib[14], R2;
DP4 result.texcoord[5].z, R0, c[15];
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[23].xyxy, c[23];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[24], c[24].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 37 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_DistortionMap_ST]
Vector 20 [_Texture1_ST]
Vector 21 [_Texture2_ST]
Vector 22 [_BumpMap1_ST]
Vector 23 [_BumpMap2_ST]
"vs_3_0
; 40 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c24, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r1.xyz, v1
mov r0, c10
dp4 r3.z, c18, r0
mov r0, c9
dp4 r3.y, c18, r0
mul r2.xyz, v2.zxyw, r1.yzxw
mov r1.xyz, v1
mad r2.xyz, v2.yzxw, r1.zxyw, -r2
mov r1, c8
dp4 r3.x, c18, r1
mad r0.xyz, r3, c16.w, -v0
mul r2.xyz, r2, v1.w
mov r1.xyz, c17
mov r1.w, c24.x
dp3 o5.y, r2, r0
dp3 o5.z, v2, r0
dp3 o5.x, v1, r0
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp4 r3.z, r1, c10
dp4 r3.x, r1, c8
dp4 r3.y, r1, c9
mad r1.xyz, r3, c16.w, -v0
dp3 o4.y, r1, r2
dp3 o4.z, v2, r1
dp3 o4.x, r1, v1
dp4 o6.z, r0, c14
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
mad o1.zw, v3.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
mad o2.zw, v3.xyxy, c22.xyxy, c22
mad o2.xy, v3, c21, c21.zwzw
mad o3.xy, v3, c23, c23.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = tmpvar_1.xyz;
  tmpvar_6[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_6[2] = tmpvar_2;
  mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_6[0].x;
  tmpvar_7[0].y = tmpvar_6[1].x;
  tmpvar_7[0].z = tmpvar_6[2].x;
  tmpvar_7[1].x = tmpvar_6[0].y;
  tmpvar_7[1].y = tmpvar_6[1].y;
  tmpvar_7[1].z = tmpvar_6[2].y;
  tmpvar_7[2].x = tmpvar_6[0].z;
  tmpvar_7[2].y = tmpvar_6[1].z;
  tmpvar_7[2].z = tmpvar_6[2].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_7 * (((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightTextureB0;
uniform samplerCube _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump float tmpvar_4;
  mediump float tmpvar_5;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 0.0;
  tmpvar_6.x = xlv_TEXCOORD3.x;
  tmpvar_6.y = xlv_TEXCOORD3.y;
  tmpvar_6.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_7;
  tmpvar_7 = normalize (tmpvar_6);
  highp vec2 tmpvar_8;
  tmpvar_8.x = ((tmpvar_7.x + 1.0) * 0.5);
  tmpvar_8.y = ((tmpvar_7.y + 1.0) * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = ((texture2D (_DistortionMap, tmpvar_9).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_10;
  highp vec2 tmpvar_11;
  tmpvar_11 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Reflection, (tmpvar_8 + tmpvar_11));
  Tex2D2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = xlv_TEXCOORD3.x;
  tmpvar_13.y = xlv_TEXCOORD3.y;
  tmpvar_13.z = xlv_TEXCOORD3.z;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - dot (normalize (tmpvar_13), vec3(0.0, 0.0, 1.0)));
  highp vec2 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Texture1, (tmpvar_15 + tmpvar_11));
  Tex2D0 = tmpvar_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture2, (tmpvar_17 + tmpvar_11));
  Tex2D1 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = ((Tex2D2 * (_ReflectPower * tmpvar_14)) + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_19;
  TexNReflex.xy = (tmpvar_19.xy + tmpvar_11);
  highp vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_BumpMap1, (tmpvar_20 + tmpvar_11));
  Tex2D3 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_22;
  highp vec2 tmpvar_23;
  tmpvar_23 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_BumpMap2, (Bump2UV + tmpvar_11));
  mediump vec4 tmpvar_25;
  tmpvar_25 = ((Tex2D3 + tmpvar_24) / 2.0);
  AvgBump = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_14 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = tmpvar_26.xyz;
  tmpvar_2 = tmpvar_30;
  tmpvar_4 = _Gloss;
  lowp vec3 tmpvar_31;
  tmpvar_31 = vec3(_Specular);
  tmpvar_3 = tmpvar_31;
  tmpvar_5 = FinalAlpha;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = normalize (xlv_TEXCOORD4);
  lightDir = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = normalize (xlv_TEXCOORD3);
  highp vec2 tmpvar_35;
  tmpvar_35 = vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_LightTextureB0, tmpvar_35);
  lowp vec4 tmpvar_37;
  tmpvar_37 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump vec3 viewDir;
  viewDir = tmpvar_34;
  mediump float atten;
  atten = (tmpvar_36.w * tmpvar_37.w);
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_38;
  tmpvar_38 = max (0.0, dot (tmpvar_32, normalize ((lightDir_i0 + viewDir))));
  nh = tmpvar_38;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir_i0, tmpvar_32)));
  lowp float tmpvar_39;
  tmpvar_39 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_40;
  tmpvar_40 = (pow (nh, (tmpvar_4 * 128.0)) * tmpvar_39);
  res.w = tmpvar_40;
  mediump vec4 tmpvar_41;
  tmpvar_41 = (res * (atten * 2.0));
  res = tmpvar_41;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_41.xyz) + (tmpvar_41.xyz * (tmpvar_41.w * tmpvar_3)));
  c_i0.w = tmpvar_5;
  c = c_i0;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "POINT_COOKIE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = tmpvar_1.xyz;
  tmpvar_6[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_6[2] = tmpvar_2;
  mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_6[0].x;
  tmpvar_7[0].y = tmpvar_6[1].x;
  tmpvar_7[0].z = tmpvar_6[2].x;
  tmpvar_7[1].x = tmpvar_6[0].y;
  tmpvar_7[1].y = tmpvar_6[1].y;
  tmpvar_7[1].z = tmpvar_6[2].y;
  tmpvar_7[2].x = tmpvar_6[0].z;
  tmpvar_7[2].y = tmpvar_6[1].z;
  tmpvar_7[2].z = tmpvar_6[2].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_5 = tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_7 * (((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightTextureB0;
uniform samplerCube _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump float tmpvar_4;
  mediump float tmpvar_5;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 0.0;
  tmpvar_6.x = xlv_TEXCOORD3.x;
  tmpvar_6.y = xlv_TEXCOORD3.y;
  tmpvar_6.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_7;
  tmpvar_7 = normalize (tmpvar_6);
  highp vec2 tmpvar_8;
  tmpvar_8.x = ((tmpvar_7.x + 1.0) * 0.5);
  tmpvar_8.y = ((tmpvar_7.y + 1.0) * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_9).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = normal;
  DistortNormal = tmpvar_10;
  highp vec2 tmpvar_11;
  tmpvar_11 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Reflection, (tmpvar_8 + tmpvar_11));
  Tex2D2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = xlv_TEXCOORD3.x;
  tmpvar_13.y = xlv_TEXCOORD3.y;
  tmpvar_13.z = xlv_TEXCOORD3.z;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - dot (normalize (tmpvar_13), vec3(0.0, 0.0, 1.0)));
  highp vec2 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Texture1, (tmpvar_15 + tmpvar_11));
  Tex2D0 = tmpvar_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture2, (tmpvar_17 + tmpvar_11));
  Tex2D1 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = ((Tex2D2 * (_ReflectPower * tmpvar_14)) + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_19;
  TexNReflex.xy = (tmpvar_19.xy + tmpvar_11);
  highp vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_BumpMap1, (tmpvar_20 + tmpvar_11));
  Tex2D3 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_22;
  highp vec2 tmpvar_23;
  tmpvar_23 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_BumpMap2, (Bump2UV + tmpvar_11));
  mediump vec4 tmpvar_25;
  tmpvar_25 = ((Tex2D3 + tmpvar_24) / 2.0);
  AvgBump = tmpvar_25;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = normal_i0;
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_14 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = tmpvar_26.xyz;
  tmpvar_2 = tmpvar_30;
  tmpvar_4 = _Gloss;
  lowp vec3 tmpvar_31;
  tmpvar_31 = vec3(_Specular);
  tmpvar_3 = tmpvar_31;
  tmpvar_5 = FinalAlpha;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_32;
  mediump vec3 tmpvar_33;
  tmpvar_33 = normalize (xlv_TEXCOORD4);
  lightDir = tmpvar_33;
  highp vec3 tmpvar_34;
  tmpvar_34 = normalize (xlv_TEXCOORD3);
  highp vec2 tmpvar_35;
  tmpvar_35 = vec2(dot (xlv_TEXCOORD5, xlv_TEXCOORD5));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_LightTextureB0, tmpvar_35);
  lowp vec4 tmpvar_37;
  tmpvar_37 = textureCube (_LightTexture0, xlv_TEXCOORD5);
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump vec3 viewDir;
  viewDir = tmpvar_34;
  mediump float atten;
  atten = (tmpvar_36.w * tmpvar_37.w);
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_38;
  tmpvar_38 = max (0.0, dot (tmpvar_32, normalize ((lightDir_i0 + viewDir))));
  nh = tmpvar_38;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir_i0, tmpvar_32)));
  lowp float tmpvar_39;
  tmpvar_39 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_40;
  tmpvar_40 = (pow (nh, (tmpvar_4 * 128.0)) * tmpvar_39);
  res.w = tmpvar_40;
  mediump vec4 tmpvar_41;
  tmpvar_41 = (res * (atten * 2.0));
  res = tmpvar_41;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_41.xyz) + (tmpvar_41.xyz * (tmpvar_41.w * tmpvar_3)));
  c_i0.w = tmpvar_5;
  c = c_i0;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_DistortionMap_ST]
Vector 21 [_Texture1_ST]
Vector 22 [_Texture2_ST]
Vector 23 [_BumpMap1_ST]
Vector 24 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 35 ALU
PARAM c[25] = { { 1 },
		state.matrix.mvp,
		program.local[5..24] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0.w, c[0].x;
MOV R0.xyz, c[18];
DP4 R2.z, R0, c[11];
DP4 R2.x, R0, c[9];
DP4 R2.y, R0, c[10];
MAD R0.xyz, R2, c[17].w, -vertex.position;
MUL R2.xyz, R1, vertex.attrib[14].w;
MOV R1, c[19];
DP3 result.texcoord[3].y, R0, R2;
DP4 R3.z, R1, c[11];
DP4 R3.x, R1, c[9];
DP4 R3.y, R1, c[10];
DP3 result.texcoord[3].z, vertex.normal, R0;
DP3 result.texcoord[3].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[4].y, R2, R3;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP4 result.texcoord[5].y, R0, c[14];
DP4 result.texcoord[5].x, R0, c[13];
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[21].xyxy, c[21];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[23].xyxy, c[23];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[24], c[24].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 35 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_DistortionMap_ST]
Vector 20 [_Texture1_ST]
Vector 21 [_Texture2_ST]
Vector 22 [_BumpMap1_ST]
Vector 23 [_BumpMap2_ST]
"vs_3_0
; 38 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c24, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r3.xyz, r0, v1.w
mov r0, c10
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mov r1.w, c24.x
mov r1.xyz, c17
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c16.w, -v0
mov r1, c8
dp4 r4.x, c18, r1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o4.y, r2, r3
dp3 o5.y, r3, r4
dp3 o4.z, v2, r2
dp3 o4.x, r2, v1
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
dp4 o6.y, r0, c13
dp4 o6.x, r0, c12
mad o1.zw, v3.xyxy, c20.xyxy, c20
mad o1.xy, v3, c19, c19.zwzw
mad o2.zw, v3.xyxy, c22.xyxy, c22
mad o2.xy, v3, c21, c21.zwzw
mad o3.xy, v3, c23, c23.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = tmpvar_1.xyz;
  tmpvar_6[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_6[2] = tmpvar_2;
  mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_6[0].x;
  tmpvar_7[0].y = tmpvar_6[1].x;
  tmpvar_7[0].z = tmpvar_6[2].x;
  tmpvar_7[1].x = tmpvar_6[0].y;
  tmpvar_7[1].y = tmpvar_6[1].y;
  tmpvar_7[1].z = tmpvar_6[2].y;
  tmpvar_7[2].x = tmpvar_6[0].z;
  tmpvar_7[2].y = tmpvar_6[1].z;
  tmpvar_7[2].z = tmpvar_6[2].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_7 * (((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump float tmpvar_4;
  mediump float tmpvar_5;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 0.0;
  tmpvar_6.x = xlv_TEXCOORD3.x;
  tmpvar_6.y = xlv_TEXCOORD3.y;
  tmpvar_6.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_7;
  tmpvar_7 = normalize (tmpvar_6);
  highp vec2 tmpvar_8;
  tmpvar_8.x = ((tmpvar_7.x + 1.0) * 0.5);
  tmpvar_8.y = ((tmpvar_7.y + 1.0) * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = ((texture2D (_DistortionMap, tmpvar_9).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_10;
  highp vec2 tmpvar_11;
  tmpvar_11 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Reflection, (tmpvar_8 + tmpvar_11));
  Tex2D2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = xlv_TEXCOORD3.x;
  tmpvar_13.y = xlv_TEXCOORD3.y;
  tmpvar_13.z = xlv_TEXCOORD3.z;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - dot (normalize (tmpvar_13), vec3(0.0, 0.0, 1.0)));
  highp vec2 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Texture1, (tmpvar_15 + tmpvar_11));
  Tex2D0 = tmpvar_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture2, (tmpvar_17 + tmpvar_11));
  Tex2D1 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = ((Tex2D2 * (_ReflectPower * tmpvar_14)) + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_19;
  TexNReflex.xy = (tmpvar_19.xy + tmpvar_11);
  highp vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_BumpMap1, (tmpvar_20 + tmpvar_11));
  Tex2D3 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_22;
  highp vec2 tmpvar_23;
  tmpvar_23 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_BumpMap2, (Bump2UV + tmpvar_11));
  mediump vec4 tmpvar_25;
  tmpvar_25 = ((Tex2D3 + tmpvar_24) / 2.0);
  AvgBump = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_14 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = tmpvar_26.xyz;
  tmpvar_2 = tmpvar_30;
  tmpvar_4 = _Gloss;
  lowp vec3 tmpvar_31;
  tmpvar_31 = vec3(_Specular);
  tmpvar_3 = tmpvar_31;
  tmpvar_5 = FinalAlpha;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_32;
  lightDir = xlv_TEXCOORD4;
  highp vec3 tmpvar_33;
  tmpvar_33 = normalize (xlv_TEXCOORD3);
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_LightTexture0, xlv_TEXCOORD5);
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump vec3 viewDir;
  viewDir = tmpvar_33;
  mediump float atten;
  atten = tmpvar_34.w;
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_35;
  tmpvar_35 = max (0.0, dot (tmpvar_32, normalize ((lightDir_i0 + viewDir))));
  nh = tmpvar_35;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir_i0, tmpvar_32)));
  lowp float tmpvar_36;
  tmpvar_36 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_37;
  tmpvar_37 = (pow (nh, (tmpvar_4 * 128.0)) * tmpvar_36);
  res.w = tmpvar_37;
  mediump vec4 tmpvar_38;
  tmpvar_38 = (res * (atten * 2.0));
  res = tmpvar_38;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_38.xyz) + (tmpvar_38.xyz * (tmpvar_38.w * tmpvar_3)));
  c_i0.w = tmpvar_5;
  c = c_i0;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp mat4 _Object2World;
uniform highp mat4 _LightMatrix0;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_6;
  tmpvar_6[0] = tmpvar_1.xyz;
  tmpvar_6[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_6[2] = tmpvar_2;
  mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_6[0].x;
  tmpvar_7[0].y = tmpvar_6[1].x;
  tmpvar_7[0].z = tmpvar_6[2].x;
  tmpvar_7[1].x = tmpvar_6[0].y;
  tmpvar_7[1].y = tmpvar_6[1].y;
  tmpvar_7[1].z = tmpvar_6[2].y;
  tmpvar_7[2].x = tmpvar_6[0].z;
  tmpvar_7[2].y = tmpvar_6[1].z;
  tmpvar_7[2].z = tmpvar_6[2].z;
  highp vec3 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_5 = tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _WorldSpaceCameraPos;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_7 * (((_World2Object * tmpvar_9).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD5;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump float tmpvar_4;
  mediump float tmpvar_5;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 0.0;
  tmpvar_6.x = xlv_TEXCOORD3.x;
  tmpvar_6.y = xlv_TEXCOORD3.y;
  tmpvar_6.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_7;
  tmpvar_7 = normalize (tmpvar_6);
  highp vec2 tmpvar_8;
  tmpvar_8.x = ((tmpvar_7.x + 1.0) * 0.5);
  tmpvar_8.y = ((tmpvar_7.y + 1.0) * 0.5);
  highp vec2 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_9).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = normal;
  DistortNormal = tmpvar_10;
  highp vec2 tmpvar_11;
  tmpvar_11 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_Reflection, (tmpvar_8 + tmpvar_11));
  Tex2D2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13.x = xlv_TEXCOORD3.x;
  tmpvar_13.y = xlv_TEXCOORD3.y;
  tmpvar_13.z = xlv_TEXCOORD3.z;
  highp float tmpvar_14;
  tmpvar_14 = (1.0 - dot (normalize (tmpvar_13), vec3(0.0, 0.0, 1.0)));
  highp vec2 tmpvar_15;
  tmpvar_15 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_Texture1, (tmpvar_15 + tmpvar_11));
  Tex2D0 = tmpvar_16;
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture2, (tmpvar_17 + tmpvar_11));
  Tex2D1 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19 = ((Tex2D2 * (_ReflectPower * tmpvar_14)) + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_19;
  TexNReflex.xy = (tmpvar_19.xy + tmpvar_11);
  highp vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_BumpMap1, (tmpvar_20 + tmpvar_11));
  Tex2D3 = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_22;
  highp vec2 tmpvar_23;
  tmpvar_23 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_23;
  lowp vec4 tmpvar_24;
  tmpvar_24 = texture2D (_BumpMap2, (Bump2UV + tmpvar_11));
  mediump vec4 tmpvar_25;
  tmpvar_25 = ((Tex2D3 + tmpvar_24) / 2.0);
  AvgBump = tmpvar_25;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = normal_i0;
  highp float tmpvar_27;
  tmpvar_27 = (tmpvar_14 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (_Color * TexNReflex).xyz;
  tmpvar_1 = tmpvar_29;
  lowp vec3 tmpvar_30;
  tmpvar_30 = tmpvar_26.xyz;
  tmpvar_2 = tmpvar_30;
  tmpvar_4 = _Gloss;
  lowp vec3 tmpvar_31;
  tmpvar_31 = vec3(_Specular);
  tmpvar_3 = tmpvar_31;
  tmpvar_5 = FinalAlpha;
  mediump vec3 tmpvar_32;
  tmpvar_32 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_32;
  lightDir = xlv_TEXCOORD4;
  highp vec3 tmpvar_33;
  tmpvar_33 = normalize (xlv_TEXCOORD3);
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_LightTexture0, xlv_TEXCOORD5);
  mediump vec3 lightDir_i0;
  lightDir_i0 = lightDir;
  mediump vec3 viewDir;
  viewDir = tmpvar_33;
  mediump float atten;
  atten = tmpvar_34.w;
  mediump vec4 res;
  highp float nh;
  mediump float tmpvar_35;
  tmpvar_35 = max (0.0, dot (tmpvar_32, normalize ((lightDir_i0 + viewDir))));
  nh = tmpvar_35;
  res.xyz = (_LightColor0.xyz * max (0.0, dot (lightDir_i0, tmpvar_32)));
  lowp float tmpvar_36;
  tmpvar_36 = dot (_LightColor0.xyz, vec3(0.22, 0.707, 0.071));
  highp float tmpvar_37;
  tmpvar_37 = (pow (nh, (tmpvar_4 * 128.0)) * tmpvar_36);
  res.w = tmpvar_37;
  mediump vec4 tmpvar_38;
  tmpvar_38 = (res * (atten * 2.0));
  res = tmpvar_38;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_1 * tmpvar_38.xyz) + (tmpvar_38.xyz * (tmpvar_38.w * tmpvar_3)));
  c_i0.w = tmpvar_5;
  c = c_i0;
  c.w = 0.0;
  gl_FragData[0] = c;
}



#endif"
}

}
Program "fp" {
// Fragment combos: 5
//   opengl - ALU: 71 to 82, TEX: 6 to 8
//   d3d9 - ALU: 67 to 76, TEX: 6 to 8
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_MainTexSpeed]
Float 4 [_Bump1Speed]
Float 5 [_Texture2Speed]
Float 6 [_Bump2Speed]
Float 7 [_DistortionSpeed]
Float 8 [_DistortionPower]
Float 9 [_Specular]
Float 10 [_Gloss]
Float 12 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 4 [_BumpMap1] 2D
SetTexture 5 [_BumpMap2] 2D
SetTexture 6 [_LightTexture0] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 76 ALU, 7 TEX
PARAM c[16] = { program.local[0..12],
		{ 1, 10, 0, 2 },
		{ 0.5, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.y, c[4].x;
MOV R0.z, c[6].x;
MAD R1.xy, R0.y, c[0].x, fragment.texcoord[1].zwzw;
MOV R0.x, c[0];
MAD R0.xy, R0.x, c[7].x, fragment.texcoord[0];
TEX R0.yw, R0, texture[0], 2D;
MAD R3.xy, R0.wyzw, c[13].w, -c[13].x;
MAD R1.zw, R0.z, c[0].x, fragment.texcoord[2].xyxy;
MAD R0.zw, R3.xyxy, c[8].x, R1;
MAD R0.xy, R3, c[8].x, R1;
TEX R1.yw, R0.zwzw, texture[5], 2D;
TEX R0.yw, R0, texture[4], 2D;
ADD R0.xy, R0.ywzw, R1.ywzw;
ADD R1.xy, R0.yxzw, -c[13].x;
MUL R0.x, R1.y, R1.y;
MAD R0.x, -R1, R1, -R0;
ADD R0.x, R0, c[13];
DP3 R1.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.w, R0.x;
DP3 R0.y, fragment.texcoord[4], fragment.texcoord[4];
RSQ R0.x, R0.y;
MUL R0.xyz, R0.x, fragment.texcoord[4];
RSQ R1.z, R1.z;
MAD R2.xyz, fragment.texcoord[3], R1.z, R0;
RCP R1.z, R0.w;
DP3 R1.w, R2, R2;
DP3 R0.w, R1, R1;
RSQ R1.w, R1.w;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
MUL R2.xyz, R1.w, R2;
DP3 R0.w, R1, R2;
DP3 R1.y, R1, R0;
MAX R1.x, R0.w, c[13].z;
MOV R0.xyz, c[15];
MOV R0.w, c[14].y;
DP3 R0.y, R0, c[1];
MUL R0.w, R0, c[10].x;
POW R0.x, R1.x, R0.w;
MUL R1.w, R0.x, R0.y;
MAX R0.y, R1, c[13].z;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
TEX R0.w, R0.x, texture[6], 2D;
MUL R1.xyz, R0.y, c[1];
MUL R1, R0.w, R1;
MUL R2, R1, c[13].w;
MUL R0.xyz, fragment.texcoord[3], c[13].xxyw;
MOV R0.w, c[13].z;
DP4 R0.x, R0, R0;
RSQ R1.w, R0.x;
MUL R0.w, R2, c[9].x;
MOV R0.y, c[5].x;
MAD R1.xy, R0.y, c[0].x, fragment.texcoord[1];
MOV R0.x, c[3];
MAD R0.xy, R0.x, c[0].x, fragment.texcoord[0].zwzw;
MAD R1.xy, R3, c[8].x, R1;
MAD R0.xy, R3, c[8].x, R0;
TEX R0.xyz, R0, texture[2], 2D;
TEX R1.xyz, R1, texture[3], 2D;
MUL R1.xyz, R0, R1;
MAD R2.w, R1, fragment.texcoord[3].x, c[13].x;
MAD R0.y, R1.w, fragment.texcoord[3], c[13].x;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.z, R0.z;
MAD R1.w, fragment.texcoord[3].z, -R0.z, c[13].x;
MUL R0.x, R2.w, c[14];
MUL R0.y, R0, c[14].x;
MAD R0.xy, R3, c[8].x, R0;
TEX R0.xyz, R0, texture[1], 2D;
MUL R1.w, R1, c[12].x;
MAD R0.xyz, R0, R1.w, R1;
MAD R0.xy, R3, c[8].x, R0;
MUL R1.xyz, R2, R0.w;
MUL R0.xyz, R0, c[2];
MAD result.color.xyz, R0, R2, R1;
MOV result.color.w, c[13].z;
END
# 76 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_MainTexSpeed]
Float 4 [_Bump1Speed]
Float 5 [_Texture2Speed]
Float 6 [_Bump2Speed]
Float 7 [_DistortionSpeed]
Float 8 [_DistortionPower]
Float 9 [_Specular]
Float 10 [_Gloss]
Float 11 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 4 [_BumpMap1] 2D
SetTexture 5 [_BumpMap2] 2D
SetTexture 6 [_LightTexture0] 2D
"ps_3_0
; 71 ALU, 7 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c12, 2.00000000, -1.00000000, 1.00000000, 10.00000000
def c13, 0.00000000, 0.50000000, 128.00000000, 0
def c14, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
mov r0.y, c0.x
mad r0.zw, c4.x, r0.y, v1
mov r0.x, c7
mad r0.xy, c0.x, r0.x, v0
texld r1.yw, r0, s0
mov r1.x, c0
mad_pp r3.xy, r1.wyzw, c12.x, c12.y
mad r0.xy, c6.x, r1.x, v2
mad r1.xy, r3, c8.x, r0
mad r0.xy, r3, c8.x, r0.zwzw
texld r1.yw, r1, s5
texld r0.yw, r0, s4
add_pp r0.xy, r0.ywzw, r1.ywzw
add_pp r0.xy, r0.yxzw, c12.y
mul_pp r0.z, r0.y, r0.y
mad_pp r0.z, -r0.x, r0.x, -r0
add_pp r0.z, r0, c12
rsq_pp r0.z, r0.z
rcp_pp r0.z, r0.z
dp3_pp r0.w, r0, r0
rsq_pp r0.w, r0.w
dp3_pp r1.x, v4, v4
rsq_pp r1.x, r1.x
dp3_pp r1.w, v3, v3
mul_pp r0.xyz, r0.w, r0
mul_pp r1.xyz, r1.x, v4
rsq_pp r1.w, r1.w
mad_pp r2.xyz, v3, r1.w, r1
dp3_pp r1.w, r2, r2
dp3_pp r2.w, r0, r1
rsq_pp r0.w, r1.w
mul_pp r1.xyz, r0.w, r2
dp3_pp r0.x, r0, r1
mov_pp r0.w, c10.x
mul_pp r1.y, c13.z, r0.w
max_pp r1.x, r0, c13
pow r0, r1.x, r1.y
mov_pp r1.xyz, c1
dp3_pp r0.y, c14, r1
mul r1.w, r0.x, r0.y
max_pp r0.y, r2.w, c13.x
dp3 r0.x, v5, v5
mul_pp r1.xyz, r0.y, c1
texld r0.x, r0.x, s6
mul_pp r1, r0.x, r1
mul_pp r2, r1, c12.x
mul r0.xyz, v3, c12.zzww
mov r0.w, c13.x
dp4 r0.x, r0, r0
rsq r1.w, r0.x
mul_pp r0.w, r2, c9.x
mov r0.y, c0.x
mad r1.xy, c5.x, r0.y, v1
mov r0.x, c0
mad r0.xy, c3.x, r0.x, v0.zwzw
mad r1.xy, r3, c8.x, r1
mad r0.xy, r3, c8.x, r0
texld r0.xyz, r0, s2
texld r1.xyz, r1, s3
mul r1.xyz, r0, r1
mad r2.w, r1, v3.x, c12.z
mad r0.y, r1.w, v3, c12.z
dp3 r0.z, v3, v3
rsq r0.z, r0.z
mad r1.w, v3.z, -r0.z, c12.z
mul r0.x, r2.w, c13.y
mul r0.y, r0, c13
mad r0.xy, r3, c8.x, r0
texld r0.xyz, r0, s1
mul r1.w, r1, c11.x
mad r0.xyz, r0, r1.w, r1
mad r0.xy, r3, c8.x, r0
mul_pp r1.xyz, r2, r0.w
mul r0.xyz, r0, c2
mad_pp oC0.xyz, r0, r2, r1
mov_pp oC0.w, c13.x
"
}

SubProgram "gles " {
Keywords { "POINT" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "POINT" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_MainTexSpeed]
Float 4 [_Bump1Speed]
Float 5 [_Texture2Speed]
Float 6 [_Bump2Speed]
Float 7 [_DistortionSpeed]
Float 8 [_DistortionPower]
Float 9 [_Specular]
Float 10 [_Gloss]
Float 12 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 4 [_BumpMap1] 2D
SetTexture 5 [_BumpMap2] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 71 ALU, 6 TEX
PARAM c[16] = { program.local[0..12],
		{ 1, 10, 0, 2 },
		{ 0.5, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.y, c[4].x;
MOV R0.z, c[6].x;
MAD R1.xy, R0.y, c[0].x, fragment.texcoord[1].zwzw;
MOV R0.x, c[0];
MAD R0.xy, R0.x, c[7].x, fragment.texcoord[0];
TEX R0.yw, R0, texture[0], 2D;
MAD R3.xy, R0.wyzw, c[13].w, -c[13].x;
MAD R1.zw, R0.z, c[0].x, fragment.texcoord[2].xyxy;
MAD R0.zw, R3.xyxy, c[8].x, R1;
MAD R0.xy, R3, c[8].x, R1;
TEX R1.yw, R0.zwzw, texture[5], 2D;
TEX R0.yw, R0, texture[4], 2D;
ADD R0.xy, R0.ywzw, R1.ywzw;
ADD R1.xy, R0.yxzw, -c[13].x;
MUL R0.x, R1.y, R1.y;
MAD R0.x, -R1, R1, -R0;
ADD R0.x, R0, c[13];
RSQ R0.x, R0.x;
RCP R1.z, R0.x;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.w, R0.w;
MOV R0.xyz, fragment.texcoord[4];
MAD R0.xyz, fragment.texcoord[3], R0.w, R0;
DP3 R0.w, R1, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
RSQ R1.w, R1.w;
MUL R0.xyz, R1.w, R0;
DP3 R0.w, R1, fragment.texcoord[4];
DP3 R0.x, R1, R0;
MAX R1.y, R0.w, c[13].z;
MAX R1.x, R0, c[13].z;
MOV R0.xyz, c[15];
MOV R0.w, c[14].y;
DP3 R0.y, R0, c[1];
MUL R0.w, R0, c[10].x;
POW R0.x, R1.x, R0.w;
MUL R0.w, R0.x, R0.y;
MUL R0.xyz, R1.y, c[1];
MUL R2, R0, c[13].w;
MUL R1.xyz, fragment.texcoord[3], c[13].xxyw;
MOV R1.w, c[13].z;
DP4 R1.x, R1, R1;
RSQ R1.w, R1.x;
MUL R0.w, R2, c[9].x;
MOV R0.y, c[5].x;
MAD R1.xy, R0.y, c[0].x, fragment.texcoord[1];
MOV R0.x, c[3];
MAD R0.xy, R0.x, c[0].x, fragment.texcoord[0].zwzw;
MAD R1.xy, R3, c[8].x, R1;
MAD R0.xy, R3, c[8].x, R0;
TEX R0.xyz, R0, texture[2], 2D;
TEX R1.xyz, R1, texture[3], 2D;
MUL R1.xyz, R0, R1;
MAD R2.w, R1, fragment.texcoord[3].x, c[13].x;
MAD R0.y, R1.w, fragment.texcoord[3], c[13].x;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.z, R0.z;
MAD R1.w, fragment.texcoord[3].z, -R0.z, c[13].x;
MUL R0.x, R2.w, c[14];
MUL R0.y, R0, c[14].x;
MAD R0.xy, R3, c[8].x, R0;
TEX R0.xyz, R0, texture[1], 2D;
MUL R1.w, R1, c[12].x;
MAD R0.xyz, R0, R1.w, R1;
MAD R0.xy, R3, c[8].x, R0;
MUL R1.xyz, R2, R0.w;
MUL R0.xyz, R0, c[2];
MAD result.color.xyz, R0, R2, R1;
MOV result.color.w, c[13].z;
END
# 71 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_MainTexSpeed]
Float 4 [_Bump1Speed]
Float 5 [_Texture2Speed]
Float 6 [_Bump2Speed]
Float 7 [_DistortionSpeed]
Float 8 [_DistortionPower]
Float 9 [_Specular]
Float 10 [_Gloss]
Float 11 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 4 [_BumpMap1] 2D
SetTexture 5 [_BumpMap2] 2D
"ps_3_0
; 67 ALU, 6 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c12, 2.00000000, -1.00000000, 1.00000000, 10.00000000
def c13, 0.00000000, 0.50000000, 128.00000000, 0
def c14, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mov r0.y, c0.x
mad r0.zw, c4.x, r0.y, v1
mov r0.x, c7
mad r0.xy, c0.x, r0.x, v0
texld r1.yw, r0, s0
mov r1.x, c0
mad_pp r3.xy, r1.wyzw, c12.x, c12.y
mad r0.xy, c6.x, r1.x, v2
mad r1.xy, r3, c8.x, r0
mad r0.xy, r3, c8.x, r0.zwzw
texld r1.yw, r1, s5
texld r0.yw, r0, s4
add_pp r0.xy, r0.ywzw, r1.ywzw
add_pp r0.xy, r0.yxzw, c12.y
mul_pp r0.z, r0.y, r0.y
mad_pp r0.z, -r0.x, r0.x, -r0
add_pp r0.z, r0, c12
rsq_pp r0.z, r0.z
rcp_pp r0.z, r0.z
dp3_pp r0.w, r0, r0
rsq_pp r0.w, r0.w
dp3_pp r1.w, v3, v3
mul_pp r0.xyz, r0.w, r0
rsq_pp r1.w, r1.w
mov_pp r1.xyz, v4
mad_pp r1.xyz, v3, r1.w, r1
dp3_pp r1.w, r0, v4
dp3_pp r0.w, r1, r1
rsq_pp r0.w, r0.w
mul_pp r1.xyz, r0.w, r1
dp3_pp r0.x, r0, r1
mov_pp r0.w, c10.x
mul_pp r1.y, c13.z, r0.w
max_pp r1.x, r0, c13
pow r0, r1.x, r1.y
mov_pp r1.xyz, c1
dp3_pp r0.y, c14, r1
mul r0.w, r0.x, r0.y
max_pp r1.w, r1, c13.x
mul_pp r0.xyz, r1.w, c1
mul_pp r2, r0, c12.x
mul r1.xyz, v3, c12.zzww
mov r1.w, c13.x
dp4 r1.x, r1, r1
rsq r1.w, r1.x
mul_pp r0.w, r2, c9.x
mov r0.y, c0.x
mad r1.xy, c5.x, r0.y, v1
mov r0.x, c0
mad r0.xy, c3.x, r0.x, v0.zwzw
mad r1.xy, r3, c8.x, r1
mad r0.xy, r3, c8.x, r0
texld r0.xyz, r0, s2
texld r1.xyz, r1, s3
mul r1.xyz, r0, r1
mad r2.w, r1, v3.x, c12.z
mad r0.y, r1.w, v3, c12.z
dp3 r0.z, v3, v3
rsq r0.z, r0.z
mad r1.w, v3.z, -r0.z, c12.z
mul r0.x, r2.w, c13.y
mul r0.y, r0, c13
mad r0.xy, r3, c8.x, r0
texld r0.xyz, r0, s1
mul r1.w, r1, c11.x
mad r0.xyz, r0, r1.w, r1
mad r0.xy, r3, c8.x, r0
mul_pp r1.xyz, r2, r0.w
mul r0.xyz, r0, c2
mad_pp oC0.xyz, r0, r2, r1
mov_pp oC0.w, c13.x
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_MainTexSpeed]
Float 4 [_Bump1Speed]
Float 5 [_Texture2Speed]
Float 6 [_Bump2Speed]
Float 7 [_DistortionSpeed]
Float 8 [_DistortionPower]
Float 9 [_Specular]
Float 10 [_Gloss]
Float 12 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 4 [_BumpMap1] 2D
SetTexture 5 [_BumpMap2] 2D
SetTexture 6 [_LightTexture0] 2D
SetTexture 7 [_LightTextureB0] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 82 ALU, 8 TEX
PARAM c[16] = { program.local[0..12],
		{ 1, 10, 0, 2 },
		{ 0.5, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.y, c[4].x;
MOV R0.z, c[6].x;
MAD R1.xy, R0.y, c[0].x, fragment.texcoord[1].zwzw;
MOV R0.x, c[0];
MAD R0.xy, R0.x, c[7].x, fragment.texcoord[0];
TEX R0.yw, R0, texture[0], 2D;
MAD R3.xy, R0.wyzw, c[13].w, -c[13].x;
MAD R1.zw, R0.z, c[0].x, fragment.texcoord[2].xyxy;
MAD R0.zw, R3.xyxy, c[8].x, R1;
MAD R0.xy, R3, c[8].x, R1;
TEX R1.yw, R0.zwzw, texture[5], 2D;
TEX R0.yw, R0, texture[4], 2D;
ADD R0.xy, R0.ywzw, R1.ywzw;
ADD R1.xy, R0.yxzw, -c[13].x;
MUL R0.x, R1.y, R1.y;
MAD R0.x, -R1, R1, -R0;
ADD R0.x, R0, c[13];
DP3 R1.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.w, R0.x;
DP3 R0.y, fragment.texcoord[4], fragment.texcoord[4];
RSQ R0.x, R0.y;
MUL R0.xyz, R0.x, fragment.texcoord[4];
RSQ R1.z, R1.z;
MAD R2.xyz, fragment.texcoord[3], R1.z, R0;
RCP R1.z, R0.w;
DP3 R1.w, R2, R2;
DP3 R0.w, R1, R1;
RSQ R1.w, R1.w;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
MUL R2.xyz, R1.w, R2;
DP3 R0.w, R1, R2;
DP3 R1.y, R1, R0;
MAX R1.x, R0.w, c[13].z;
MOV R0.xyz, c[15];
DP3 R0.y, R0, c[1];
DP3 R0.z, fragment.texcoord[5], fragment.texcoord[5];
MOV R0.w, c[14].y;
MUL R0.w, R0, c[10].x;
POW R0.x, R1.x, R0.w;
MUL R2.w, R0.x, R0.y;
MAX R0.y, R1, c[13].z;
MUL R2.xyz, R0.y, c[1];
RCP R0.x, fragment.texcoord[5].w;
MAD R0.xy, fragment.texcoord[5], R0.x, c[14].x;
TEX R0.w, R0, texture[6], 2D;
SLT R0.x, c[13].z, fragment.texcoord[5].z;
MUL R0.x, R0, R0.w;
TEX R1.w, R0.z, texture[7], 2D;
MUL R0.x, R0, R1.w;
MUL R1, R0.x, R2;
MUL R2, R1, c[13].w;
MUL R0.xyz, fragment.texcoord[3], c[13].xxyw;
MOV R0.w, c[13].z;
DP4 R0.x, R0, R0;
RSQ R1.w, R0.x;
MUL R0.w, R2, c[9].x;
MOV R0.y, c[5].x;
MAD R1.xy, R0.y, c[0].x, fragment.texcoord[1];
MOV R0.x, c[3];
MAD R0.xy, R0.x, c[0].x, fragment.texcoord[0].zwzw;
MAD R1.xy, R3, c[8].x, R1;
MAD R0.xy, R3, c[8].x, R0;
TEX R0.xyz, R0, texture[2], 2D;
TEX R1.xyz, R1, texture[3], 2D;
MUL R1.xyz, R0, R1;
MAD R2.w, R1, fragment.texcoord[3].x, c[13].x;
MAD R0.y, R1.w, fragment.texcoord[3], c[13].x;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.z, R0.z;
MAD R1.w, fragment.texcoord[3].z, -R0.z, c[13].x;
MUL R0.x, R2.w, c[14];
MUL R0.y, R0, c[14].x;
MAD R0.xy, R3, c[8].x, R0;
TEX R0.xyz, R0, texture[1], 2D;
MUL R1.w, R1, c[12].x;
MAD R0.xyz, R0, R1.w, R1;
MAD R0.xy, R3, c[8].x, R0;
MUL R1.xyz, R2, R0.w;
MUL R0.xyz, R0, c[2];
MAD result.color.xyz, R0, R2, R1;
MOV result.color.w, c[13].z;
END
# 82 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_MainTexSpeed]
Float 4 [_Bump1Speed]
Float 5 [_Texture2Speed]
Float 6 [_Bump2Speed]
Float 7 [_DistortionSpeed]
Float 8 [_DistortionPower]
Float 9 [_Specular]
Float 10 [_Gloss]
Float 11 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 4 [_BumpMap1] 2D
SetTexture 5 [_BumpMap2] 2D
SetTexture 6 [_LightTexture0] 2D
SetTexture 7 [_LightTextureB0] 2D
"ps_3_0
; 76 ALU, 8 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_2d s7
def c12, 2.00000000, -1.00000000, 1.00000000, 10.00000000
def c13, 0.00000000, 0.50000000, 1.00000000, 128.00000000
def c14, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5
mov r0.y, c0.x
mad r0.zw, c4.x, r0.y, v1
mov r0.x, c7
mad r0.xy, c0.x, r0.x, v0
texld r1.yw, r0, s0
mov r1.x, c0
mad r0.xy, c6.x, r1.x, v2
mad_pp r1.xy, r1.wyzw, c12.x, c12.y
mad r2.xy, r1, c8.x, r0
mad r0.xy, r1, c8.x, r0.zwzw
dp3_pp r1.z, v4, v4
rsq_pp r1.w, r1.z
dp3_pp r1.z, v3, v3
texld r2.yw, r2, s5
texld r0.yw, r0, s4
add_pp r0.xy, r0.ywzw, r2.ywzw
add_pp r0.xy, r0.yxzw, c12.y
mul_pp r0.z, r0.y, r0.y
mad_pp r0.z, -r0.x, r0.x, -r0
add_pp r0.z, r0, c12
rsq_pp r0.z, r0.z
rcp_pp r0.z, r0.z
dp3_pp r0.w, r0, r0
rsq_pp r0.w, r0.w
mul_pp r0.xyz, r0.w, r0
mul_pp r2.xyz, r1.w, v4
rsq_pp r1.z, r1.z
mad_pp r3.xyz, v3, r1.z, r2
dp3_pp r1.z, r3, r3
rsq_pp r0.w, r1.z
dp3_pp r1.z, r0, r2
mul_pp r2.xyz, r0.w, r3
dp3_pp r0.x, r0, r2
mov_pp r0.w, c10.x
mul_pp r2.x, c13.w, r0.w
max_pp r1.w, r0.x, c13.x
pow r0, r1.w, r2.x
mov_pp r2.xyz, c1
dp3_pp r0.y, c14, r2
mul r2.w, r0.x, r0.y
max_pp r0.y, r1.z, c13.x
rcp r0.x, v5.w
mad r3.xy, v5, r0.x, c13.y
mul_pp r2.xyz, r0.y, c1
dp3 r0.x, v5, v5
texld r0.w, r3, s6
cmp r0.y, -v5.z, c13.x, c13.z
mul_pp r0.y, r0, r0.w
texld r0.x, r0.x, s7
mul_pp r0.x, r0.y, r0
mul_pp r2, r0.x, r2
mul_pp r3, r2, c12.x
mul r0.xyz, v3, c12.zzww
mov r0.w, c13.x
dp4 r0.x, r0, r0
rsq r1.z, r0.x
mov r0.y, c0.x
mad r2.xy, c5.x, r0.y, v1
mov r0.x, c0
mad r0.xy, c3.x, r0.x, v0.zwzw
mad r2.xy, r1, c8.x, r2
mad r0.xy, r1, c8.x, r0
texld r0.xyz, r0, s2
texld r2.xyz, r2, s3
mul r2.xyz, r0, r2
mad r1.w, r1.z, v3.x, c12.z
mad r0.y, r1.z, v3, c12.z
dp3 r0.z, v3, v3
rsq r0.z, r0.z
mad r1.z, v3, -r0, c12
mul_pp r0.w, r3, c9.x
mul r0.x, r1.w, c13.y
mul r0.y, r0, c13
mad r0.xy, r1, c8.x, r0
texld r0.xyz, r0, s1
mul r1.z, r1, c11.x
mad r0.xyz, r0, r1.z, r2
mad r0.xy, r1, c8.x, r0
mul_pp r2.xyz, r3, r0.w
mul r0.xyz, r0, c2
mad_pp oC0.xyz, r0, r3, r2
mov_pp oC0.w, c13.x
"
}

SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "SPOT" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_MainTexSpeed]
Float 4 [_Bump1Speed]
Float 5 [_Texture2Speed]
Float 6 [_Bump2Speed]
Float 7 [_DistortionSpeed]
Float 8 [_DistortionPower]
Float 9 [_Specular]
Float 10 [_Gloss]
Float 12 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 4 [_BumpMap1] 2D
SetTexture 5 [_BumpMap2] 2D
SetTexture 6 [_LightTextureB0] 2D
SetTexture 7 [_LightTexture0] CUBE
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 78 ALU, 8 TEX
PARAM c[16] = { program.local[0..12],
		{ 1, 10, 0, 2 },
		{ 0.5, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.y, c[4].x;
MOV R0.z, c[6].x;
MAD R1.xy, R0.y, c[0].x, fragment.texcoord[1].zwzw;
MOV R0.x, c[0];
MAD R0.xy, R0.x, c[7].x, fragment.texcoord[0];
TEX R0.yw, R0, texture[0], 2D;
MAD R3.xy, R0.wyzw, c[13].w, -c[13].x;
MAD R1.zw, R0.z, c[0].x, fragment.texcoord[2].xyxy;
MAD R0.zw, R3.xyxy, c[8].x, R1;
MAD R0.xy, R3, c[8].x, R1;
TEX R1.yw, R0.zwzw, texture[5], 2D;
TEX R0.yw, R0, texture[4], 2D;
ADD R0.xy, R0.ywzw, R1.ywzw;
ADD R1.xy, R0.yxzw, -c[13].x;
MUL R0.x, R1.y, R1.y;
MAD R0.x, -R1, R1, -R0;
ADD R0.x, R0, c[13];
RSQ R0.x, R0.x;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
RCP R1.z, R0.x;
DP3 R0.y, fragment.texcoord[4], fragment.texcoord[4];
RSQ R0.x, R0.y;
MUL R0.xyz, R0.x, fragment.texcoord[4];
RSQ R0.w, R0.w;
MAD R2.xyz, fragment.texcoord[3], R0.w, R0;
DP3 R0.w, R1, R1;
DP3 R1.w, R2, R2;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
RSQ R1.w, R1.w;
MOV R0.w, c[14].y;
DP3 R0.y, R1, R0;
MUL R2.xyz, R1.w, R2;
DP3 R0.x, R1, R2;
MAX R1.y, R0, c[13].z;
MAX R1.x, R0, c[13].z;
MOV R0.xyz, c[15];
DP3 R0.y, R0, c[1];
MUL R0.w, R0, c[10].x;
POW R0.x, R1.x, R0.w;
MUL R2.w, R0.x, R0.y;
DP3 R0.x, fragment.texcoord[5], fragment.texcoord[5];
MUL R2.xyz, R1.y, c[1];
TEX R1.w, R0.x, texture[6], 2D;
TEX R0.w, fragment.texcoord[5], texture[7], CUBE;
MUL R0.x, R1.w, R0.w;
MUL R1, R0.x, R2;
MUL R2, R1, c[13].w;
MUL R0.xyz, fragment.texcoord[3], c[13].xxyw;
MOV R0.w, c[13].z;
DP4 R0.x, R0, R0;
RSQ R1.w, R0.x;
MUL R0.w, R2, c[9].x;
MOV R0.y, c[5].x;
MAD R1.xy, R0.y, c[0].x, fragment.texcoord[1];
MOV R0.x, c[3];
MAD R0.xy, R0.x, c[0].x, fragment.texcoord[0].zwzw;
MAD R1.xy, R3, c[8].x, R1;
MAD R0.xy, R3, c[8].x, R0;
TEX R0.xyz, R0, texture[2], 2D;
TEX R1.xyz, R1, texture[3], 2D;
MUL R1.xyz, R0, R1;
MAD R2.w, R1, fragment.texcoord[3].x, c[13].x;
MAD R0.y, R1.w, fragment.texcoord[3], c[13].x;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.z, R0.z;
MAD R1.w, fragment.texcoord[3].z, -R0.z, c[13].x;
MUL R0.x, R2.w, c[14];
MUL R0.y, R0, c[14].x;
MAD R0.xy, R3, c[8].x, R0;
TEX R0.xyz, R0, texture[1], 2D;
MUL R1.w, R1, c[12].x;
MAD R0.xyz, R0, R1.w, R1;
MAD R0.xy, R3, c[8].x, R0;
MUL R1.xyz, R2, R0.w;
MUL R0.xyz, R0, c[2];
MAD result.color.xyz, R0, R2, R1;
MOV result.color.w, c[13].z;
END
# 78 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_MainTexSpeed]
Float 4 [_Bump1Speed]
Float 5 [_Texture2Speed]
Float 6 [_Bump2Speed]
Float 7 [_DistortionSpeed]
Float 8 [_DistortionPower]
Float 9 [_Specular]
Float 10 [_Gloss]
Float 11 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 4 [_BumpMap1] 2D
SetTexture 5 [_BumpMap2] 2D
SetTexture 6 [_LightTextureB0] 2D
SetTexture 7 [_LightTexture0] CUBE
"ps_3_0
; 72 ALU, 8 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
dcl_cube s7
def c12, 2.00000000, -1.00000000, 1.00000000, 10.00000000
def c13, 0.00000000, 0.50000000, 128.00000000, 0
def c14, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
mov r0.y, c0.x
mad r0.zw, c4.x, r0.y, v1
mov r0.x, c7
mad r0.xy, c0.x, r0.x, v0
texld r1.yw, r0, s0
mov r1.x, c0
mad_pp r3.xy, r1.wyzw, c12.x, c12.y
mad r0.xy, c6.x, r1.x, v2
mad r1.xy, r3, c8.x, r0
mad r0.xy, r3, c8.x, r0.zwzw
texld r1.yw, r1, s5
texld r0.yw, r0, s4
add_pp r0.xy, r0.ywzw, r1.ywzw
add_pp r1.xy, r0.yxzw, c12.y
mul_pp r0.x, r1.y, r1.y
mad_pp r0.x, -r1, r1, -r0
add_pp r0.x, r0, c12.z
rsq_pp r0.x, r0.x
rcp_pp r1.z, r0.x
dp3_pp r0.x, r1, r1
rsq_pp r0.w, r0.x
dp3_pp r0.y, v4, v4
rsq_pp r0.x, r0.y
dp3_pp r1.w, v3, v3
mul_pp r1.xyz, r0.w, r1
mul_pp r0.xyz, r0.x, v4
rsq_pp r1.w, r1.w
mad_pp r2.xyz, v3, r1.w, r0
dp3_pp r0.y, r1, r0
dp3_pp r0.w, r2, r2
rsq_pp r0.x, r0.w
max_pp r2.w, r0.y, c13.x
mul_pp r0.xyz, r0.x, r2
dp3_pp r0.x, r1, r0
mov_pp r0.w, c10.x
mul_pp r1.y, c13.z, r0.w
max_pp r1.x, r0, c13
pow r0, r1.x, r1.y
mov_pp r1.xyz, c1
dp3_pp r0.y, c14, r1
mul r1.w, r0.x, r0.y
dp3 r0.x, v5, v5
mul_pp r1.xyz, r2.w, c1
texld r0.w, v5, s7
texld r0.x, r0.x, s6
mul r0.x, r0, r0.w
mul_pp r1, r0.x, r1
mul_pp r2, r1, c12.x
mul r0.xyz, v3, c12.zzww
mov r0.w, c13.x
dp4 r0.x, r0, r0
rsq r1.w, r0.x
mul_pp r0.w, r2, c9.x
mov r0.y, c0.x
mad r1.xy, c5.x, r0.y, v1
mov r0.x, c0
mad r0.xy, c3.x, r0.x, v0.zwzw
mad r1.xy, r3, c8.x, r1
mad r0.xy, r3, c8.x, r0
texld r0.xyz, r0, s2
texld r1.xyz, r1, s3
mul r1.xyz, r0, r1
mad r2.w, r1, v3.x, c12.z
mad r0.y, r1.w, v3, c12.z
dp3 r0.z, v3, v3
rsq r0.z, r0.z
mad r1.w, v3.z, -r0.z, c12.z
mul r0.x, r2.w, c13.y
mul r0.y, r0, c13
mad r0.xy, r3, c8.x, r0
texld r0.xyz, r0, s1
mul r1.w, r1, c11.x
mad r0.xyz, r0, r1.w, r1
mad r0.xy, r3, c8.x, r0
mul_pp r1.xyz, r2, r0.w
mul r0.xyz, r0, c2
mad_pp oC0.xyz, r0, r2, r1
mov_pp oC0.w, c13.x
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "POINT_COOKIE" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_MainTexSpeed]
Float 4 [_Bump1Speed]
Float 5 [_Texture2Speed]
Float 6 [_Bump2Speed]
Float 7 [_DistortionSpeed]
Float 8 [_DistortionPower]
Float 9 [_Specular]
Float 10 [_Gloss]
Float 12 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 4 [_BumpMap1] 2D
SetTexture 5 [_BumpMap2] 2D
SetTexture 6 [_LightTexture0] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 73 ALU, 7 TEX
PARAM c[16] = { program.local[0..12],
		{ 1, 10, 0, 2 },
		{ 0.5, 128 },
		{ 0.2199707, 0.70703125, 0.070983887 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R0.y, c[4].x;
MOV R0.z, c[6].x;
MAD R1.xy, R0.y, c[0].x, fragment.texcoord[1].zwzw;
MOV R0.x, c[0];
MAD R0.xy, R0.x, c[7].x, fragment.texcoord[0];
TEX R0.yw, R0, texture[0], 2D;
MAD R3.xy, R0.wyzw, c[13].w, -c[13].x;
MAD R1.zw, R0.z, c[0].x, fragment.texcoord[2].xyxy;
MAD R0.zw, R3.xyxy, c[8].x, R1;
MAD R0.xy, R3, c[8].x, R1;
TEX R1.yw, R0.zwzw, texture[5], 2D;
TEX R0.yw, R0, texture[4], 2D;
ADD R0.xy, R0.ywzw, R1.ywzw;
ADD R1.xy, R0.yxzw, -c[13].x;
MUL R0.x, R1.y, R1.y;
MAD R0.x, -R1, R1, -R0;
ADD R0.x, R0, c[13];
RSQ R0.x, R0.x;
RCP R1.z, R0.x;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.w, R0.w;
MOV R0.xyz, fragment.texcoord[4];
MAD R0.xyz, fragment.texcoord[3], R0.w, R0;
DP3 R0.w, R1, R1;
DP3 R1.w, R0, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
RSQ R1.w, R1.w;
MUL R0.xyz, R1.w, R0;
DP3 R0.w, R1, fragment.texcoord[4];
DP3 R0.x, R1, R0;
MAX R1.x, R0, c[13].z;
MOV R0.xyz, c[15];
MAX R1.y, R0.w, c[13].z;
MOV R0.w, c[14].y;
DP3 R0.y, R0, c[1];
MUL R0.w, R0, c[10].x;
POW R0.x, R1.x, R0.w;
MUL R1.w, R0.x, R0.y;
MUL R0.xyz, fragment.texcoord[3], c[13].xxyw;
TEX R0.w, fragment.texcoord[5], texture[6], 2D;
MUL R1.xyz, R1.y, c[1];
MUL R1, R0.w, R1;
MOV R0.w, c[13].z;
DP4 R0.x, R0, R0;
MUL R2, R1, c[13].w;
RSQ R1.w, R0.x;
MUL R0.w, R2, c[9].x;
MOV R0.y, c[5].x;
MAD R1.xy, R0.y, c[0].x, fragment.texcoord[1];
MOV R0.x, c[3];
MAD R0.xy, R0.x, c[0].x, fragment.texcoord[0].zwzw;
MAD R1.xy, R3, c[8].x, R1;
MAD R0.xy, R3, c[8].x, R0;
TEX R0.xyz, R0, texture[2], 2D;
TEX R1.xyz, R1, texture[3], 2D;
MUL R1.xyz, R0, R1;
MAD R2.w, R1, fragment.texcoord[3].x, c[13].x;
MAD R0.y, R1.w, fragment.texcoord[3], c[13].x;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.z, R0.z;
MAD R1.w, fragment.texcoord[3].z, -R0.z, c[13].x;
MUL R0.x, R2.w, c[14];
MUL R0.y, R0, c[14].x;
MAD R0.xy, R3, c[8].x, R0;
TEX R0.xyz, R0, texture[1], 2D;
MUL R1.w, R1, c[12].x;
MAD R0.xyz, R0, R1.w, R1;
MAD R0.xy, R3, c[8].x, R0;
MUL R1.xyz, R2, R0.w;
MUL R0.xyz, R0, c[2];
MAD result.color.xyz, R0, R2, R1;
MOV result.color.w, c[13].z;
END
# 73 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_Time]
Vector 1 [_LightColor0]
Vector 2 [_Color]
Float 3 [_MainTexSpeed]
Float 4 [_Bump1Speed]
Float 5 [_Texture2Speed]
Float 6 [_Bump2Speed]
Float 7 [_DistortionSpeed]
Float 8 [_DistortionPower]
Float 9 [_Specular]
Float 10 [_Gloss]
Float 11 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 4 [_BumpMap1] 2D
SetTexture 5 [_BumpMap2] 2D
SetTexture 6 [_LightTexture0] 2D
"ps_3_0
; 68 ALU, 7 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
dcl_2d s6
def c12, 2.00000000, -1.00000000, 1.00000000, 10.00000000
def c13, 0.00000000, 0.50000000, 128.00000000, 0
def c14, 0.21997070, 0.70703125, 0.07098389, 0
dcl_texcoord0 v0
dcl_texcoord1 v1
dcl_texcoord2 v2.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xy
mov r0.y, c0.x
mad r0.zw, c4.x, r0.y, v1
mov r0.x, c7
mad r0.xy, c0.x, r0.x, v0
texld r1.yw, r0, s0
mov r1.x, c0
mad_pp r3.xy, r1.wyzw, c12.x, c12.y
mad r0.xy, c6.x, r1.x, v2
mad r1.xy, r3, c8.x, r0
mad r0.xy, r3, c8.x, r0.zwzw
texld r1.yw, r1, s5
texld r0.yw, r0, s4
add_pp r0.xy, r0.ywzw, r1.ywzw
add_pp r0.xy, r0.yxzw, c12.y
mul_pp r0.z, r0.y, r0.y
mad_pp r0.z, -r0.x, r0.x, -r0
add_pp r0.z, r0, c12
rsq_pp r0.z, r0.z
rcp_pp r0.z, r0.z
dp3_pp r0.w, r0, r0
rsq_pp r0.w, r0.w
dp3_pp r1.w, v3, v3
mul_pp r0.xyz, r0.w, r0
rsq_pp r1.w, r1.w
mov_pp r1.xyz, v4
mad_pp r1.xyz, v3, r1.w, r1
dp3_pp r1.w, r0, v4
dp3_pp r0.w, r1, r1
rsq_pp r0.w, r0.w
mul_pp r1.xyz, r0.w, r1
dp3_pp r0.x, r0, r1
max_pp r1.w, r1, c13.x
mov_pp r0.w, c10.x
mul_pp r1.y, c13.z, r0.w
max_pp r1.x, r0, c13
pow r0, r1.x, r1.y
mov_pp r1.xyz, c1
dp3_pp r0.y, c14, r1
mul r2.w, r0.x, r0.y
mul_pp r2.xyz, r1.w, c1
texld r0.w, v5, s6
mul_pp r1, r0.w, r2
mul_pp r2, r1, c12.x
mul r0.xyz, v3, c12.zzww
mov r0.w, c13.x
dp4 r0.x, r0, r0
rsq r1.w, r0.x
mul_pp r0.w, r2, c9.x
mov r0.y, c0.x
mad r1.xy, c5.x, r0.y, v1
mov r0.x, c0
mad r0.xy, c3.x, r0.x, v0.zwzw
mad r1.xy, r3, c8.x, r1
mad r0.xy, r3, c8.x, r0
texld r0.xyz, r0, s2
texld r1.xyz, r1, s3
mul r1.xyz, r0, r1
mad r2.w, r1, v3.x, c12.z
mad r0.y, r1.w, v3, c12.z
dp3 r0.z, v3, v3
rsq r0.z, r0.z
mad r1.w, v3.z, -r0.z, c12.z
mul r0.x, r2.w, c13.y
mul r0.y, r0, c13
mad r0.xy, r3, c8.x, r0
texld r0.xyz, r0, s1
mul r1.w, r1, c11.x
mad r0.xyz, r0, r1.w, r1
mad r0.xy, r3, c8.x, r0
mul_pp r1.xyz, r2, r0.w
mul r0.xyz, r0, c2
mad_pp oC0.xyz, r0, r2, r1
mov_pp oC0.w, c13.x
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES"
}

}
	}
	Pass {
		Name "PREPASS"
		Tags { "LightMode" = "PrePassBase" }
		Fog {Mode Off}
Program "vp" {
// Vertex combos: 1
//   opengl - ALU: 23 to 23
//   d3d9 - ALU: 24 to 24
SubProgram "opengl " {
Keywords { }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 9 [unity_Scale]
Matrix 5 [_Object2World]
Vector 10 [_DistortionMap_ST]
Vector 11 [_BumpMap1_ST]
Vector 12 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 23 ALU
PARAM c[13] = { program.local[0],
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
DP3 R0.y, R1, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[2].xyz, R0, c[9].w;
DP3 R0.y, R1, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[3].xyz, R0, c[9].w;
DP3 R0.y, R1, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[4].xyz, R0, c[9].w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[11].xyxy, c[11];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[10], c[10].zwzw;
MAD result.texcoord[1].xy, vertex.texcoord[0], c[12], c[12].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 23 instructions, 2 R-regs
"
}

SubProgram "d3d9 " {
Keywords { }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 8 [unity_Scale]
Matrix 4 [_Object2World]
Vector 9 [_DistortionMap_ST]
Vector 10 [_BumpMap1_ST]
Vector 11 [_BumpMap2_ST]
"vs_3_0
; 24 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
dp3 r0.y, r1, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o3.xyz, r0, c8.w
dp3 r0.y, r1, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o4.xyz, r0, c8.w
dp3 r0.y, r1, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o5.xyz, r0, c8.w
mad o1.zw, v3.xyxy, c10.xyxy, c10
mad o1.xy, v3, c9, c9.zwzw
mad o2.xy, v3, c11, c11.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = tmpvar_1.xyz;
  tmpvar_4[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_4[2] = tmpvar_2;
  mat3 tmpvar_5;
  tmpvar_5[0].x = tmpvar_4[0].x;
  tmpvar_5[0].y = tmpvar_4[1].x;
  tmpvar_5[0].z = tmpvar_4[2].x;
  tmpvar_5[1].x = tmpvar_4[0].y;
  tmpvar_5[1].y = tmpvar_4[1].y;
  tmpvar_5[1].z = tmpvar_4[2].y;
  tmpvar_5[2].x = tmpvar_4[0].z;
  tmpvar_5[2].y = tmpvar_4[1].z;
  tmpvar_5[2].z = tmpvar_4[2].z;
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  vec3 v_i0;
  v_i0.x = tmpvar_6[0].x;
  v_i0.y = tmpvar_6[1].x;
  v_i0.z = tmpvar_6[2].x;
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  vec3 v_i0_i1;
  v_i0_i1.x = tmpvar_7[0].y;
  v_i0_i1.y = tmpvar_7[1].y;
  v_i0_i1.z = tmpvar_7[2].y;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  vec3 v_i0_i1_i2;
  v_i0_i1_i2.x = tmpvar_8[0].z;
  v_i0_i1_i2.y = tmpvar_8[1].z;
  v_i0_i1_i2.z = tmpvar_8[2].z;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD2 = ((tmpvar_5 * v_i0) * unity_Scale.w);
  xlv_TEXCOORD3 = ((tmpvar_5 * v_i0_i1) * unity_Scale.w);
  xlv_TEXCOORD4 = ((tmpvar_5 * v_i0_i1_i2) * unity_Scale.w);
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 res;
  lowp vec3 worldN;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump float tmpvar_3;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 DistortNormal;
  highp vec2 tmpvar_4;
  tmpvar_4 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = ((texture2D (_DistortionMap, tmpvar_4).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = (DistortNormal.xy * _DistortionPower);
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_BumpMap1, (tmpvar_7 + tmpvar_6));
  Tex2D3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_9;
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD1 + Multiply9);
  Bump2UV = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_BumpMap2, (Bump2UV + tmpvar_6));
  mediump vec4 tmpvar_12;
  tmpvar_12 = ((Tex2D3 + tmpvar_11) / 2.0);
  AvgBump = tmpvar_12;
  lowp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  lowp vec3 tmpvar_14;
  tmpvar_14 = tmpvar_13.xyz;
  tmpvar_2 = tmpvar_14;
  tmpvar_3 = _Gloss;
  mediump vec3 tmpvar_15;
  tmpvar_15 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (xlv_TEXCOORD4, tmpvar_15);
  worldN.z = tmpvar_18;
  tmpvar_1 = worldN;
  mediump vec3 tmpvar_19;
  tmpvar_19 = ((tmpvar_1 * 0.5) + 0.5);
  res.xyz = tmpvar_19;
  res.w = tmpvar_3;
  gl_FragData[0] = res;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp mat3 tmpvar_4;
  tmpvar_4[0] = tmpvar_1.xyz;
  tmpvar_4[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_4[2] = tmpvar_2;
  mat3 tmpvar_5;
  tmpvar_5[0].x = tmpvar_4[0].x;
  tmpvar_5[0].y = tmpvar_4[1].x;
  tmpvar_5[0].z = tmpvar_4[2].x;
  tmpvar_5[1].x = tmpvar_4[0].y;
  tmpvar_5[1].y = tmpvar_4[1].y;
  tmpvar_5[1].z = tmpvar_4[2].y;
  tmpvar_5[2].x = tmpvar_4[0].z;
  tmpvar_5[2].y = tmpvar_4[1].z;
  tmpvar_5[2].z = tmpvar_4[2].z;
  mat3 tmpvar_6;
  tmpvar_6[0] = _Object2World[0].xyz;
  tmpvar_6[1] = _Object2World[1].xyz;
  tmpvar_6[2] = _Object2World[2].xyz;
  vec3 v_i0;
  v_i0.x = tmpvar_6[0].x;
  v_i0.y = tmpvar_6[1].x;
  v_i0.z = tmpvar_6[2].x;
  mat3 tmpvar_7;
  tmpvar_7[0] = _Object2World[0].xyz;
  tmpvar_7[1] = _Object2World[1].xyz;
  tmpvar_7[2] = _Object2World[2].xyz;
  vec3 v_i0_i1;
  v_i0_i1.x = tmpvar_7[0].y;
  v_i0_i1.y = tmpvar_7[1].y;
  v_i0_i1.z = tmpvar_7[2].y;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  vec3 v_i0_i1_i2;
  v_i0_i1_i2.x = tmpvar_8[0].z;
  v_i0_i1_i2.y = tmpvar_8[1].z;
  v_i0_i1_i2.z = tmpvar_8[2].z;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD2 = ((tmpvar_5 * v_i0) * unity_Scale.w);
  xlv_TEXCOORD3 = ((tmpvar_5 * v_i0_i1) * unity_Scale.w);
  xlv_TEXCOORD4 = ((tmpvar_5 * v_i0_i1_i2) * unity_Scale.w);
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform lowp float _Gloss;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 res;
  lowp vec3 worldN;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump float tmpvar_3;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 DistortNormal;
  highp vec2 tmpvar_4;
  tmpvar_4 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_4).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = normal;
  DistortNormal = tmpvar_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = (DistortNormal.xy * _DistortionPower);
  highp vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_BumpMap1, (tmpvar_7 + tmpvar_6));
  Tex2D3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_9;
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD1 + Multiply9);
  Bump2UV = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_BumpMap2, (Bump2UV + tmpvar_6));
  mediump vec4 tmpvar_12;
  tmpvar_12 = ((Tex2D3 + tmpvar_11) / 2.0);
  AvgBump = tmpvar_12;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = normal_i0;
  lowp vec3 tmpvar_14;
  tmpvar_14 = tmpvar_13.xyz;
  tmpvar_2 = tmpvar_14;
  tmpvar_3 = _Gloss;
  mediump vec3 tmpvar_15;
  tmpvar_15 = normalize (tmpvar_2);
  tmpvar_2 = tmpvar_15;
  highp float tmpvar_16;
  tmpvar_16 = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (xlv_TEXCOORD4, tmpvar_15);
  worldN.z = tmpvar_18;
  tmpvar_1 = worldN;
  mediump vec3 tmpvar_19;
  tmpvar_19 = ((tmpvar_1 * 0.5) + 0.5);
  res.xyz = tmpvar_19;
  res.w = tmpvar_3;
  gl_FragData[0] = res;
}



#endif"
}

}
Program "fp" {
// Fragment combos: 1
//   opengl - ALU: 27 to 27, TEX: 3 to 3
//   d3d9 - ALU: 24 to 24, TEX: 3 to 3
SubProgram "opengl " {
Keywords { }
Vector 0 [_Time]
Float 1 [_Bump1Speed]
Float 2 [_Bump2Speed]
Float 3 [_DistortionSpeed]
Float 4 [_DistortionPower]
Float 5 [_Gloss]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_BumpMap1] 2D
SetTexture 2 [_BumpMap2] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 27 ALU, 3 TEX
PARAM c[7] = { program.local[0..5],
		{ 2, 1, 0.5 } };
TEMP R0;
TEMP R1;
MOV R0.y, c[1].x;
MOV R0.z, c[2].x;
MAD R1.xy, R0.y, c[0].x, fragment.texcoord[0].zwzw;
MOV R0.x, c[0];
MAD R0.xy, R0.x, c[3].x, fragment.texcoord[0];
TEX R0.yw, R0, texture[0], 2D;
MAD R1.zw, R0.z, c[0].x, fragment.texcoord[1].xyxy;
MAD R0.xy, R0.wyzw, c[6].x, -c[6].y;
MAD R0.zw, R0.xyxy, c[4].x, R1;
MAD R0.xy, R0, c[4].x, R1;
TEX R1.yw, R0.zwzw, texture[2], 2D;
TEX R0.yw, R0, texture[1], 2D;
ADD R0.xy, R0.ywzw, R1.ywzw;
ADD R0.xy, R0.yxzw, -c[6].y;
MUL R0.z, R0.y, R0.y;
MAD R0.z, -R0.x, R0.x, -R0;
ADD R0.z, R0, c[6].y;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R0.w, R0, R0;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R0;
DP3 R0.z, fragment.texcoord[4], R1;
DP3 R0.x, R1, fragment.texcoord[2];
DP3 R0.y, R1, fragment.texcoord[3];
MAD result.color.xyz, R0, c[6].z, c[6].z;
MOV result.color.w, c[5].x;
END
# 27 instructions, 2 R-regs
"
}

SubProgram "d3d9 " {
Keywords { }
Vector 0 [_Time]
Float 1 [_Bump1Speed]
Float 2 [_Bump2Speed]
Float 3 [_DistortionSpeed]
Float 4 [_DistortionPower]
Float 5 [_Gloss]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_BumpMap1] 2D
SetTexture 2 [_BumpMap2] 2D
"ps_3_0
; 24 ALU, 3 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
def c6, 2.00000000, -1.00000000, 1.00000000, 0.50000000
dcl_texcoord0 v0
dcl_texcoord1 v1.xy
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4.xyz
mov r0.x, c0
mad r0.zw, c1.x, r0.x, v0
mov r0.y, c3.x
mad r0.xy, c0.x, r0.y, v0
texld r1.yw, r0, s0
mov r1.x, c0
mad r0.xy, c2.x, r1.x, v1
mad_pp r1.xy, r1.wyzw, c6.x, c6.y
mad r0.xy, r1, c4.x, r0
mad r1.xy, r1, c4.x, r0.zwzw
texld r0.yw, r0, s2
texld r1.yw, r1, s1
add_pp r0.xy, r1.ywzw, r0.ywzw
add_pp r0.xy, r0.yxzw, c6.y
mul_pp r0.z, r0.y, r0.y
mad_pp r0.z, -r0.x, r0.x, -r0
add_pp r0.z, r0, c6
rsq_pp r0.z, r0.z
rcp_pp r0.z, r0.z
dp3_pp r0.w, r0, r0
rsq_pp r0.w, r0.w
mul_pp r0.xyz, r0.w, r0
dp3 r1.z, v4, r0
dp3 r1.x, r0, v2
dp3 r1.y, r0, v3
mad_pp oC0.xyz, r1, c6.w, c6.w
mov_pp oC0.w, c5.x
"
}

SubProgram "gles " {
Keywords { }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { }
"!!GLES"
}

}
	}
	Pass {
		Name "PREPASS"
		Tags { "LightMode" = "PrePassFinal" }
		ZWrite Off
Program "vp" {
// Vertex combos: 4
//   opengl - ALU: 37 to 45
//   d3d9 - ALU: 38 to 46
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [_DistortionMap_ST]
Vector 24 [_Texture1_ST]
Vector 25 [_Texture2_ST]
Vector 26 [_BumpMap1_ST]
Vector 27 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 45 ALU
PARAM c[28] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..27] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[14].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[18];
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[16];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[21];
DP4 R3.x, R1, c[19];
DP4 R3.y, R1, c[20];
ADD R2.xyz, R2, R3;
MAD R0.w, R0.x, R0.x, -R0.y;
MUL R3.xyz, R0.w, c[22];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1.xyz, c[15];
ADD result.texcoord[5].xyz, R2, R3;
MOV R1.w, c[0].x;
DP4 R0.w, vertex.position, c[4];
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R2.xyz, R2, c[14].w, -vertex.position;
DP3 result.texcoord[3].y, R2, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[13].x;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[24].xyxy, c[24];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[26].xyxy, c[26];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[25], c[25].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[27], c[27].zwzw;
END
# 45 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [_DistortionMap_ST]
Vector 24 [_Texture1_ST]
Vector 25 [_Texture2_ST]
Vector 26 [_BumpMap1_ST]
Vector 27 [_BumpMap2_ST]
"vs_3_0
; 46 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c28, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c14.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c28.x
dp4 r2.z, r0, c18
dp4 r2.y, r0, c17
dp4 r2.x, r0, c16
mul r0.y, r2.w, r2.w
mad r0.w, r0.x, r0.x, -r0.y
dp4 r3.z, r1, c21
dp4 r3.y, r1, c20
dp4 r3.x, r1, c19
add r2.xyz, r2, r3
mul r3.xyz, r0.w, c22
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r0.xyz, r0, v1.w
mov r1.xyz, c15
add o6.xyz, r2, r3
mov r1.w, c28.x
dp4 r0.w, v0, c3
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c14.w, -v0
dp3 o4.y, r2, r0
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c28.y
mul r1.y, r1, c12.x
dp3 o4.z, v2, r2
dp3 o4.x, r2, v1
mad o5.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o5.zw, r0
mad o1.zw, v3.xyxy, c24.xyxy, c24
mad o1.xy, v3, c23, c23.zwzw
mad o2.zw, v3.xyxy, c26.xyxy, c26
mad o2.xy, v3, c25, c25.zwzw
mad o3.xy, v3, c27, c27.zwzw
"
}

SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp vec4 o_i0;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * 0.5);
  o_i0 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_8 + tmpvar_7.w);
  o_i0.zw = tmpvar_6.zw;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_9 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_11;
  mediump vec4 normal;
  normal = tmpvar_10;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_12;
  tmpvar_12 = dot (unity_SHAr, normal);
  x1.x = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = dot (unity_SHAg, normal);
  x1.y = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAb, normal);
  x1.z = tmpvar_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHBr, tmpvar_15);
  x2.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHBg, tmpvar_15);
  x2.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBb, tmpvar_15);
  x2.z = tmpvar_18;
  mediump float tmpvar_19;
  tmpvar_19 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_SHC.xyz * vC);
  x3 = tmpvar_20;
  tmpvar_11 = ((x1 + x2) + x3);
  tmpvar_5 = tmpvar_11;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = tmpvar_1.xyz;
  tmpvar_21[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_21[2] = tmpvar_2;
  mat3 tmpvar_22;
  tmpvar_22[0].x = tmpvar_21[0].x;
  tmpvar_22[0].y = tmpvar_21[1].x;
  tmpvar_22[0].z = tmpvar_21[2].x;
  tmpvar_22[1].x = tmpvar_21[0].y;
  tmpvar_22[1].y = tmpvar_21[1].y;
  tmpvar_22[1].z = tmpvar_21[2].y;
  tmpvar_22[2].x = tmpvar_21[0].z;
  tmpvar_22[2].y = tmpvar_21[1].z;
  tmpvar_22[2].z = tmpvar_21[2].z;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_22 * (((_World2Object * tmpvar_23).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = o_i0;
  xlv_TEXCOORD5 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightBuffer;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c;
  mediump vec4 light;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = ((texture2D (_DistortionMap, tmpvar_10).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_2 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_3 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_4 = tmpvar_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_5 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  tmpvar_3 = normalize (tmpvar_3);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light = tmpvar_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = -(log2 (max (light, vec4(0.001, 0.001, 0.001, 0.001))));
  light = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_36.xyz + xlv_TEXCOORD5);
  light.xyz = tmpvar_37;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_2 * light.xyz) + (light.xyz * (tmpvar_36.w * tmpvar_5)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  c.xyz = (c_i0.xyz + tmpvar_4);
  tmpvar_1 = c;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp vec4 o_i0;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * 0.5);
  o_i0 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_8 + tmpvar_7.w);
  o_i0.zw = tmpvar_6.zw;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_9 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_11;
  mediump vec4 normal;
  normal = tmpvar_10;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_12;
  tmpvar_12 = dot (unity_SHAr, normal);
  x1.x = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = dot (unity_SHAg, normal);
  x1.y = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAb, normal);
  x1.z = tmpvar_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHBr, tmpvar_15);
  x2.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHBg, tmpvar_15);
  x2.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBb, tmpvar_15);
  x2.z = tmpvar_18;
  mediump float tmpvar_19;
  tmpvar_19 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_SHC.xyz * vC);
  x3 = tmpvar_20;
  tmpvar_11 = ((x1 + x2) + x3);
  tmpvar_5 = tmpvar_11;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = tmpvar_1.xyz;
  tmpvar_21[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_21[2] = tmpvar_2;
  mat3 tmpvar_22;
  tmpvar_22[0].x = tmpvar_21[0].x;
  tmpvar_22[0].y = tmpvar_21[1].x;
  tmpvar_22[0].z = tmpvar_21[2].x;
  tmpvar_22[1].x = tmpvar_21[0].y;
  tmpvar_22[1].y = tmpvar_21[1].y;
  tmpvar_22[1].z = tmpvar_21[2].y;
  tmpvar_22[2].x = tmpvar_21[0].z;
  tmpvar_22[2].y = tmpvar_21[1].z;
  tmpvar_22[2].z = tmpvar_21[2].z;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_22 * (((_World2Object * tmpvar_23).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = o_i0;
  xlv_TEXCOORD5 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightBuffer;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c;
  mediump vec4 light;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_10).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = normal;
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = normal_i0;
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_2 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_3 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_4 = tmpvar_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_5 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  tmpvar_3 = normalize (tmpvar_3);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light = tmpvar_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = -(log2 (max (light, vec4(0.001, 0.001, 0.001, 0.001))));
  light = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_36.xyz + xlv_TEXCOORD5);
  light.xyz = tmpvar_37;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_2 * light.xyz) + (light.xyz * (tmpvar_36.w * tmpvar_5)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  c.xyz = (c_i0.xyz + tmpvar_4);
  tmpvar_1 = c;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}

SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 17 [_ProjectionParams]
Vector 18 [unity_Scale]
Vector 19 [_WorldSpaceCameraPos]
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 20 [unity_LightmapST]
Vector 21 [unity_ShadowFadeCenterAndType]
Vector 22 [_DistortionMap_ST]
Vector 23 [_Texture1_ST]
Vector 24 [_Texture2_ST]
Vector 25 [_BumpMap1_ST]
Vector 26 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 37 ALU
PARAM c[27] = { { 1, 0.5 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..26] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1.xyz, c[19];
MOV R1.w, c[0].x;
DP4 R0.w, vertex.position, c[8];
DP4 R2.z, R1, c[15];
DP4 R2.x, R1, c[13];
DP4 R2.y, R1, c[14];
MAD R2.xyz, R2, c[18].w, -vertex.position;
DP3 result.texcoord[3].y, R2, R0;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[17].x;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV R0.x, c[0];
ADD R0.y, R0.x, -c[21].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[11];
DP4 R1.x, vertex.position, c[9];
DP4 R1.y, vertex.position, c[10];
ADD R1.xyz, R1, -c[21];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[4].zw, R0;
MUL result.texcoord[6].xyz, R1, c[21].w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[23].xyxy, c[23];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[25].xyxy, c[25];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[24], c[24].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[26], c[26].zwzw;
MAD result.texcoord[5].xy, vertex.texcoord[1], c[20], c[20].zwzw;
MUL result.texcoord[6].w, -R0.x, R0.y;
END
# 37 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [unity_Scale]
Vector 19 [_WorldSpaceCameraPos]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 20 [unity_LightmapST]
Vector 21 [unity_ShadowFadeCenterAndType]
Vector 22 [_DistortionMap_ST]
Vector 23 [_Texture1_ST]
Vector 24 [_Texture2_ST]
Vector 25 [_BumpMap1_ST]
Vector 26 [_BumpMap2_ST]
"vs_3_0
; 38 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c27, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r0.xyz, r0, v1.w
mov r1.xyz, c19
mov r1.w, c27.x
dp4 r0.w, v0, c7
dp4 r2.z, r1, c14
dp4 r2.x, r1, c12
dp4 r2.y, r1, c13
mad r2.xyz, r2, c18.w, -v0
dp3 o4.y, r2, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c27.y
mul r1.y, r1, c16.x
mad o5.xy, r1.z, c17.zwzw, r1
mov o0, r0
mov r0.x, c21.w
add r0.y, c27.x, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c10
dp4 r1.x, v0, c8
dp4 r1.y, v0, c9
add r1.xyz, r1, -c21
dp3 o4.z, v2, r2
dp3 o4.x, r2, v1
mov o5.zw, r0
mul o7.xyz, r1, c21.w
mad o1.zw, v3.xyxy, c23.xyxy, c23
mad o1.xy, v3, c22, c22.zwzw
mad o2.zw, v3.xyxy, c25.xyxy, c25
mad o2.xy, v3, c24, c24.zwzw
mad o3.xy, v3, c26, c26.zwzw
mad o6.xy, v4, c20, c20.zwzw
mul o7.w, -r0.x, r0.y
"
}

SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;
#define gl_ModelViewMatrix glstate_matrix_modelview0
uniform mat4 glstate_matrix_modelview0;

varying highp vec4 xlv_TEXCOORD6;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;


uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp vec4 o_i0;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * 0.5);
  o_i0 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_8 + tmpvar_7.w);
  o_i0.zw = tmpvar_6.zw;
  tmpvar_5.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_5.w = (-((gl_ModelViewMatrix * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = tmpvar_1.xyz;
  tmpvar_9[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_9[2] = tmpvar_2;
  mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_9[0].x;
  tmpvar_10[0].y = tmpvar_9[1].x;
  tmpvar_10[0].z = tmpvar_9[2].x;
  tmpvar_10[1].x = tmpvar_9[0].y;
  tmpvar_10[1].y = tmpvar_9[1].y;
  tmpvar_10[1].z = tmpvar_9[2].y;
  tmpvar_10[2].x = tmpvar_9[0].z;
  tmpvar_10[2].y = tmpvar_9[1].z;
  tmpvar_10[2].z = tmpvar_9[2].z;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_10 * (((_World2Object * tmpvar_11).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = o_i0;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
uniform sampler2D unity_Lightmap;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightBuffer;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c;
  mediump vec3 lmIndirect;
  mediump vec3 lmFull;
  mediump vec4 light;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = ((texture2D (_DistortionMap, tmpvar_10).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_2 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_3 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_4 = tmpvar_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_5 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  tmpvar_3 = normalize (tmpvar_3);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light = tmpvar_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = -(log2 (max (light, vec4(0.001, 0.001, 0.001, 0.001))));
  light = tmpvar_36;
  lowp vec3 tmpvar_37;
  tmpvar_37 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lmFull = tmpvar_37;
  lowp vec3 tmpvar_38;
  tmpvar_38 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD5).xyz);
  lmIndirect = tmpvar_38;
  highp vec3 tmpvar_39;
  tmpvar_39 = vec3(clamp (((length (xlv_TEXCOORD6) * unity_LightmapFade.z) + unity_LightmapFade.w), 0.0, 1.0));
  light.xyz = (tmpvar_36.xyz + mix (lmIndirect, lmFull, tmpvar_39));
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_2 * light.xyz) + (light.xyz * (tmpvar_36.w * tmpvar_5)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  c.xyz = (c_i0.xyz + tmpvar_4);
  tmpvar_1 = c;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;
#define gl_ModelViewMatrix glstate_matrix_modelview0
uniform mat4 glstate_matrix_modelview0;

varying highp vec4 xlv_TEXCOORD6;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;


uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp vec4 o_i0;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * 0.5);
  o_i0 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_8 + tmpvar_7.w);
  o_i0.zw = tmpvar_6.zw;
  tmpvar_5.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_5.w = (-((gl_ModelViewMatrix * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = tmpvar_1.xyz;
  tmpvar_9[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_9[2] = tmpvar_2;
  mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_9[0].x;
  tmpvar_10[0].y = tmpvar_9[1].x;
  tmpvar_10[0].z = tmpvar_9[2].x;
  tmpvar_10[1].x = tmpvar_9[0].y;
  tmpvar_10[1].y = tmpvar_9[1].y;
  tmpvar_10[1].z = tmpvar_9[2].y;
  tmpvar_10[2].x = tmpvar_9[0].z;
  tmpvar_10[2].y = tmpvar_9[1].z;
  tmpvar_10[2].z = tmpvar_9[2].z;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_10 * (((_World2Object * tmpvar_11).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = o_i0;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
uniform sampler2D unity_Lightmap;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightBuffer;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c;
  mediump vec3 lmIndirect;
  mediump vec3 lmFull;
  mediump vec4 light;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_10).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = normal;
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = normal_i0;
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_2 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_3 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_4 = tmpvar_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_5 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  tmpvar_3 = normalize (tmpvar_3);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light = tmpvar_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = -(log2 (max (light, vec4(0.001, 0.001, 0.001, 0.001))));
  light = tmpvar_36;
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (unity_Lightmap, xlv_TEXCOORD5);
  lowp vec3 tmpvar_38;
  tmpvar_38 = ((8.0 * tmpvar_37.w) * tmpvar_37.xyz);
  lmFull = tmpvar_38;
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (unity_LightmapInd, xlv_TEXCOORD5);
  lowp vec3 tmpvar_40;
  tmpvar_40 = ((8.0 * tmpvar_39.w) * tmpvar_39.xyz);
  lmIndirect = tmpvar_40;
  highp vec3 tmpvar_41;
  tmpvar_41 = vec3(clamp (((length (xlv_TEXCOORD6) * unity_LightmapFade.z) + unity_LightmapFade.w), 0.0, 1.0));
  light.xyz = (tmpvar_36.xyz + mix (lmIndirect, lmFull, tmpvar_41));
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_2 * light.xyz) + (light.xyz * (tmpvar_36.w * tmpvar_5)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  c.xyz = (c_i0.xyz + tmpvar_4);
  tmpvar_1 = c;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}

SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [_DistortionMap_ST]
Vector 24 [_Texture1_ST]
Vector 25 [_Texture2_ST]
Vector 26 [_BumpMap1_ST]
Vector 27 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 45 ALU
PARAM c[28] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..27] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[14].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MUL R1, R0.xyzz, R0.yzzx;
MOV R0.w, c[0].x;
DP4 R2.z, R0, c[18];
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[16];
MUL R0.y, R2.w, R2.w;
DP4 R3.z, R1, c[21];
DP4 R3.x, R1, c[19];
DP4 R3.y, R1, c[20];
ADD R2.xyz, R2, R3;
MAD R0.w, R0.x, R0.x, -R0.y;
MUL R3.xyz, R0.w, c[22];
MOV R1.xyz, vertex.attrib[14];
MUL R0.xyz, vertex.normal.zxyw, R1.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R1.zxyw, -R0;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1.xyz, c[15];
ADD result.texcoord[5].xyz, R2, R3;
MOV R1.w, c[0].x;
DP4 R0.w, vertex.position, c[4];
DP4 R2.z, R1, c[11];
DP4 R2.x, R1, c[9];
DP4 R2.y, R1, c[10];
MAD R2.xyz, R2, c[14].w, -vertex.position;
DP3 result.texcoord[3].y, R2, R0;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[13].x;
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[4].zw, R0;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[24].xyxy, c[24];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[26].xyxy, c[26];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[25], c[25].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[27], c[27].zwzw;
END
# 45 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [_DistortionMap_ST]
Vector 24 [_Texture1_ST]
Vector 25 [_Texture2_ST]
Vector 26 [_BumpMap1_ST]
Vector 27 [_BumpMap2_ST]
"vs_3_0
; 46 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c28, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c14.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mul r1, r0.xyzz, r0.yzzx
mov r0.w, c28.x
dp4 r2.z, r0, c18
dp4 r2.y, r0, c17
dp4 r2.x, r0, c16
mul r0.y, r2.w, r2.w
mad r0.w, r0.x, r0.x, -r0.y
dp4 r3.z, r1, c21
dp4 r3.y, r1, c20
dp4 r3.x, r1, c19
add r2.xyz, r2, r3
mul r3.xyz, r0.w, c22
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r0.xyz, r0, v1.w
mov r1.xyz, c15
add o6.xyz, r2, r3
mov r1.w, c28.x
dp4 r0.w, v0, c3
dp4 r2.z, r1, c10
dp4 r2.x, r1, c8
dp4 r2.y, r1, c9
mad r2.xyz, r2, c14.w, -v0
dp3 o4.y, r2, r0
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c28.y
mul r1.y, r1, c12.x
dp3 o4.z, v2, r2
dp3 o4.x, r2, v1
mad o5.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o5.zw, r0
mad o1.zw, v3.xyxy, c24.xyxy, c24
mad o1.xy, v3, c23, c23.zwzw
mad o2.zw, v3.xyxy, c26.xyxy, c26
mad o2.xy, v3, c25, c25.zwzw
mad o3.xy, v3, c27, c27.zwzw
"
}

SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp vec4 o_i0;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * 0.5);
  o_i0 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_8 + tmpvar_7.w);
  o_i0.zw = tmpvar_6.zw;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_9 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_11;
  mediump vec4 normal;
  normal = tmpvar_10;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_12;
  tmpvar_12 = dot (unity_SHAr, normal);
  x1.x = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = dot (unity_SHAg, normal);
  x1.y = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAb, normal);
  x1.z = tmpvar_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHBr, tmpvar_15);
  x2.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHBg, tmpvar_15);
  x2.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBb, tmpvar_15);
  x2.z = tmpvar_18;
  mediump float tmpvar_19;
  tmpvar_19 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_SHC.xyz * vC);
  x3 = tmpvar_20;
  tmpvar_11 = ((x1 + x2) + x3);
  tmpvar_5 = tmpvar_11;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = tmpvar_1.xyz;
  tmpvar_21[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_21[2] = tmpvar_2;
  mat3 tmpvar_22;
  tmpvar_22[0].x = tmpvar_21[0].x;
  tmpvar_22[0].y = tmpvar_21[1].x;
  tmpvar_22[0].z = tmpvar_21[2].x;
  tmpvar_22[1].x = tmpvar_21[0].y;
  tmpvar_22[1].y = tmpvar_21[1].y;
  tmpvar_22[1].z = tmpvar_21[2].y;
  tmpvar_22[2].x = tmpvar_21[0].z;
  tmpvar_22[2].y = tmpvar_21[1].z;
  tmpvar_22[2].z = tmpvar_21[2].z;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_22 * (((_World2Object * tmpvar_23).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = o_i0;
  xlv_TEXCOORD5 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightBuffer;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c;
  mediump vec4 light;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = ((texture2D (_DistortionMap, tmpvar_10).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_2 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_3 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_4 = tmpvar_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_5 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  tmpvar_3 = normalize (tmpvar_3);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light = tmpvar_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = max (light, vec4(0.001, 0.001, 0.001, 0.001));
  light = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_36.xyz + xlv_TEXCOORD5);
  light.xyz = tmpvar_37;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_2 * light.xyz) + (light.xyz * (tmpvar_36.w * tmpvar_5)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  c.xyz = (c_i0.xyz + tmpvar_4);
  tmpvar_1 = c;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp vec4 o_i0;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * 0.5);
  o_i0 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_8 + tmpvar_7.w);
  o_i0.zw = tmpvar_6.zw;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_9 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_11;
  mediump vec4 normal;
  normal = tmpvar_10;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_12;
  tmpvar_12 = dot (unity_SHAr, normal);
  x1.x = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = dot (unity_SHAg, normal);
  x1.y = tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = dot (unity_SHAb, normal);
  x1.z = tmpvar_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_16;
  tmpvar_16 = dot (unity_SHBr, tmpvar_15);
  x2.x = tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = dot (unity_SHBg, tmpvar_15);
  x2.y = tmpvar_17;
  highp float tmpvar_18;
  tmpvar_18 = dot (unity_SHBb, tmpvar_15);
  x2.z = tmpvar_18;
  mediump float tmpvar_19;
  tmpvar_19 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_SHC.xyz * vC);
  x3 = tmpvar_20;
  tmpvar_11 = ((x1 + x2) + x3);
  tmpvar_5 = tmpvar_11;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = tmpvar_1.xyz;
  tmpvar_21[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_21[2] = tmpvar_2;
  mat3 tmpvar_22;
  tmpvar_22[0].x = tmpvar_21[0].x;
  tmpvar_22[0].y = tmpvar_21[1].x;
  tmpvar_22[0].z = tmpvar_21[2].x;
  tmpvar_22[1].x = tmpvar_21[0].y;
  tmpvar_22[1].y = tmpvar_21[1].y;
  tmpvar_22[1].z = tmpvar_21[2].y;
  tmpvar_22[2].x = tmpvar_21[0].z;
  tmpvar_22[2].y = tmpvar_21[1].z;
  tmpvar_22[2].z = tmpvar_21[2].z;
  highp vec4 tmpvar_23;
  tmpvar_23.w = 1.0;
  tmpvar_23.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_22 * (((_World2Object * tmpvar_23).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = o_i0;
  xlv_TEXCOORD5 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightBuffer;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c;
  mediump vec4 light;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_10).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = normal;
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = normal_i0;
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_2 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_3 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_4 = tmpvar_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_5 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  tmpvar_3 = normalize (tmpvar_3);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light = tmpvar_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = max (light, vec4(0.001, 0.001, 0.001, 0.001));
  light = tmpvar_36;
  highp vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_36.xyz + xlv_TEXCOORD5);
  light.xyz = tmpvar_37;
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_2 * light.xyz) + (light.xyz * (tmpvar_36.w * tmpvar_5)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  c.xyz = (c_i0.xyz + tmpvar_4);
  tmpvar_1 = c;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}

SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 17 [_ProjectionParams]
Vector 18 [unity_Scale]
Vector 19 [_WorldSpaceCameraPos]
Matrix 9 [_Object2World]
Matrix 13 [_World2Object]
Vector 20 [unity_LightmapST]
Vector 21 [unity_ShadowFadeCenterAndType]
Vector 22 [_DistortionMap_ST]
Vector 23 [_Texture1_ST]
Vector 24 [_Texture2_ST]
Vector 25 [_BumpMap1_ST]
Vector 26 [_BumpMap2_ST]
"3.0-!!ARBvp1.0
# 37 ALU
PARAM c[27] = { { 1, 0.5 },
		state.matrix.modelview[0],
		state.matrix.mvp,
		program.local[9..26] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R0.xyz, R0, vertex.attrib[14].w;
MOV R1.xyz, c[19];
MOV R1.w, c[0].x;
DP4 R0.w, vertex.position, c[8];
DP4 R2.z, R1, c[15];
DP4 R2.x, R1, c[13];
DP4 R2.y, R1, c[14];
MAD R2.xyz, R2, c[18].w, -vertex.position;
DP3 result.texcoord[3].y, R2, R0;
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[17].x;
ADD result.texcoord[4].xy, R1, R1.z;
MOV result.position, R0;
MOV R0.x, c[0];
ADD R0.y, R0.x, -c[21].w;
DP4 R0.x, vertex.position, c[3];
DP4 R1.z, vertex.position, c[11];
DP4 R1.x, vertex.position, c[9];
DP4 R1.y, vertex.position, c[10];
ADD R1.xyz, R1, -c[21];
DP3 result.texcoord[3].z, vertex.normal, R2;
DP3 result.texcoord[3].x, R2, vertex.attrib[14];
MOV result.texcoord[4].zw, R0;
MUL result.texcoord[6].xyz, R1, c[21].w;
MAD result.texcoord[0].zw, vertex.texcoord[0].xyxy, c[23].xyxy, c[23];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[22], c[22].zwzw;
MAD result.texcoord[1].zw, vertex.texcoord[0].xyxy, c[25].xyxy, c[25];
MAD result.texcoord[1].xy, vertex.texcoord[0], c[24], c[24].zwzw;
MAD result.texcoord[2].xy, vertex.texcoord[0], c[26], c[26].zwzw;
MAD result.texcoord[5].xy, vertex.texcoord[1], c[20], c[20].zwzw;
MUL result.texcoord[6].w, -R0.x, R0.y;
END
# 37 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_modelview0]
Matrix 4 [glstate_matrix_mvp]
Vector 16 [_ProjectionParams]
Vector 17 [_ScreenParams]
Vector 18 [unity_Scale]
Vector 19 [_WorldSpaceCameraPos]
Matrix 8 [_Object2World]
Matrix 12 [_World2Object]
Vector 20 [unity_LightmapST]
Vector 21 [unity_ShadowFadeCenterAndType]
Vector 22 [_DistortionMap_ST]
Vector 23 [_Texture1_ST]
Vector 24 [_Texture2_ST]
Vector 25 [_BumpMap1_ST]
Vector 26 [_BumpMap2_ST]
"vs_3_0
; 38 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c27, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r0.xyz, r0, v1.w
mov r1.xyz, c19
mov r1.w, c27.x
dp4 r0.w, v0, c7
dp4 r2.z, r1, c14
dp4 r2.x, r1, c12
dp4 r2.y, r1, c13
mad r2.xyz, r2, c18.w, -v0
dp3 o4.y, r2, r0
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
mul r1.xyz, r0.xyww, c27.y
mul r1.y, r1, c16.x
mad o5.xy, r1.z, c17.zwzw, r1
mov o0, r0
mov r0.x, c21.w
add r0.y, c27.x, -r0.x
dp4 r0.x, v0, c2
dp4 r1.z, v0, c10
dp4 r1.x, v0, c8
dp4 r1.y, v0, c9
add r1.xyz, r1, -c21
dp3 o4.z, v2, r2
dp3 o4.x, r2, v1
mov o5.zw, r0
mul o7.xyz, r1, c21.w
mad o1.zw, v3.xyxy, c23.xyxy, c23
mad o1.xy, v3, c22, c22.zwzw
mad o2.zw, v3.xyxy, c25.xyxy, c25
mad o2.xy, v3, c24, c24.zwzw
mad o3.xy, v3, c26, c26.zwzw
mad o6.xy, v4, c20, c20.zwzw
mul o7.w, -r0.x, r0.y
"
}

SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;
#define gl_ModelViewMatrix glstate_matrix_modelview0
uniform mat4 glstate_matrix_modelview0;

varying highp vec4 xlv_TEXCOORD6;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;


uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp vec4 o_i0;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * 0.5);
  o_i0 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_8 + tmpvar_7.w);
  o_i0.zw = tmpvar_6.zw;
  tmpvar_5.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_5.w = (-((gl_ModelViewMatrix * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = tmpvar_1.xyz;
  tmpvar_9[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_9[2] = tmpvar_2;
  mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_9[0].x;
  tmpvar_10[0].y = tmpvar_9[1].x;
  tmpvar_10[0].z = tmpvar_9[2].x;
  tmpvar_10[1].x = tmpvar_9[0].y;
  tmpvar_10[1].y = tmpvar_9[1].y;
  tmpvar_10[1].z = tmpvar_9[2].y;
  tmpvar_10[2].x = tmpvar_9[0].z;
  tmpvar_10[2].y = tmpvar_9[1].z;
  tmpvar_10[2].z = tmpvar_9[2].z;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_10 * (((_World2Object * tmpvar_11).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = o_i0;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
uniform sampler2D unity_Lightmap;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightBuffer;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c;
  mediump vec3 lmIndirect;
  mediump vec3 lmFull;
  mediump vec4 light;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = ((texture2D (_DistortionMap, tmpvar_10).xyz * 2.0) - 1.0);
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = ((AvgBump.xyz * 2.0) - 1.0);
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_2 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_3 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_4 = tmpvar_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_5 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  tmpvar_3 = normalize (tmpvar_3);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light = tmpvar_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = max (light, vec4(0.001, 0.001, 0.001, 0.001));
  light = tmpvar_36;
  lowp vec3 tmpvar_37;
  tmpvar_37 = (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD5).xyz);
  lmFull = tmpvar_37;
  lowp vec3 tmpvar_38;
  tmpvar_38 = (2.0 * texture2D (unity_LightmapInd, xlv_TEXCOORD5).xyz);
  lmIndirect = tmpvar_38;
  highp vec3 tmpvar_39;
  tmpvar_39 = vec3(clamp (((length (xlv_TEXCOORD6) * unity_LightmapFade.z) + unity_LightmapFade.w), 0.0, 1.0));
  light.xyz = (tmpvar_36.xyz + mix (lmIndirect, lmFull, tmpvar_39));
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_2 * light.xyz) + (light.xyz * (tmpvar_36.w * tmpvar_5)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  c.xyz = (c_i0.xyz + tmpvar_4);
  tmpvar_1 = c;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;
#define gl_ModelViewMatrix glstate_matrix_modelview0
uniform mat4 glstate_matrix_modelview0;

varying highp vec4 xlv_TEXCOORD6;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;


uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _Texture2_ST;
uniform highp vec4 _Texture1_ST;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _DistortionMap_ST;
uniform highp vec4 _BumpMap2_ST;
uniform highp vec4 _BumpMap1_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (gl_ModelViewProjectionMatrix * _glesVertex);
  tmpvar_3.xy = ((_glesMultiTexCoord0.xy * _DistortionMap_ST.xy) + _DistortionMap_ST.zw);
  tmpvar_3.zw = ((_glesMultiTexCoord0.xy * _Texture1_ST.xy) + _Texture1_ST.zw);
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _Texture2_ST.xy) + _Texture2_ST.zw);
  tmpvar_4.zw = ((_glesMultiTexCoord0.xy * _BumpMap1_ST.xy) + _BumpMap1_ST.zw);
  highp vec4 o_i0;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * 0.5);
  o_i0 = tmpvar_7;
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_8 + tmpvar_7.w);
  o_i0.zw = tmpvar_6.zw;
  tmpvar_5.xyz = (((_Object2World * _glesVertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w);
  tmpvar_5.w = (-((gl_ModelViewMatrix * _glesVertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = tmpvar_1.xyz;
  tmpvar_9[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_9[2] = tmpvar_2;
  mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_9[0].x;
  tmpvar_10[0].y = tmpvar_9[1].x;
  tmpvar_10[0].z = tmpvar_9[2].x;
  tmpvar_10[1].x = tmpvar_9[0].y;
  tmpvar_10[1].y = tmpvar_9[1].y;
  tmpvar_10[1].z = tmpvar_9[2].y;
  tmpvar_10[2].x = tmpvar_9[0].z;
  tmpvar_10[2].y = tmpvar_9[1].z;
  tmpvar_10[2].z = tmpvar_9[2].z;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _BumpMap2_ST.xy) + _BumpMap2_ST.zw);
  xlv_TEXCOORD3 = (tmpvar_10 * (((_World2Object * tmpvar_11).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD4 = o_i0;
  xlv_TEXCOORD5 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD6 = tmpvar_5;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD6;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec4 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD0;
uniform sampler2D unity_LightmapInd;
uniform highp vec4 unity_LightmapFade;
uniform sampler2D unity_Lightmap;
uniform highp vec4 _Time;
uniform mediump float _Texture2Speed;
uniform sampler2D _Texture2;
uniform sampler2D _Texture1;
uniform lowp float _Specular;
uniform sampler2D _Reflection;
uniform highp float _ReflectPower;
uniform highp float _Opacity;
uniform mediump float _MainTexSpeed;
uniform sampler2D _LightBuffer;
uniform mediump float _DistortionSpeed;
uniform mediump float _DistortionPower;
uniform sampler2D _DistortionMap;
uniform lowp vec4 _Color;
uniform sampler2D _BumpMap2;
uniform sampler2D _BumpMap1;
uniform mediump float _Bump2Speed;
uniform mediump float _Bump1Speed;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 c;
  mediump vec3 lmIndirect;
  mediump vec3 lmFull;
  mediump vec4 light;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  mediump vec3 tmpvar_5;
  mediump float tmpvar_6;
  lowp float FinalAlpha;
  lowp float TransparencyPower;
  lowp vec4 AvgBump;
  mediump vec2 Bump2UV;
  mediump float Multiply9;
  mediump vec4 Tex2D3;
  highp vec4 TexNReflex;
  highp vec4 Tex2D1;
  highp vec4 Tex2D0;
  highp vec4 Tex2D2;
  highp vec4 DistortNormal;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.x = xlv_TEXCOORD3.x;
  tmpvar_7.y = xlv_TEXCOORD3.y;
  tmpvar_7.z = (xlv_TEXCOORD3.z * 10.0);
  highp vec4 tmpvar_8;
  tmpvar_8 = normalize (tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9.x = ((tmpvar_8.x + 1.0) * 0.5);
  tmpvar_9.y = ((tmpvar_8.y + 1.0) * 0.5);
  highp vec2 tmpvar_10;
  tmpvar_10 = (xlv_TEXCOORD0.xy + (_DistortionSpeed * _Time).x);
  lowp vec3 normal;
  normal.xy = ((texture2D (_DistortionMap, tmpvar_10).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = normal;
  DistortNormal = tmpvar_11;
  highp vec2 tmpvar_12;
  tmpvar_12 = (DistortNormal.xy * _DistortionPower);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_Reflection, (tmpvar_9 + tmpvar_12));
  Tex2D2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14.x = xlv_TEXCOORD3.x;
  tmpvar_14.y = xlv_TEXCOORD3.y;
  tmpvar_14.z = xlv_TEXCOORD3.z;
  highp float tmpvar_15;
  tmpvar_15 = (1.0 - dot (normalize (tmpvar_14), vec3(0.0, 0.0, 1.0)));
  highp vec4 tmpvar_16;
  tmpvar_16 = (Tex2D2 * (_ReflectPower * tmpvar_15));
  highp vec2 tmpvar_17;
  tmpvar_17 = (xlv_TEXCOORD0.zw + (_Time * _MainTexSpeed).x);
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_Texture1, (tmpvar_17 + tmpvar_12));
  Tex2D0 = tmpvar_18;
  highp vec2 tmpvar_19;
  tmpvar_19 = (xlv_TEXCOORD1.xy + (_Time * _Texture2Speed).x);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_Texture2, (tmpvar_19 + tmpvar_12));
  Tex2D1 = tmpvar_20;
  highp vec4 tmpvar_21;
  tmpvar_21 = (tmpvar_16 + (Tex2D0 * Tex2D1));
  TexNReflex = tmpvar_21;
  TexNReflex.xy = (tmpvar_21.xy + tmpvar_12);
  highp vec2 tmpvar_22;
  tmpvar_22 = (xlv_TEXCOORD1.zw + (_Time * _Bump1Speed).x);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_BumpMap1, (tmpvar_22 + tmpvar_12));
  Tex2D3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_Time * _Bump2Speed).x;
  Multiply9 = tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = (xlv_TEXCOORD2 + Multiply9);
  Bump2UV = tmpvar_25;
  lowp vec4 tmpvar_26;
  tmpvar_26 = texture2D (_BumpMap2, (Bump2UV + tmpvar_12));
  mediump vec4 tmpvar_27;
  tmpvar_27 = ((Tex2D3 + tmpvar_26) / 2.0);
  AvgBump = tmpvar_27;
  lowp vec3 normal_i0;
  normal_i0.xy = ((AvgBump.wy * 2.0) - 1.0);
  normal_i0.z = sqrt (((1.0 - (normal_i0.x * normal_i0.x)) - (normal_i0.y * normal_i0.y)));
  lowp vec4 tmpvar_28;
  tmpvar_28.w = 1.0;
  tmpvar_28.xyz = normal_i0;
  highp float tmpvar_29;
  tmpvar_29 = (tmpvar_15 * vec4(0.8, 0.8, 0.8, 0.8)).x;
  TransparencyPower = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (TransparencyPower + _Opacity);
  FinalAlpha = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Color * TexNReflex).xyz;
  tmpvar_2 = tmpvar_31;
  lowp vec3 tmpvar_32;
  tmpvar_32 = tmpvar_28.xyz;
  tmpvar_3 = tmpvar_32;
  highp vec3 tmpvar_33;
  tmpvar_33 = tmpvar_16.xyz;
  tmpvar_4 = tmpvar_33;
  lowp vec3 tmpvar_34;
  tmpvar_34 = vec3(_Specular);
  tmpvar_5 = tmpvar_34;
  tmpvar_6 = FinalAlpha;
  tmpvar_3 = normalize (tmpvar_3);
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2DProj (_LightBuffer, xlv_TEXCOORD4);
  light = tmpvar_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = max (light, vec4(0.001, 0.001, 0.001, 0.001));
  light = tmpvar_36;
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (unity_Lightmap, xlv_TEXCOORD5);
  lowp vec3 tmpvar_38;
  tmpvar_38 = ((8.0 * tmpvar_37.w) * tmpvar_37.xyz);
  lmFull = tmpvar_38;
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (unity_LightmapInd, xlv_TEXCOORD5);
  lowp vec3 tmpvar_40;
  tmpvar_40 = ((8.0 * tmpvar_39.w) * tmpvar_39.xyz);
  lmIndirect = tmpvar_40;
  highp vec3 tmpvar_41;
  tmpvar_41 = vec3(clamp (((length (xlv_TEXCOORD6) * unity_LightmapFade.z) + unity_LightmapFade.w), 0.0, 1.0));
  light.xyz = (tmpvar_36.xyz + mix (lmIndirect, lmFull, tmpvar_41));
  mediump vec4 c_i0;
  c_i0.xyz = ((tmpvar_2 * light.xyz) + (light.xyz * (tmpvar_36.w * tmpvar_5)));
  c_i0.w = tmpvar_6;
  c = c_i0;
  c.xyz = (c_i0.xyz + tmpvar_4);
  tmpvar_1 = c;
  gl_FragData[0] = tmpvar_1;
}



#endif"
}

}
Program "fp" {
// Fragment combos: 4
//   opengl - ALU: 38 to 54, TEX: 5 to 7
//   d3d9 - ALU: 33 to 47, TEX: 5 to 7
SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_Time]
Vector 1 [_Color]
Float 2 [_MainTexSpeed]
Float 4 [_Texture2Speed]
Float 6 [_DistortionSpeed]
Float 7 [_DistortionPower]
Float 8 [_Specular]
Float 9 [_Opacity]
Float 10 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 6 [_LightBuffer] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 42 ALU, 5 TEX
PARAM c[13] = { program.local[0..10],
		{ 1, 10, 0, 2 },
		{ 0.5, 0.80000001 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, fragment.texcoord[3], c[11].xxyw;
MOV R0.w, c[11].z;
DP4 R0.x, R0, R0;
RSQ R0.x, R0.x;
MAD R0.y, R0.x, fragment.texcoord[3].x, c[11].x;
MUL R1.x, R0.y, c[12];
MAD R0.y, R0.x, fragment.texcoord[3], c[11].x;
MUL R1.y, R0, c[12].x;
MOV R0.x, c[0];
MAD R0.xy, R0.x, c[6].x, fragment.texcoord[0];
TEX R0.yw, R0, texture[0], 2D;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.z;
MAD R3.xy, R0.wyzw, c[11].w, -c[11].x;
MAD R1.w, fragment.texcoord[3].z, -R0.x, c[11].x;
MAD R0.xy, R3, c[7].x, R1;
TEX R0.xyz, R0, texture[1], 2D;
MUL R0.w, R1, c[10].x;
MUL R2.xyz, R0, R0.w;
MOV R0.x, c[2];
MOV R0.z, c[4].x;
MAD R0.zw, R0.z, c[0].x, fragment.texcoord[1].xyxy;
MAD R1.xy, R3, c[7].x, R0.zwzw;
MAD R0.xy, R0.x, c[0].x, fragment.texcoord[0].zwzw;
MAD R0.xy, R3, c[7].x, R0;
TEX R0.xyz, R0, texture[2], 2D;
TEX R1.xyz, R1, texture[3], 2D;
MAD R1.xyz, R0, R1, R2;
TXP R0, fragment.texcoord[4], texture[6], 2D;
MAD R1.xy, R3, c[7].x, R1;
LG2 R0.w, R0.w;
MUL R0.w, -R0, c[8].x;
LG2 R0.x, R0.x;
LG2 R0.z, R0.z;
LG2 R0.y, R0.y;
ADD R0.xyz, -R0, fragment.texcoord[5];
MUL R3.xyz, R0, R0.w;
MUL R1.xyz, R1, c[1];
MAD R0.xyz, R1, R0, R3;
MUL R0.w, R1, c[12].y;
ADD result.color.xyz, R0, R2;
ADD result.color.w, R0, c[9].x;
END
# 42 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_Time]
Vector 1 [_Color]
Float 2 [_MainTexSpeed]
Float 3 [_Texture2Speed]
Float 4 [_DistortionSpeed]
Float 5 [_DistortionPower]
Float 6 [_Specular]
Float 7 [_Opacity]
Float 8 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 6 [_LightBuffer] 2D
"ps_3_0
; 37 ALU, 5 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s6
def c9, 2.00000000, -1.00000000, 1.00000000, 10.00000000
def c10, 0.00000000, 0.50000000, 0.80000001, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4
dcl_texcoord5 v5.xyz
mul r0.xyz, v3, c9.zzww
mov r0.w, c10.x
dp4 r0.x, r0, r0
rsq r0.x, r0.x
mad r0.y, r0.x, v3.x, c9.z
mul r1.x, r0.y, c10.y
mad r0.y, r0.x, v3, c9.z
mul r1.y, r0, c10
mov r0.x, c4
mad r0.xy, c0.x, r0.x, v0
texld r0.yw, r0, s0
dp3 r0.z, v3, v3
rsq r0.x, r0.z
mad_pp r3.xy, r0.wyzw, c9.x, c9.y
mad r1.w, v3.z, -r0.x, c9.z
mad r0.xy, r3, c5.x, r1
texld r0.xyz, r0, s1
mul r0.w, r1, c8.x
mul r2.xyz, r0, r0.w
mov r0.x, c0
mov r0.z, c0.x
mad r0.zw, c3.x, r0.z, v1.xyxy
mad r1.xy, r3, c5.x, r0.zwzw
mad r0.xy, c2.x, r0.x, v0.zwzw
mad r0.xy, r3, c5.x, r0
texld r0.xyz, r0, s2
texld r1.xyz, r1, s3
mad r1.xyz, r0, r1, r2
texldp r0, v4, s6
mad r1.xy, r3, c5.x, r1
log_pp r0.w, r0.w
mul_pp r0.w, -r0, c6.x
log_pp r0.x, r0.x
log_pp r0.z, r0.z
log_pp r0.y, r0.y
add_pp r0.xyz, -r0, v5
mul_pp r3.xyz, r0, r0.w
mul r1.xyz, r1, c1
mad_pp r0.xyz, r1, r0, r3
mul r0.w, r1, c10.z
add_pp oC0.xyz, r0, r2
add oC0.w, r0, c7.x
"
}

SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_Time]
Vector 1 [_Color]
Float 2 [_MainTexSpeed]
Float 4 [_Texture2Speed]
Float 6 [_DistortionSpeed]
Float 7 [_DistortionPower]
Float 8 [_Specular]
Float 9 [_Opacity]
Float 10 [_ReflectPower]
Vector 11 [unity_LightmapFade]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 6 [_LightBuffer] 2D
SetTexture 7 [unity_Lightmap] 2D
SetTexture 8 [unity_LightmapInd] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 54 ALU, 7 TEX
PARAM c[14] = { program.local[0..11],
		{ 1, 10, 0, 2 },
		{ 0.5, 8, 0.80000001 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R0.xyz, fragment.texcoord[3], c[12].xxyw;
MOV R0.w, c[12].z;
DP4 R0.x, R0, R0;
RSQ R0.x, R0.x;
MAD R0.y, R0.x, fragment.texcoord[3].x, c[12].x;
MUL R1.x, R0.y, c[13];
MAD R0.y, R0.x, fragment.texcoord[3], c[12].x;
MUL R1.y, R0, c[13].x;
MOV R0.x, c[0];
MAD R0.xy, R0.x, c[6].x, fragment.texcoord[0];
TEX R0.yw, R0, texture[0], 2D;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.z;
MAD R2.xy, R0.wyzw, c[12].w, -c[12].x;
MAD R2.w, fragment.texcoord[3].z, -R0.x, c[12].x;
MAD R0.xy, R2, c[7].x, R1;
TEX R0.xyz, R0, texture[1], 2D;
MUL R0.w, R2, c[10].x;
MUL R3.xyz, R0, R0.w;
MOV R0.x, c[2];
MOV R0.z, c[4].x;
MAD R0.zw, R0.z, c[0].x, fragment.texcoord[1].xyxy;
MAD R1.xy, R2, c[7].x, R0.zwzw;
MAD R0.xy, R0.x, c[0].x, fragment.texcoord[0].zwzw;
MAD R0.xy, R2, c[7].x, R0;
TEX R1.xyz, R1, texture[3], 2D;
TEX R0.xyz, R0, texture[2], 2D;
MAD R0.xyz, R0, R1, R3;
TEX R1, fragment.texcoord[5], texture[8], 2D;
MUL R1.xyz, R1.w, R1;
MAD R2.xy, R2, c[7].x, R0;
MOV R2.z, R0;
TEX R0, fragment.texcoord[5], texture[7], 2D;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, R1, c[13].y;
DP4 R0.w, fragment.texcoord[6], fragment.texcoord[6];
RSQ R1.w, R0.w;
MAD R4.xyz, R0, c[13].y, -R1;
TXP R0, fragment.texcoord[4], texture[6], 2D;
RCP R1.w, R1.w;
LG2 R0.w, R0.w;
MAD_SAT R1.w, R1, c[11].z, c[11];
MAD R1.xyz, R1.w, R4, R1;
MUL R0.w, -R0, c[8].x;
LG2 R0.x, R0.x;
LG2 R0.y, R0.y;
LG2 R0.z, R0.z;
ADD R0.xyz, -R0, R1;
MUL R1.xyz, R0, R0.w;
MUL R2.xyz, R2, c[1];
MAD R0.xyz, R2, R0, R1;
MUL R0.w, R2, c[13].z;
ADD result.color.xyz, R0, R3;
ADD result.color.w, R0, c[9].x;
END
# 54 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
Vector 0 [_Time]
Vector 1 [_Color]
Float 2 [_MainTexSpeed]
Float 3 [_Texture2Speed]
Float 4 [_DistortionSpeed]
Float 5 [_DistortionPower]
Float 6 [_Specular]
Float 7 [_Opacity]
Float 8 [_ReflectPower]
Vector 9 [unity_LightmapFade]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 6 [_LightBuffer] 2D
SetTexture 7 [unity_Lightmap] 2D
SetTexture 8 [unity_LightmapInd] 2D
"ps_3_0
; 47 ALU, 7 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s6
dcl_2d s7
dcl_2d s8
def c10, 2.00000000, -1.00000000, 1.00000000, 10.00000000
def c11, 0.00000000, 0.50000000, 8.00000000, 0.80000001
dcl_texcoord0 v0
dcl_texcoord1 v1.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4
dcl_texcoord5 v5.xy
dcl_texcoord6 v6
mul r0.xyz, v3, c10.zzww
mov r0.w, c11.x
dp4 r0.x, r0, r0
rsq r0.x, r0.x
mad r0.y, r0.x, v3.x, c10.z
mul r1.x, r0.y, c11.y
mad r0.y, r0.x, v3, c10.z
mul r1.y, r0, c11
mov r0.x, c4
mad r0.xy, c0.x, r0.x, v0
texld r0.yw, r0, s0
dp3 r0.z, v3, v3
rsq r0.x, r0.z
mad_pp r2.xy, r0.wyzw, c10.x, c10.y
mad r2.w, v3.z, -r0.x, c10.z
mad r0.xy, r2, c5.x, r1
texld r0.xyz, r0, s1
mul r0.w, r2, c8.x
mul r3.xyz, r0, r0.w
mov r0.x, c0
mov r0.y, c0.x
mad r0.zw, c3.x, r0.y, v1.xyxy
mad r1.xy, c2.x, r0.x, v0.zwzw
mad r0.xy, r2, c5.x, r1
mad r1.xy, r2, c5.x, r0.zwzw
texld r1.xyz, r1, s3
texld r0.xyz, r0, s2
mad r0.xyz, r0, r1, r3
texld r1, v5, s8
mul_pp r1.xyz, r1.w, r1
mad r2.xy, r2, c5.x, r0
mov r2.z, r0
texld r0, v5, s7
mul_pp r0.xyz, r0.w, r0
mul_pp r1.xyz, r1, c11.z
dp4 r0.w, v6, v6
rsq r1.w, r0.w
mad_pp r4.xyz, r0, c11.z, -r1
texldp r0, v4, s6
rcp r1.w, r1.w
log_pp r0.w, r0.w
mad_sat r1.w, r1, c9.z, c9
mad_pp r1.xyz, r1.w, r4, r1
mul_pp r0.w, -r0, c6.x
log_pp r0.x, r0.x
log_pp r0.y, r0.y
log_pp r0.z, r0.z
add_pp r0.xyz, -r0, r1
mul_pp r1.xyz, r0, r0.w
mul r2.xyz, r2, c1
mad_pp r0.xyz, r2, r0, r1
mul r0.w, r2, c11
add_pp oC0.xyz, r0, r3
add oC0.w, r0, c7.x
"
}

SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_Time]
Vector 1 [_Color]
Float 2 [_MainTexSpeed]
Float 4 [_Texture2Speed]
Float 6 [_DistortionSpeed]
Float 7 [_DistortionPower]
Float 8 [_Specular]
Float 9 [_Opacity]
Float 10 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 6 [_LightBuffer] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 38 ALU, 5 TEX
PARAM c[13] = { program.local[0..10],
		{ 1, 10, 0, 2 },
		{ 0.5, 0.80000001 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R0.xyz, fragment.texcoord[3], c[11].xxyw;
MOV R0.w, c[11].z;
DP4 R0.x, R0, R0;
RSQ R0.x, R0.x;
MAD R0.y, R0.x, fragment.texcoord[3].x, c[11].x;
MUL R1.x, R0.y, c[12];
MAD R0.y, R0.x, fragment.texcoord[3], c[11].x;
MUL R1.y, R0, c[12].x;
MOV R0.x, c[0];
MAD R0.xy, R0.x, c[6].x, fragment.texcoord[0];
TEX R0.yw, R0, texture[0], 2D;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.z;
MAD R3.xy, R0.wyzw, c[11].w, -c[11].x;
MAD R1.w, fragment.texcoord[3].z, -R0.x, c[11].x;
MAD R0.xy, R3, c[7].x, R1;
TEX R0.xyz, R0, texture[1], 2D;
MUL R0.w, R1, c[10].x;
MUL R2.xyz, R0, R0.w;
MOV R0.x, c[2];
MOV R0.z, c[4].x;
MAD R0.zw, R0.z, c[0].x, fragment.texcoord[1].xyxy;
MAD R1.xy, R3, c[7].x, R0.zwzw;
MAD R0.xy, R0.x, c[0].x, fragment.texcoord[0].zwzw;
MAD R0.xy, R3, c[7].x, R0;
TEX R0.xyz, R0, texture[2], 2D;
TEX R1.xyz, R1, texture[3], 2D;
MAD R1.xyz, R0, R1, R2;
TXP R0, fragment.texcoord[4], texture[6], 2D;
MAD R1.xy, R3, c[7].x, R1;
MUL R0.w, R0, c[8].x;
ADD R0.xyz, R0, fragment.texcoord[5];
MUL R3.xyz, R0, R0.w;
MUL R1.xyz, R1, c[1];
MAD R0.xyz, R1, R0, R3;
MUL R0.w, R1, c[12].y;
ADD result.color.xyz, R0, R2;
ADD result.color.w, R0, c[9].x;
END
# 38 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_Time]
Vector 1 [_Color]
Float 2 [_MainTexSpeed]
Float 3 [_Texture2Speed]
Float 4 [_DistortionSpeed]
Float 5 [_DistortionPower]
Float 6 [_Specular]
Float 7 [_Opacity]
Float 8 [_ReflectPower]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 6 [_LightBuffer] 2D
"ps_3_0
; 33 ALU, 5 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s6
def c9, 2.00000000, -1.00000000, 1.00000000, 10.00000000
def c10, 0.00000000, 0.50000000, 0.80000001, 0
dcl_texcoord0 v0
dcl_texcoord1 v1.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4
dcl_texcoord5 v5.xyz
mul r0.xyz, v3, c9.zzww
mov r0.w, c10.x
dp4 r0.x, r0, r0
rsq r0.x, r0.x
mad r0.y, r0.x, v3.x, c9.z
mul r1.x, r0.y, c10.y
mad r0.y, r0.x, v3, c9.z
mul r1.y, r0, c10
mov r0.x, c4
mad r0.xy, c0.x, r0.x, v0
texld r0.yw, r0, s0
dp3 r0.z, v3, v3
rsq r0.x, r0.z
mad_pp r3.xy, r0.wyzw, c9.x, c9.y
mad r1.w, v3.z, -r0.x, c9.z
mad r0.xy, r3, c5.x, r1
texld r0.xyz, r0, s1
mul r0.w, r1, c8.x
mul r2.xyz, r0, r0.w
mov r0.x, c0
mov r0.z, c0.x
mad r0.zw, c3.x, r0.z, v1.xyxy
mad r1.xy, r3, c5.x, r0.zwzw
mad r0.xy, c2.x, r0.x, v0.zwzw
mad r0.xy, r3, c5.x, r0
texld r0.xyz, r0, s2
texld r1.xyz, r1, s3
mad r1.xyz, r0, r1, r2
texldp r0, v4, s6
mad r1.xy, r3, c5.x, r1
mul_pp r0.w, r0, c6.x
add_pp r0.xyz, r0, v5
mul_pp r3.xyz, r0, r0.w
mul r1.xyz, r1, c1
mad_pp r0.xyz, r1, r0, r3
mul r0.w, r1, c10.z
add_pp oC0.xyz, r0, r2
add oC0.w, r0, c7.x
"
}

SubProgram "gles " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_Time]
Vector 1 [_Color]
Float 2 [_MainTexSpeed]
Float 4 [_Texture2Speed]
Float 6 [_DistortionSpeed]
Float 7 [_DistortionPower]
Float 8 [_Specular]
Float 9 [_Opacity]
Float 10 [_ReflectPower]
Vector 11 [unity_LightmapFade]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 6 [_LightBuffer] 2D
SetTexture 7 [unity_Lightmap] 2D
SetTexture 8 [unity_LightmapInd] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 50 ALU, 7 TEX
PARAM c[14] = { program.local[0..11],
		{ 1, 10, 0, 2 },
		{ 0.5, 8, 0.80000001 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R0.xyz, fragment.texcoord[3], c[12].xxyw;
MOV R0.w, c[12].z;
DP4 R0.x, R0, R0;
RSQ R0.x, R0.x;
MAD R0.y, R0.x, fragment.texcoord[3].x, c[12].x;
MUL R1.x, R0.y, c[13];
MAD R0.y, R0.x, fragment.texcoord[3], c[12].x;
MUL R1.y, R0, c[13].x;
MOV R0.x, c[0];
MAD R0.xy, R0.x, c[6].x, fragment.texcoord[0];
TEX R0.yw, R0, texture[0], 2D;
DP3 R0.z, fragment.texcoord[3], fragment.texcoord[3];
RSQ R0.x, R0.z;
MAD R2.xy, R0.wyzw, c[12].w, -c[12].x;
MAD R2.w, fragment.texcoord[3].z, -R0.x, c[12].x;
MAD R0.xy, R2, c[7].x, R1;
TEX R0.xyz, R0, texture[1], 2D;
MUL R0.w, R2, c[10].x;
MUL R3.xyz, R0, R0.w;
MOV R0.x, c[2];
MOV R0.z, c[4].x;
MAD R0.zw, R0.z, c[0].x, fragment.texcoord[1].xyxy;
MAD R1.xy, R2, c[7].x, R0.zwzw;
MAD R0.xy, R0.x, c[0].x, fragment.texcoord[0].zwzw;
MAD R0.xy, R2, c[7].x, R0;
TEX R1.xyz, R1, texture[3], 2D;
TEX R0.xyz, R0, texture[2], 2D;
MAD R0.xyz, R0, R1, R3;
TEX R1, fragment.texcoord[5], texture[8], 2D;
MUL R1.xyz, R1.w, R1;
MAD R2.xy, R2, c[7].x, R0;
MOV R2.z, R0;
TEX R0, fragment.texcoord[5], texture[7], 2D;
MUL R0.xyz, R0.w, R0;
MUL R1.xyz, R1, c[13].y;
DP4 R0.w, fragment.texcoord[6], fragment.texcoord[6];
RSQ R0.w, R0.w;
RCP R1.w, R0.w;
MAD R4.xyz, R0, c[13].y, -R1;
TXP R0, fragment.texcoord[4], texture[6], 2D;
MAD_SAT R1.w, R1, c[11].z, c[11];
MAD R1.xyz, R1.w, R4, R1;
ADD R0.xyz, R0, R1;
MUL R0.w, R0, c[8].x;
MUL R1.xyz, R0, R0.w;
MUL R2.xyz, R2, c[1];
MAD R0.xyz, R2, R0, R1;
MUL R0.w, R2, c[13].z;
ADD result.color.xyz, R0, R3;
ADD result.color.w, R0, c[9].x;
END
# 50 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
Vector 0 [_Time]
Vector 1 [_Color]
Float 2 [_MainTexSpeed]
Float 3 [_Texture2Speed]
Float 4 [_DistortionSpeed]
Float 5 [_DistortionPower]
Float 6 [_Specular]
Float 7 [_Opacity]
Float 8 [_ReflectPower]
Vector 9 [unity_LightmapFade]
SetTexture 0 [_DistortionMap] 2D
SetTexture 1 [_Reflection] 2D
SetTexture 2 [_Texture1] 2D
SetTexture 3 [_Texture2] 2D
SetTexture 6 [_LightBuffer] 2D
SetTexture 7 [unity_Lightmap] 2D
SetTexture 8 [unity_LightmapInd] 2D
"ps_3_0
; 43 ALU, 7 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s6
dcl_2d s7
dcl_2d s8
def c10, 2.00000000, -1.00000000, 1.00000000, 10.00000000
def c11, 0.00000000, 0.50000000, 8.00000000, 0.80000001
dcl_texcoord0 v0
dcl_texcoord1 v1.xy
dcl_texcoord3 v3.xyz
dcl_texcoord4 v4
dcl_texcoord5 v5.xy
dcl_texcoord6 v6
mul r0.xyz, v3, c10.zzww
mov r0.w, c11.x
dp4 r0.x, r0, r0
rsq r0.x, r0.x
mad r0.y, r0.x, v3.x, c10.z
mul r1.x, r0.y, c11.y
mad r0.y, r0.x, v3, c10.z
mul r1.y, r0, c11
mov r0.x, c4
mad r0.xy, c0.x, r0.x, v0
texld r0.yw, r0, s0
dp3 r0.z, v3, v3
rsq r0.x, r0.z
mad_pp r2.xy, r0.wyzw, c10.x, c10.y
mad r2.w, v3.z, -r0.x, c10.z
mad r0.xy, r2, c5.x, r1
texld r0.xyz, r0, s1
mul r0.w, r2, c8.x
mul r3.xyz, r0, r0.w
mov r0.x, c0
mov r0.y, c0.x
mad r0.zw, c3.x, r0.y, v1.xyxy
mad r1.xy, c2.x, r0.x, v0.zwzw
mad r0.xy, r2, c5.x, r1
mad r1.xy, r2, c5.x, r0.zwzw
texld r1.xyz, r1, s3
texld r0.xyz, r0, s2
mad r0.xyz, r0, r1, r3
texld r1, v5, s8
mul_pp r1.xyz, r1.w, r1
mad r2.xy, r2, c5.x, r0
mov r2.z, r0
texld r0, v5, s7
mul_pp r0.xyz, r0.w, r0
mul_pp r1.xyz, r1, c11.z
dp4 r0.w, v6, v6
rsq r0.w, r0.w
rcp r1.w, r0.w
mad_pp r4.xyz, r0, c11.z, -r1
texldp r0, v4, s6
mad_sat r1.w, r1, c9.z, c9
mad_pp r1.xyz, r1.w, r4, r1
add_pp r0.xyz, r0, r1
mul_pp r0.w, r0, c6.x
mul_pp r1.xyz, r0, r0.w
mul r2.xyz, r2, c1
mad_pp r0.xyz, r2, r0, r1
mul r0.w, r2, c11
add_pp oC0.xyz, r0, r3
add oC0.w, r0, c7.x
"
}

SubProgram "gles " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_ON" }
"!!GLES"
}

}
	}

#LINE 213

	}
	Fallback "Diffuse"
}