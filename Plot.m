function plot_cube(A)
    %Rotationsmatrizen
    %Start von Position 9
    E3=[0,1,0;-1,0,0;0,0,1];
    E20=[1,0,0;0,-1,0;0,0,-1];
    E1=E3^2;
    E7=E3^2;
    E9=eye(3);
    E18=E3*E20;
    E24=E3^2*E20;
    E26=E3^3*E20;
    %Start von Position 6
    K12=[1,0,0;0,0,-1,0,1,0];
    K8=E3;
    
    vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
    fac = [1 2 6 5;2 3 7 6;3 4 8 7;4 1 5 8;1 2 3 4;5 6 7 8];
    C = [1 0.5 0; 0 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0];
    %    1 orange; 2 blau; 3 rot; 4 gruen; 5 weiss; 6 gelb
    Color_stones = [6 3 4; 6 4 0; 6 4 1; 6 3 0; 6 0 0; 6 1 0; 6 2 3; 6 2 0; 6 1 2; 3 4 0; 4 0 0; 4 1 0; 3 0 0; 5 0 0; 2 3 0; 2 0 0;
    2 1 0; 5 4 2; 5 4 0; 5 1 4; 5 3 0; 5 0 0; 5 1 0; 5 3 2; 5 2 0; 5 2 1]
    
    for i = 1:26
        %Ecken
        if(any(i == [1 3 7 9 18 20 24 26]))
            D = [C(Color_stones(i,2),:); C(Color_stones(i,3),:); 0 0 0; 0 0 0; 0 0 0; C(Color_stones(i,1),:)]
            patch('Vertices',vert,'Faces',fac,'FaceVertexCData',D,'FaceColor','flat')
            view(3)
            axis vis3d
            hold on
        end
        %Kanten
        if(any(i == [2 4 6 8 10 12 15 17 19 21 23 25))
            D = [C(Color_stones(i,2),:); 0 0 0; 0 0 0; 0 0 0; 0 0 0; C(Color_stones(i,1),:)]
        end
        %Mittelsteine
        if(any(i == [5 11 13 14 16 21]
            D = [0 0 0; 0 0 0; 0 0 0; 0 0 0; 0 0 0; C(Color_stones(i,1),:)]
        end
         
    end        
end
