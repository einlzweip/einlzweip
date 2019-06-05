function plot_cube(A)
    %Rotationsmatrizen
%Start von Position 9
E3=[0,1,0;-1,0,0;0,0,1];
E20=[1,0,0;0,-1,0;0,0,-1];
E7=[0,0,-1;0,1,0;1,0,0];
%Start von Position 6
K12=[1,0,0;0,0,-1;0,1,0];

R={E3^2,E3,E3,E3^2,eye(3),eye(3),E3^3,E3^3,eye(3),K12*E3^2,K12,K12*E3*E7*K12^3,E3*K12,E3^3*K12,E3^2*K12,K12^3,K12^3,E3*E20,E3*E20,E20,E3^2*E20,E20,E20,E3^2*E20,E20*E3,E3^3*E20};
R1={E3^2,E3,E3^2*E7,E3^2,eye(3),eye(3),E7,E3^3,eye(3),E3*K12,K12,K12*E3*E7*K12^3,E3*K12,E3^3*K12,E3^2*K12,K12^3,K12^3,K12^2*E7,E3*E20,E20,E3^2*E20,E20,E20,E3^2*E20,E20*E3,E7^3};
R2={E3^2,E3,K12,E3^2,eye(3),eye(3),E3^2*K12,E3^3,eye(3),E3*K12,K12,K12*E3*E7*K12^3,E3*K12,E3^3*K12,E3^2*K12,K12^3,K12^3,K12*E3^2,E3*E20,E20,E3^2*E20,E20,E20,E3^2*E20,E20*E3,K12^3};
T = [1 1 2; 1 1 2; 2 1 2; 1 2 2; 1 1 2; 2 1 2; 1 2 2; 2 2 2; 2 2 2; 1 1 1; 1 1 1; 2 1 2; 1 2 1; 2 1 1; 1 2 1; 1 2 2; 2 2 2; 1 1 1; 2 1 1; 2 1 1; 1 1 1; 1 2 1; 2 2 1; 1 2 1; 1 2 1; 2 2 1];       
figure()
hold on
vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
fac = [1 2 6 5;2 3 7 6;3 4 8 7;4 1 5 8;1 2 3 4;5 6 7 8];
C = [1 0.5 0; 0 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0];

%    1 orange; 2 blau; 3 rot; 4 gruen; 5 weiss; 6 gelb
Color_stones = [6 3 4; 6 4 0; 6 4 1; 6 3 0; 6 0 0; 6 1 0; 6 2 3; 6 2 0; 6 1 2; 3 4 0; 4 0 0; 1 4 0; 3 0 0; 1 0 0; 2 3 0; 2 0 0;
2 1 0; 5 4 3; 5 4 0; 5 1 4; 5 3 0; 5 0 0; 5 1 0; 5 3 2; 5 2 0; 5 2 1];
    
for i = 1:26
     %Ecken
     if(any(i == [1 3 7 9 18 20 24 26]))

         if (A(i,2) == 0)
             D = [0 0 0; C(Color_stones(i,2),:); C(Color_stones(i,3),:); 0 0 0; 0 0 0; C(Color_stones(i,1),:)];
             vert = transpose( R{A(i,1)} * transpose(vert) + transpose(T(A(i,1),:)));
             patch('Vertices',vert,'Faces',fac,'FaceVertexCData',D,'FaceColor','flat')
             view(3)
             axis vis3d
             hold on
             vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
         end
             
         if (A(i,2) == 1)
             D = [0 0 0; C(Color_stones(i,3),:); C(Color_stones(i,1),:); 0 0 0; 0 0 0; C(Color_stones(i,2),:)];
             vert = transpose( R1{A(i,1)} * transpose(vert) + transpose(T(A(i,1),:)));
             patch('Vertices',vert,'Faces',fac,'FaceVertexCData',D,'FaceColor','flat')
             view(3)
             axis vis3d
             hold on
             vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
         end
             
         if (A(i,2) == 2)
             D = [0 0 0; C(Color_stones(i,1),:); C(Color_stones(i,2),:); 0 0 0; 0 0 0; C(Color_stones(i,3),:)];
             vert = transpose(R2{A(i,1)} * transpose(vert) + transpose(T(A(i,1),:)));
             patch('Vertices',vert,'Faces',fac,'FaceVertexCData',D,'FaceColor','flat')             view(3)
             axis vis3d
             hold on
             vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
         end
     end
       %Kanten
        
    if(any(i == [2 4 6 8 10 12 15 17 19 21 23 25]))
            
        if (A(i,2) == 0)
            D = [0 0 0; C(Color_stones(i,2),:); 0 0 0; 0 0 0; 0 0 0; C(Color_stones(i,1),:)];
            vert = transpose(R2{A(i,1)} * transpose(vert) + transpose(T(A(i,1),:)));
            patch('Vertices',vert,'Faces',fac,'FaceVertexCData',D,'FaceColor','flat')
            view(3)
            axis vis3d
            hold on
            vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
        end
            
        if (A(i,2) == 1)
            D = [0 0 0; C(Color_stones(i,2),:); 0 0 0; 0 0 0; 0 0 0; C(Color_stones(i,1),:)];
            vert = transpose(R1{A(i,1)} * transpose(vert) + transpose(T(A(i,1),:)));
            patch('Vertices',vert,'Faces',fac,'FaceVertexCData',D,'FaceColor','flat')
            view(3)
            axis vis3d
            hold on
            vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
        end
            
        if (A(i,2) == 2)
            D = [0 0 0; C(Color_stones(i,2),:); 0 0 0; 0 0 0; 0 0 0; C(Color_stones(i,1),:)];
            vert = transpose(R2{A(i,1)} * transpose(vert) + transpose(T(A(i,1),:)));
            patch('Vertices',vert,'Faces',fac,'FaceVertexCData',D,'FaceColor','flat')
            view(3)
            axis vis3d
            hold on
            vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
        end
    end
       
        %Mittelsteine
    if(any(i == [5 11 13 14 16 22]'))
        D = [0 0 0; 0 0 0; 0 0 0; 0 0 0; 0 0 0; C(Color_stones(i,1),:)];
        vert = transpose(R{A(i,1)} * transpose(vert) + transpose(T(A(i,1),:)));
        patch('Vertices',vert,'Faces',fac,'FaceVertexCData',D,'FaceColor','flat')
        view(3)
        axis vis3d
        hold on
        vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
     end
end
end
