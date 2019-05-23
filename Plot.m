>> C = [0 1 0; 1 0 0; 1 0 0; 1 0 0; 1 0 0; 1 1 0]

C =

     0     1     0
     1     0     0
     1     0     0
     1     0     0
     1     0     0
     1     1     0

>> patch('Vertices',vert,'Faces',fac,...
'FaceVertexCData',C,'FaceColor','flat')
>> view(3)
>> axis vis3d
>> 
>> 
patch('Vertices',vert,'Faces',fac,...
'FaceVertexCData',C,'FaceColor','flat')
view(3)
axis vis3d
>> 
patch('Vertices',vert,'Faces',fac,...
'FaceVertexCData',C,'FaceColor','flat')
view(3)
axis vis3d
>> hold on
>> 
>> vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1] + 1;
>> patch('Vertices',vert,'Faces',fac,...
'FaceVertexCData',C,'FaceColor','flat')
view(3)
axis vis3d
>> 
>> vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1] + 2;
>> patch('Vertices',vert,'Faces',fac,...
'FaceVertexCData',C,'FaceColor','flat')
view(3)
axis vis3d
>> vert = [0 0 1;1 0 1;1 1 1;0 1 1;0 0 2;1 0 2;1 1 2;0 1 2];
>> patch('Vertices',vert,'Faces',fac,...
'FaceVertexCData',C,'FaceColor','flat')
>> vert = [0 0 2;1 0 2;1 1 2;0 1 2;0 0 3;1 0 3;1 1 3;0 1 3];
>> patch('Vertices',vert,'Faces',fac,...
'FaceVertexCData',C,'FaceColor','flat')
