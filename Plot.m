vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
fac = [1 2 6 5;2 3 7 6;3 4 8 7;4 1 5 8;1 2 3 4;5 6 7 8];
C = [1 0.5 0; 0 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0];
%    1 orange; 2 blau; 3 rot; 4 gruen; 5 weiss; 6 gelb
Color_stones = [6 3 4; 6 4 0; 6 4 1; 6 3 0; 6 0 0; 6 1 0; 6 2 3; 6 2 0; 6 1 2; 3 4 0; 4 0 0; 4 1 0; 3 0 0; 5 0 0; 2 3 0; 2 0 0;
2 1 0; 5 4 2; 5 4 0; 5 1 4; 5 3 0; 5 0 0; 5 1 0; 5 3 2; 5 2 0; 5 2 1]
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
