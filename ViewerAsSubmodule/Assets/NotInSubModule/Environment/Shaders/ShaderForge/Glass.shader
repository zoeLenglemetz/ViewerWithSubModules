// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.06 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.06;sub:START;pass:START;ps:flbk:Reflective/Diffuse,lico:1,lgpr:1,nrmq:1,limd:2,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:True,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:1,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,dith:0,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3157,x:34099,y:32540,varname:node_3157,prsc:2|diff-9273-OUT,spec-7329-OUT,gloss-2765-OUT,normal-4283-RGB,amdfl-6236-OUT,amspl-1570-OUT,alpha-2800-OUT;n:type:ShaderForge.SFN_Tex2d,id:5306,x:32757,y:31863,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:_Diffuse,prsc:0,tex:66bb156175038a941924f54917606424,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:8450,x:32572,y:32392,ptovrint:False,ptlb:Specular_Intensity,ptin:_Specular_Intensity,varname:_Specular_Intensity,prsc:0,min:0,cur:0,max:2;n:type:ShaderForge.SFN_Slider,id:2765,x:32572,y:32537,ptovrint:False,ptlb:Glossiness,ptin:_Glossiness,varname:_Glossiness,prsc:0,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:7725,x:32589,y:33000,ptovrint:False,ptlb:Diffuse_Reflexion_Factor,ptin:_Diffuse_Reflexion_Factor,varname:_Diffuse_Reflexion_Factor,prsc:0,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:1570,x:32858,y:33472,ptovrint:False,ptlb:Specular_Reflexion_Intensity,ptin:_Specular_Reflexion_Intensity,varname:_Specular_Reflexion_Intensity,prsc:0,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:2540,x:32729,y:32164,ptovrint:False,ptlb:Specular,ptin:_Specular,varname:_Specular,prsc:0,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:6261,x:32757,y:31650,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:0,glob:False,c1:0.9485294,c2:0.09066822,c3:0.09066822,c4:1;n:type:ShaderForge.SFN_Add,id:6236,x:33000,y:33057,varname:node_6236,prsc:2|A-7725-OUT,B-1948-OUT;n:type:ShaderForge.SFN_Slider,id:1948,x:32546,y:33252,ptovrint:False,ptlb:Diffuse_Reflexion_Intensity,ptin:_Diffuse_Reflexion_Intensity,varname:_Diffuse_Reflexion_Intensity,prsc:1,min:-0.5,cur:-0.1433418,max:0.5;n:type:ShaderForge.SFN_Multiply,id:7329,x:32977,y:32171,varname:node_7329,prsc:2|A-2540-RGB,B-8450-OUT;n:type:ShaderForge.SFN_Tex2d,id:4283,x:32668,y:32707,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:_Normal,prsc:2,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Multiply,id:9273,x:32993,y:31797,varname:node_9273,prsc:2|A-6261-RGB,B-5306-RGB;n:type:ShaderForge.SFN_Multiply,id:2800,x:32993,y:31989,varname:node_2800,prsc:2|A-6261-A,B-5306-A;proporder:6261-5306-2540-8450-2765-7725-1948-1570-4283;pass:END;sub:END;*/

Shader "TGD/Glass" {
    Properties {
        _Color ("Color", Color) = (0.9485294,0.09066822,0.09066822,1)
        _Diffuse ("Diffuse", 2D) = "white" {}
        _Specular ("Specular", 2D) = "white" {}
        _Specular_Intensity ("Specular_Intensity", Range(0, 2)) = 0
        _Glossiness ("Glossiness", Range(0, 1)) = 0
        _Diffuse_Reflexion_Factor ("Diffuse_Reflexion_Factor", Range(0, 1)) = 0
        _Diffuse_Reflexion_Intensity ("Diffuse_Reflexion_Intensity", Range(-0.5, 0.5)) = -0.1433418
        _Specular_Reflexion_Intensity ("Specular_Reflexion_Intensity", Range(0, 1)) = 0
        _Normal ("Normal", 2D) = "bump" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform fixed _Specular_Intensity;
            uniform fixed _Glossiness;
            uniform fixed _Diffuse_Reflexion_Factor;
            uniform fixed _Specular_Reflexion_Intensity;
            uniform sampler2D _Specular; uniform float4 _Specular_ST;
            uniform fixed4 _Color;
            uniform half _Diffuse_Reflexion_Intensity;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(unity_ObjectToWorld, float4(v.normal,0)).xyz;
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal)));
                float3 normalLocal = _Normal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Glossiness;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                fixed4 _Specular_var = tex2D(_Specular,TRANSFORM_TEX(i.uv0, _Specular));
                float3 specularColor = (_Specular_var.rgb*_Specular_Intensity);
                float specularMonochrome = dot(specularColor,float3(0.3,0.59,0.11));
                float normTerm = (specPow + 2.0 ) / (2.0 * Pi);
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(reflect(-lightDirection, normalDirection),viewDirection)),specPow)*normTerm;
                float3 indirectSpecular = (0 + float3(_Specular_Reflexion_Intensity,_Specular_Reflexion_Intensity,_Specular_Reflexion_Intensity));
                float3 specular = (directSpecular + indirectSpecular) * specularColor;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 indirectDiffuse = float3(0,0,0);
                float3 directDiffuse = max( 0.0, NdotL)*InvPi * attenColor;
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float node_6236 = (_Diffuse_Reflexion_Factor+_Diffuse_Reflexion_Intensity);
                indirectDiffuse += float3(node_6236,node_6236,node_6236); // Diffuse Ambient Light
                fixed4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float3 diffuse = (directDiffuse + indirectDiffuse) * (_Color.rgb*_Diffuse_var.rgb);
                diffuse *= 1-specularMonochrome;
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor,(_Color.a*_Diffuse_var.a));
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform fixed _Specular_Intensity;
            uniform fixed _Glossiness;
            uniform sampler2D _Specular; uniform float4 _Specular_ST;
            uniform fixed4 _Color;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(unity_ObjectToWorld, float4(v.normal,0)).xyz;
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal)));
                float3 normalLocal = _Normal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Glossiness;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                fixed4 _Specular_var = tex2D(_Specular,TRANSFORM_TEX(i.uv0, _Specular));
                float3 specularColor = (_Specular_var.rgb*_Specular_Intensity);
                float specularMonochrome = dot(specularColor,float3(0.3,0.59,0.11));
                float normTerm = (specPow + 2.0 ) / (2.0 * Pi);
                float3 directSpecular = attenColor * pow(max(0,dot(reflect(-lightDirection, normalDirection),viewDirection)),specPow)*normTerm;
                float3 specular = directSpecular * specularColor;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL)*InvPi * attenColor;
                fixed4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float3 diffuse = directDiffuse * (_Color.rgb*_Diffuse_var.rgb);
                diffuse *= 1-specularMonochrome;
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor * (_Color.a*_Diffuse_var.a),0);
            }
            ENDCG
        }
    }
    FallBack "Reflective/Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
