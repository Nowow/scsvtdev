#version 130

out vec3 LightDir;
out vec3 ViewDir;

out vec3 N;
out vec3 t;
out vec3 b;
out vec3 v;

out vec4 A;
out vec4 C;
out vec4 D;


void main( void )
{
	gl_Position = ftransform();
	gl_TexCoord[0] = gl_MultiTexCoord0;
	
	N = normalize(gl_NormalMatrix * gl_Normal);
	t = normalize(gl_NormalMatrix * gl_MultiTexCoord1.xyz);
	b = normalize(gl_NormalMatrix * gl_MultiTexCoord2.xyz);
	
	// NOTE: b<->t 
	mat3 tbnMatrix = mat3(t.x, b.x, N.x,
                          t.y, b.y, N.y,
                          t.z, b.z, N.z);
						  
	v = vec3(gl_ModelViewMatrix * gl_Vertex);
	
	ViewDir = tbnMatrix * -v.xyz;
	LightDir = tbnMatrix * gl_LightSource[0].position.xyz;
	
	A = gl_LightSource[0].ambient;
	C = gl_Color;
	D = gl_LightSource[0].diffuse;
}
