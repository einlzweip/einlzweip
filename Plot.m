vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
fac = [1 2 6 5;2 3 7 6;3 4 8 7;4 1 5 8;1 2 3 4;5 6 7 8];
C = [0 1 0; 1 0 0; 0 0 1; 1 0.5 0; 1 1 1; 1 1 0];
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
