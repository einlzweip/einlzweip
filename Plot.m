vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
fac = [1 2 6 5;2 3 7 6;3 4 8 7;4 1 5 8;1 2 3 4;5 6 7 8];
C = [1 0.5 0; 0 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0];
%    1 orange; 2 blau; 3 rot; 4 gruen; 5 weiss; 6 gelb
Color_stones = [3 4 6; 4 6 0; 4 6 1; 3 6 0; 6 0 0; 1 6 0; 2 3 6; 2 6 0; 4 2 6; 4 3 0; 4 0 0; 4 1 0; 3 0 0; 5 0 0; 3 2 0; 2 0 0;
1 2 0; 3 4 5; 4 5 0; 4 5 1; 3 5 0; 5 0 0; 1 5 0; 3 2 5; 5 2 0; 1 2 5]
patch('Vertices',vert,'Faces',fac,'FaceVertexCData',C,'FaceColor','flat')
view(3)
axis vis3d
hold on
for i = 1:3
    for j = 1:3
    vert(:,i) = vert(:,i) + 1;
    patch('Vertices',vert,'Faces',fac,'FaceVertexCData',C,'FaceColor','flat')
    vert(:,j) = vert(:,j) + 1;
    patch('Vertices',vert,'Faces',fac,'FaceVertexCData',C,'FaceColor','flat')
    vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
    end
end

for i = 1:3
    for j = 1:3
        if(i ~= j)
        vert(:,i) = vert(:,i) + 2;
        patch('Vertices',vert,'Faces',fac,'FaceVertexCData',C,'FaceColor','flat')
        vert(:,j) = vert(:,j) + 1;
        patch('Vertices',vert,'Faces',fac,'FaceVertexCData',C,'FaceColor','flat')
        vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
        end
    end
end

vert = vert + 2;
patch('Vertices',vert,'Faces',fac,'FaceVertexCData',C,'FaceColor','flat')

for i = 1:3
    for j = 1:3
    vert(:,i) = vert(:,i) - 1;
    patch('Vertices',vert,'Faces',fac,'FaceVertexCData',C,'FaceColor','flat')
    vert(:,j) = vert(:,j) - 1;
    patch('Vertices',vert,'Faces',fac,'FaceVertexCData',C,'FaceColor','flat')
    vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
    vert = vert + 2;
    end
end

for i = 1:3
    for j = 1:3
        if(i ~= j)
        vert(:,i) = vert(:,i) - 2;
        patch('Vertices',vert,'Faces',fac,'FaceVertexCData',C,'FaceColor','flat')
        vert(:,j) = vert(:,j) - 1;
        patch('Vertices',vert,'Faces',fac,'FaceVertexCData',C,'FaceColor','flat')
        vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
        vert = vert + 2;
        end
    end
end
