// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.06 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.06;sub:START;pass:START;ps:flbk:Reflective/Diffuse,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,rprd:False,enco:False,frtr:True,vitr:True,dbil:True,rmgx:True,rpth:1,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3157,x:34222,y:32533,varname:node_3157,prsc:2|diff-7427-OUT,spec-7329-OUT,gloss-2765-OUT,normal-4283-RGB,amdfl-6236-OUT,amspl-7294-OUT;n:type:ShaderForge.SFN_Tex2d,id:5306,x:33202,y:31826,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:_Diffuse,prsc:0,tex:66bb156175038a941924f54917606424,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:8450,x:33122,y:32553,ptovrint:False,ptlb:Specular_Intensity,ptin:_Specular_Intensity,varname:_Specular_Intensity,prsc:0,min:0,cur:0,max:2;n:type:ShaderForge.SFN_Slider,id:2765,x:33122,y:32692,ptovrint:False,ptlb:Glossiness,ptin:_Glossiness,varname:_Glossiness,prsc:0,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Cubemap,id:6394,x:33015,y:32893,ptovrint:False,ptlb:Diffuse_Reflexion_Cubemap,ptin:_Diffuse_Reflexion_Cubemap,varname:_Diffuse_Reflexion_Cubemap,prsc:1,cube:590c96e6d90e8f94f89cf9f137ad44d7,pvfc:0|DIR-5350-OUT;n:type:ShaderForge.SFN_NormalVector,id:5350,x:32814,y:32893,prsc:2,pt:True;n:type:ShaderForge.SFN_Multiply,id:1573,x:33266,y:32893,varname:node_1573,prsc:2|A-6394-RGB,B-7725-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:2715,x:33141,y:33352,varname:node_2715,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7086,x:33765,y:33185,varname:node_7086,prsc:2|A-2544-RGB,B-1570-OUT;n:type:ShaderForge.SFN_Cubemap,id:2544,x:33498,y:33362,ptovrint:False,ptlb:Specular_Reflexion_Cubemap,ptin:_Specular_Reflexion_Cubemap,varname:_Specular_Reflexion_Cubemap,prsc:1,cube:590c96e6d90e8f94f89cf9f137ad44d7,pvfc:0|DIR-2715-OUT;n:type:ShaderForge.SFN_Slider,id:7725,x:32937,y:33120,ptovrint:False,ptlb:Diffuse_Reflexion_Factor,ptin:_Diffuse_Reflexion_Factor,varname:_Diffuse_Reflexion_Factor,prsc:0,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:1570,x:33311,y:33628,ptovrint:False,ptlb:Specular_Reflexion_Factor,ptin:_Specular_Reflexion_Factor,varname:_Specular_Reflexion_Factor,prsc:0,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:2540,x:33149,y:32326,ptovrint:False,ptlb:Specular,ptin:_Specular,varname:_Specular,prsc:0,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:6261,x:33202,y:32067,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:0,glob:False,c1:0.9485294,c2:0.09066822,c3:0.09066822,c4:1;n:type:ShaderForge.SFN_Add,id:6236,x:33607,y:32946,varname:node_6236,prsc:2|A-1573-OUT,B-1948-OUT;n:type:ShaderForge.SFN_Slider,id:1948,x:33249,y:33198,ptovrint:False,ptlb:Diffuse_Reflexion_Intensity,ptin:_Diffuse_Reflexion_Intensity,varname:_Diffuse_Reflexion_Intensity,prsc:1,min:-0.5,cur:-0.1433418,max:0.5;n:type:ShaderForge.SFN_Slider,id:330,x:32850,y:32023,ptovrint:False,ptlb:Lerp_Diffuse,ptin:_Lerp_Diffuse,varname:_Lerp_Diffuse,prsc:2,min:0,cur:0.5385242,max:1;n:type:ShaderForge.SFN_Lerp,id:9388,x:33602,y:31940,varname:node_9388,prsc:2|A-5306-RGB,B-6261-RGB,T-330-OUT;n:type:ShaderForge.SFN_Multiply,id:7329,x:33434,y:32389,varname:node_7329,prsc:2|A-2540-RGB,B-8450-OUT;n:type:ShaderForge.SFN_Tex2d,id:4283,x:33501,y:32746,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:_Normal,prsc:2,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Add,id:2998,x:33610,y:31779,varname:node_2998,prsc:2|A-5306-RGB,B-6261-RGB;n:type:ShaderForge.SFN_Multiply,id:7427,x:33684,y:32093,varname:node_7427,prsc:2|A-5306-RGB,B-6261-RGB;n:type:ShaderForge.SFN_Blend,id:7294,x:33881,y:33385,varname:node_7294,prsc:2,blmd:15,clmp:True|SRC-2544-RGB,DST-1570-OUT;proporder:6261-5306-330-2540-8450-2765-6394-7725-1948-2544-1570-4283;pass:END;sub:END;*/

Shader "TGD/Metal/Carrosserie" {
    Properties {
        _Color ("Color", Color) = (0.9485294,0.09066822,0.09066822,1)
        _Diffuse ("Diffuse", 2D) = "white" {}
        _Lerp_Diffuse ("Lerp_Diffuse", Range(0, 1)) = 0.5385242
        _Specular ("Specular", 2D) = "white" {}
        _Specular_Intensity ("Specular_Intensity", Range(0, 2)) = 0
        _Glossiness ("Glossiness", Range(0, 1)) = 0
        _Diffuse_Reflexion_Cubemap ("Diffuse_Reflexion_Cubemap", Cube) = "_Skybox" {}
        _Diffuse_Reflexion_Factor ("Diffuse_Reflexion_Factor", Range(0, 1)) = 0
        _Diffuse_Reflexion_Intensity ("Diffuse_Reflexion_Intensity", Range(-0.5, 0.5)) = -0.1433418
        _Specular_Reflexion_Cubemap ("Specular_Reflexion_Cubemap", Cube) = "_Skybox" {}
        _Specular_Reflexion_Factor ("Specular_Reflexion_Factor", Range(0, 1)) = 0
        _Normal ("Normal", 2D) = "bump" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "PrePassBase"
            Tags {
                "LightMode"="PrePassBase"
            }
            
            
            Fog {Mode Off}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_PREPASSBASE
            #include "UnityCG.cginc"
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform fixed4 unity_Ambient;
            uniform fixed _Glossiness;
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
                return fixed4( normalDirection * 0.5 + 0.5, max(_Glossiness,0.0078125) );
            }
            ENDCG
        }
        Pass {
            Name "PrePassFinal"
            Tags {
                "LightMode"="PrePassFinal"
            }
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_PREPASSFINAL
            #include "UnityCG.cginc"
            #pragma multi_compile_prepassfinal
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform sampler2D _LightBuffer;
            #if defined (SHADER_API_XBOX360) && defined (HDR_LIGHT_PREPASS_ON)
                sampler2D _LightSpecBuffer;
            #endif
            uniform fixed4 unity_Ambient;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform fixed _Specular_Intensity;
            uniform fixed _Glossiness;
            uniform samplerCUBE _Diffuse_Reflexion_Cubemap;
            uniform samplerCUBE _Specular_Reflexion_Cubemap;
            uniform fixed _Diffuse_Reflexion_Factor;
            uniform fixed _Specular_Reflexion_Factor;
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
                float4 projPos : TEXCOORD5;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(unity_ObjectToWorld, float4(v.normal,0)).xyz;
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
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
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
////// Lighting:
                half4 lightAccumulation = tex2Dproj(_LightBuffer, UNITY_PROJ_COORD(i.projPos));
                #if defined (SHADER_API_GLES) || defined (SHADER_API_GLES3)
                    lightAccumulation = max(lightAccumulation, half4(0.001));
                #endif
                #ifndef HDR_LIGHT_PREPASS_ON
                    lightAccumulation = -log2(lightAccumulation);
                #endif
                #if defined (SHADER_API_XBOX360) && defined (HDR_LIGHT_PREPASS_ON)
                    lightAccumulation.w = tex2Dproj (_LightSpecBuffer, UNITY_PROJ_COORD(i.projPos)).r;
                #endif
////// Specular:
                half4 _Specular_Reflexion_Cubemap_var = texCUBE(_Specular_Reflexion_Cubemap,viewReflectDirection);
                fixed4 _Specular_var = tex2D(_Specular,TRANSFORM_TEX(i.uv0, _Specular));
                float3 specularColor = (_Specular_var.rgb*_Specular_Intensity);
                float3 directSpecular = (lightAccumulation.rgb * 2)*lightAccumulation.a;
                float3 indirectSpecular = (0 + saturate(( _Specular_Reflexion_Cubemap_var.rgb > 0.5 ? max(_Specular_Reflexion_Factor,2.0*(_Specular_Reflexion_Cubemap_var.rgb-0.5)) : min(_Specular_Reflexion_Factor,2.0*_Specular_Reflexion_Cubemap_var.rgb) )));
                float3 specular = (directSpecular + indirectSpecular) * specularColor;
/////// Diffuse:
                float3 indirectDiffuse = float3(0,0,0);
                float3 directDiffuse = lightAccumulation.rgb;
                indirectDiffuse += unity_Ambient.rgb; // Ambient Light
                indirectDiffuse += ((texCUBE(_Diffuse_Reflexion_Cubemap,normalDirection).rgb*_Diffuse_Reflexion_Factor)+_Diffuse_Reflexion_Intensity); // Diffuse Ambient Light
                fixed4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float3 diffuse = (directDiffuse + indirectDiffuse) * (_Diffuse_var.rgb*_Color.rgb);
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform fixed _Specular_Intensity;
            uniform fixed _Glossiness;
            uniform samplerCUBE _Diffuse_Reflexion_Cubemap;
            uniform samplerCUBE _Specular_Reflexion_Cubemap;
            uniform fixed _Diffuse_Reflexion_Factor;
            uniform fixed _Specular_Reflexion_Factor;
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
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i)*2;
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = _Glossiness;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                half4 _Specular_Reflexion_Cubemap_var = texCUBE(_Specular_Reflexion_Cubemap,viewReflectDirection);
                fixed4 _Specular_var = tex2D(_Specular,TRANSFORM_TEX(i.uv0, _Specular));
                float3 specularColor = (_Specular_var.rgb*_Specular_Intensity);
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow);
                float3 indirectSpecular = (0 + saturate(( _Specular_Reflexion_Cubemap_var.rgb > 0.5 ? max(_Specular_Reflexion_Factor,2.0*(_Specular_Reflexion_Cubemap_var.rgb-0.5)) : min(_Specular_Reflexion_Factor,2.0*_Specular_Reflexion_Cubemap_var.rgb) )));
                float3 specular = (directSpecular + indirectSpecular) * specularColor;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 indirectDiffuse = float3(0,0,0);
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb*2; // Ambient Light
                indirectDiffuse += ((texCUBE(_Diffuse_Reflexion_Cubemap,normalDirection).rgb*_Diffuse_Reflexion_Factor)+_Diffuse_Reflexion_Intensity); // Diffuse Ambient Light
                fixed4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float3 diffuse = (directDiffuse + indirectDiffuse) * (_Diffuse_var.rgb*_Color.rgb);
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
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
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i)*2;
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = _Glossiness;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                fixed4 _Specular_var = tex2D(_Specular,TRANSFORM_TEX(i.uv0, _Specular));
                float3 specularColor = (_Specular_var.rgb*_Specular_Intensity);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow);
                float3 specular = directSpecular * specularColor;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                fixed4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float3 diffuse = directDiffuse * (_Diffuse_var.rgb*_Color.rgb);
/// Final Color:
                float3 finalColor = diffuse + specular;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Reflective/Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
