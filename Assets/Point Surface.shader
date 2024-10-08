Shader "Custom/Point Shader"
{
    Properties
    {
        _Smoothness ("Shoothness", Range(0,1)) = 0.5
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface ConfigureSurface Standard fullforwardshadows
        #pragma target 3.0

        struct Input
        {
            float3 worldPos;
        };

        float _Smoothness;
        void ConfigureSurface (Input input, inout SurfaceOutputStandard surface)
        {
            surface.Smoothness = _Smoothness;
            surface.Albedo.rg = input.worldPos.xy * 0.5 + 0.5;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
