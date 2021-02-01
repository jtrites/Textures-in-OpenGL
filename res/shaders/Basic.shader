// Vid#17: Basic.shader file modifications to support Texture: ChernoLogo.png
#shader vertex
#version 330 core

in vec4 position;
//layout(location = 0) in vec4 position;

/* Vid#17: (25:15) Modify Basic.Shader to add new Texture coordinate */
in vec2 texCoord;
//layout(location = 1) in vec2 texCoord;

/* Vid#17: (26:30) method to output data in varying v_TexCoord 
    from the VertexShader as input data to the FragmentShader */
out vec2 v_TexCoord;


void main()
{
    //gl_Position = vec4(aPos.x, aPos.y, aPos.z, 1.0);
    gl_Position = position;

    /* Vid#17: (26:45) assign varying v_TexCoord with the texCoord input to the VertexShader */
    v_TexCoord = texCoord;
}

#shader fragment
#version 330 core

//layout(location = 0) out vec4 FragColor;
out vec4 color;


/* Vid#17: (26:50) method to output data in varying v_TexCoord 
    from the VertexShader as input data to the FragmentShader  */
in vec2 v_TexCoord;

/* Vid#17: (  ) add uniform for Color */
uniform vec4 u_Color;

/* Vid#17: (25:30) add uniform for Texture */
uniform sampler2D u_Texture;

void main()
{
    /* Vid#17: (26:00) assign texColor from texture */
    vec4 texColor = texture(u_Texture, v_TexCoord);

    /* Vid#17: (27:20) assign color from u_Color */
    //color = u_Color;
    color = texColor;
}