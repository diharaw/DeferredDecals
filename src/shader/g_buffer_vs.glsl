// ------------------------------------------------------------------
// INPUT VARIABLES --------------------------------------------------
// ------------------------------------------------------------------

layout(location = 0) in vec3 VS_IN_Position;
layout(location = 1) in vec2 VS_IN_Texcoord;
layout(location = 2) in vec3 VS_IN_Normal;
layout(location = 3) in vec3 VS_IN_Tangent;
layout(location = 4) in vec3 VS_IN_Bitangent;

// ------------------------------------------------------------------
// OUTPUT VARIABLES -------------------------------------------------
// ------------------------------------------------------------------

out vec3 FS_IN_Normal;
out vec3 FS_IN_Tangent;
out vec3 FS_IN_Bitangent;
out vec2 FS_IN_TexCoord;

// ------------------------------------------------------------------
// UNIFORMS ---------------------------------------------------------
// ------------------------------------------------------------------

layout(std140) uniform GlobalUniforms
{
    mat4 view_proj;
    mat4 inv_view_proj;
    vec4 cam_pos;
};

uniform mat4 u_Model;

// ------------------------------------------------------------------
// MAIN -------------------------------------------------------------
// ------------------------------------------------------------------

void main()
{
    vec4 world_pos = u_Model * vec4(VS_IN_Position, 1.0f);

    mat3 normal_mat = mat3(u_Model);

    FS_IN_Normal    = normalize(normal_mat * VS_IN_Normal);
    FS_IN_Tangent   = normal_mat * VS_IN_Tangent;
    FS_IN_Bitangent = normal_mat * VS_IN_Bitangent;

    FS_IN_TexCoord = VS_IN_Texcoord;

    gl_Position = view_proj * world_pos;
}

// ------------------------------------------------------------------
