function plotcube(A)
%Kernfunktion, zum Plotten des Würfels
%A-Matrix des Würfels
clf

%buttons
pl = uicontrol(gcf,'Style','Pushbutton',...
       'Position',[20,50,50,20],...
   	'Tag','pushbutton1','string', 'Ln');
set(pl,'Callback',@pushbutton1_Callback)
  
p2 = uicontrol(gcf,'Style','Pushbutton',...
   	'Position',[80,80,50,20],...
   	'Tag','pushbutton2','string', 'Rp');
set(p2,'Callback',@pushbutton2_Callback)
  
p3 = uicontrol(gcf,'Style','Pushbutton',...
   	'Position',[80,110,50,20],...
   	'Tag','pushbutton3','string', 'Op');
set(p3,'Callback',@pushbutton3_Callback)
       
p4 = uicontrol(gcf,'Style','Pushbutton',...
   	'Position',[20,140,50,20],...
   	'Tag','pushbutton4','string', 'Un');
set(p4,'Callback',@pushbutton4_Callback)
       
p5 = uicontrol(gcf,'Style','Pushbutton',...
   	'Position',[20,170,50,20],...
   	'Tag','pushbutton5','string', 'Vn');
set(p5,'Callback',@pushbutton5_Callback)
       
p6 = uicontrol(gcf,'Style','Pushbutton',...
  	'Position',[80,200,50,20],...
  	'Tag','pushbutton6','string', 'Hp');
set(p6,'Callback',@pushbutton6_Callback)
       
p7 = uicontrol(gcf,'Style','Pushbutton',...
   	'Position',[80,50,50,20],...
   	'Tag','pushbutton7','string', 'Lp');
set(p7,'Callback',@pushbutton7_Callback)
       
p8 = uicontrol(gcf,'Style','Pushbutton',...
   	'Position',[20,80,50,20],...
   	'Tag','pushbutton8','string', 'Rn');
set(p8,'Callback',@pushbutton8_Callback)
       
p9 = uicontrol(gcf,'Style','Pushbutton',...
   	'Position',[20,110,50,20],...
   	'Tag','pushbutton9','string', 'On');
set(p9,'Callback',@pushbutton9_Callback)
       
p10 = uicontrol(gcf,'Style','Pushbutton',...
       'Position',[80,140,50,20],...
   	'Tag','pushbutton10','string', 'Up');
set(p10,'Callback',@pushbutton10_Callback)
       
p11 = uicontrol(gcf,'Style','Pushbutton',...
   	'Position',[80,170,50,20],...
   	'Tag','pushbutton11','string', 'Vp');
set(p11,'Callback',@pushbutton11_Callback)
 
p12 = uicontrol(gcf,'Style','Pushbutton',...
   	'Position',[20,200,50,20],...
   	'Tag','pushbutton12','string', 'Hn');
set(p12,'Callback',@pushbutton12_Callback)
       
p13 = uicontrol(gcf,'Style','Pushbutton',...
   	'Position',[20,270,50,20],...
   	'Tag','pushbutton13','string', 'Random');
set(p13,'Callback',@pushbutton13_Callback)
       
p14 = uicontrol(gcf,'Style','Pushbutton',...
   	'Position',[80,270,50,20],...
   	'Tag','pushbutton14','string', 'Zustand');
set(p14,'Callback',@pushbutton14_Callback)
       
p15 = uicontrol(gcf,'Style','Pushbutton',...
   	'Position',[20,300,50,20],...
   	'Tag','pushbutton15','string', 'Lösung');
set(p15,'Callback',@pushbutton15_Callback)

%checkbox
cl = uicontrol(gcf,'Style','checkbox',...
   	       'Position',[20,230,110,20],...
   	       'Tag','checkbox1','string', 'Animation ein');
set(cl,'Callback',@checkbox1_Callback)

%für Animation ein/aus
h=0;
 
%Rotationsmatrizen
%Start von Position 9
E3=[0,1,0;-1,0,0;0,0,1];
E20=[1,0,0;0,-1,0;0,0,-1];
E7=[0,0,-1;0,1,0;1,0,0];
%Start von Position 6
K12=[1,0,0;0,0,-1;0,1,0];

%Liste der Drehmatrizen
R={E3^2,E3,E3,E3^2,eye(3),eye(3),E3^3,E3^3,eye(3),K12*E3^2,K12,K12*E3*E7*K12^3,E3*K12,E3^3*K12,E3^2*K12,K12^3,K12^3,E3*E20,E3*E20,E20,E3^2*E20,E20,E20,E3^2*E20,E20*E3,E3^3*E20};
R1={E3^2,E3,E3^2*E7,E3^2,eye(3),eye(3),E7,E7*K12^3,eye(3),E3*K12,K12,K12*E3*E7*K12^3,E3*K12,E3^3*K12,E3^2*K12,K12^3,K12^3,K12^2*E7,E3*E20,E20,E3^2*E20,E20,E20,E3^2*E20,E20*E3,E7^3};
R2={E3^2,E3,K12,E3^2,eye(3),eye(3),E3^2*K12,E3^3,eye(3),E3*K12,K12,K12*E3*E7*K12^3,E3*K12,E3^3*K12,E3^2*K12,K12^3,K12^3,K12*E3^2,E3*E20,E20,E3^2*E20,E20,E20,E3^2*E20,E20*E3,K12^3};
%Translationsvektoren
T = [1 1 2; 1 1 2; 2 1 2; 1 2 2; 1 1 2; 2 1 2; 1 2 2; 2 2 2; 2 2 2; 1 1 1; 1 1 1; 2 1 2; 1 2 1; 2 1 1; 1 2 1; 1 2 2; 2 2 2; 1 1 1; 2 1 1; 2 1 1; 1 1 1; 1 2 1; 2 2 1; 1 2 1; 1 2 1; 2 2 1]-1.5;   

hold on
%Eckpunkte
vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
%Würfelseiten
fac = [1 2 6 5;2 3 7 6;3 4 8 7;4 1 5 8;1 2 3 4;5 6 7 8];
%Farben
C = [1 0.5 0; 0 0 1; 1 0 0; 0 1 0; 1 1 1; 1 1 0];

%Farben der Steine
%    1 orange; 2 blau; 3 rot; 4 gruen; 5 weiss; 6 gelb
Color_stones = [6 3 4; 6 4 0; 6 4 1; 6 3 0; 6 0 0; 6 1 0; 6 2 3; 6 2 0; 6 1 2; 3 4 0; 4 0 0; 1 4 0; 3 0 0; 1 0 0; 2 3 0; 2 0 0;
2 1 0; 5 4 3; 5 4 0; 5 1 4; 5 3 0; 5 0 0; 5 1 0; 5 3 2; 5 2 0; 5 2 1];
%Koordinatensystem unsichtbar
set(gca,'visible','off');    
for i = 1:26
     
        %Ecken
     if(any(i == [1 3 7 9 18 20 24 26]))
         %Drehindex 0
         if (A(i,2) == 0)
             %Stein bemalen
             D = [0 0 0; C(Color_stones(i,2),:); C(Color_stones(i,3),:); 0 0 0; 0 0 0; C(Color_stones(i,1),:)];
             %Rotieren und Verschieben
             vert = transpose( R{A(i,1)} * transpose(vert) + transpose(T(A(i,1),:)));
             %Stein erzeugen
             patch('Vertices',vert,'Faces',fac,'FaceVertexCData',D,'FaceColor','flat')
             view(3)
             axis vis3d
             hold on
             vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
         end
         %Drehindex 1    
         if (A(i,2) == 1)
             D = [0 0 0; C(Color_stones(i,3),:); C(Color_stones(i,1),:); 0 0 0; 0 0 0; C(Color_stones(i,2),:)];
             vert = transpose( R1{A(i,1)} * transpose(vert) + transpose(T(A(i,1),:)));
             patch('Vertices',vert,'Faces',fac,'FaceVertexCData',D,'FaceColor','flat')
             view(3)
             axis vis3d
             hold on
             vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
         end
         %Drehindex 2    
         if (A(i,2) == 2)
             D = [0 0 0; C(Color_stones(i,1),:); C(Color_stones(i,2),:); 0 0 0; 0 0 0; C(Color_stones(i,3),:)];
             vert = transpose(R2{A(i,1)} * transpose(vert) + transpose(T(A(i,1),:)));
             patch('Vertices',vert,'Faces',fac,'FaceVertexCData',D,'FaceColor','flat')
             view(3)
             axis vis3d
             hold on
             vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
         end
     end
        
        %Kanten
    if(any(i == [2 4 6 8 10 12 15 17 19 21 23 25]))
            
        if (A(i,2) == 0)
            if(any(i == [15 17]) && A(i,1) == 12)
                vert = transpose(K12*transpose(vert)+transpose(T(A(i,1),:)-[0 0 1]));
            elseif(any(i == [10 12]) && A(i,1) == 17)
                vert = transpose(E7^3*E3^3*transpose(vert)+transpose(T(A(i,1),:)-[0 0 1]));
            elseif(any(i == [10 12]) && A(i,1) == 15)
                vert = transpose(E7 * E3^3 * transpose(vert) + transpose(T(A(i,1),:) + [0 0 1]));
            elseif(any(i == [15 17]) && A(i,1) == 10)
                vert = transpose(K12 * E3^2 * transpose(vert) + transpose(T(A(i,1),:) + [0 0 1]));
            else
                vert = transpose(R2{A(i,1)} * transpose(vert) + transpose(T(A(i,1),:)));
            end
            D = [0 0 0; C(Color_stones(i,2),:); 0 0 0; 0 0 0; 0 0 0; C(Color_stones(i,1),:)];
            patch('Vertices',vert,'Faces',fac,'FaceVertexCData',D,'FaceColor','flat')
            view(3)
            axis vis3d
            hold on
            vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
        end
            
        if (A(i,2) == 1)
            if(any(i == [4 6 21 23]) && A(i,1) == 12)
                vert = transpose(K12 * transpose(vert) + transpose(T(A(i,1),:) - [0 0 1]));
            elseif (any(i == [10 12]) && A(i,1) == 6)
                vert = transpose(K12^3 * E7^3 * E3 * transpose(vert) + transpose(T(A(i,1),:) + [0 1 0]));
            elseif (any(i == 12) && A(i,1)==23)
                vert = transpose(K12 * E7^3 * E3 * transpose(vert) + transpose(T(A(i,1),:) + [0 -1 0]));
            elseif (any(i == [ 15 17]) && A(i,1) == 8)
                vert = transpose(R1{A(i,1)} * transpose(vert) + transpose(T(A(i,1),:) + [-1 0 0]));
            elseif (any(i == [2 4 6 8 10 12 19 21 23 25]) && A(i,1) == 8)
                vert = transpose(E3^3 * transpose(vert) + transpose(T(A(i,1),:) )); 
            elseif (any(i == [2 8 19 25]) && A(i,1) == 15)
                vert= transpose(E7 * E3^3 * transpose(vert) + transpose(T(A(i,1),:) + [0 0 1]));
            elseif (any(i == [2 8 19 25]) && A(i,1) == 17)
                vert= transpose(E7^3*E3^3*transpose(vert)+transpose(T(A(i,1),:)+[0 0 -1]));
            elseif (any(i == [15 17]) && A(i,1) == 25)
                vert = transpose(E7^3*K12^3*transpose(vert)+transpose(T(A(i,1),:)+[1 0 0]));
            elseif (any(i == [4 6 21 23]) && A(i,1) == 10)
                vert = transpose(E7^2 * K12 * transpose(vert) + transpose(T(A(i,1),:) + [0 0 1]));
            elseif (any(i == [10 12]) && A(i,1) == 21)
                vert = transpose(K12 * E7 * E3 * transpose(vert) + transpose(T(A(i,1),:) + [0 1 0]));
            elseif (any(i == [10 12]) && A(i,1) == 4)
                vert = transpose(E7 * transpose(vert) + transpose(T(A(i,1),:) + [0 -1 0]));
            elseif (any(i == 10) && A(i,1) == 23)
                vert = transpose(K12 * E7^3 * E3 * transpose(vert) + transpose(T(A(i,1),:) + [0 -1 0]));
            elseif (any(i == [15 17]) && A(i,1) == 2)
                vert = transpose(E7 * K12 * transpose(vert) + transpose(T(A(i,1),:) + [1 0 0]));
            elseif (any(i == [15 17]) && A(i,1) == 19)
                vert = transpose(E7^3 * K12 * transpose(vert) + transpose(T(A(i,1),:) + [-1 0 0]));
            else
                vert = transpose(R1{A(i,1)} * transpose(vert) + transpose(T(A(i,1),:)));    
            end
            D = [0 0 0; C(Color_stones(i,2),:); 0 0 0; 0 0 0; 0 0 0; C(Color_stones(i,1),:)];
            patch('Vertices',vert,'Faces',fac,'FaceVertexCData',D,'FaceColor','flat')
            view(3)
            axis vis3d
            hold on
            vert = [0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
        end
            
        if (A(i,2) == 2)
            D = [0 0 0; C(Color_stones(i,2),:); 0 0 0; 0 0 0; 0 0 0; C(Color_stones(i,1),:)];
            if  (any(i == [2 4 6 8 10 12 19 21 23 25]) && A(i,1) == 2)
                vert = transpose(E7 * K12 * transpose(vert) + transpose(T(A(i,1),:) + [1 0 0]));
            elseif (any(i == [2 4 6 8 15 17 19 21 23 25]) && A(i,1) == 4)
                vert = transpose(E7 * transpose(vert) + transpose(T(A(i,1),:) + [0 -1 0]));
            elseif (any(i == [2 4 6 8 15 17 19 21 23 25]) && A(i,1) == 6)
                vert = transpose(E3^3 * E7 * K12 * transpose(vert) + transpose(T(A(i,1),:) + [0 1 0]));
            elseif (any(i == [2 4 6 8 10 12 19 21 23 25]) && A(i,1) == 8)
                vert = transpose(E7 * K12^3 * transpose(vert) + transpose(T(A(i,1),:) + [-1 0 0]));
            elseif (any(i == [2 8 10 12 19 25]) && A(i,1) == 10)
                vert = transpose(E7^2 * K12 * transpose(vert) + transpose(T(A(i,1),:) + [0 0 1]));
            elseif (any(i == [2 8 10 12 19 25]) && A(i,1) == 12)
                vert = transpose(K12 * transpose(vert) + transpose(T(A(i,1),:) + [0 0 -1]));
            elseif (any(i == [4 6 15 17 21 23]) && A(i,1) == 15)
                vert = transpose(K12^3 * E7 * transpose(vert) + transpose(T(A(i,1),:) + [0 0 1]));
            elseif (any(i == [4 6 15 17 21 23]) && A(i,1) == 17)
                vert = transpose(E7^3 *E3^3 * transpose(vert) + transpose(T(A(i,1),:) + [0 0 -1]));
            elseif (any(i == [2 4 6 8 10 12 19 21 23 25]) && A(i,1) == 19)
                vert = transpose(E7^3 * K12 * transpose(vert) + transpose(T(A(i,1),:) + [-1 0 0]));
            elseif (any(i == [2 4 6 8 15 17 19 21 23 25]) && A(i,1) == 21)
                vert = transpose(E3 * E7^3 * K12 * transpose(vert) + transpose(T(A(i,1),:) + [0 1 0]));
            elseif (any(i == [2 4 6 8 15 17 19 21 23 25]) && A(i,1) == 23)
                vert = transpose(K12 *E7^3 * E3 * transpose(vert) + transpose(T(A(i,1),:) + [0 -1 0]));
            elseif (any(i == [2 4 6 8 10 12 19 21 23 25]) && A(i,1) == 25)
                vert = transpose(E7^3 * K12^3 * transpose(vert) + transpose(T(A(i,1),:) + [1 0 0])); 
            else
                vert = transpose(R2{A(i,1)} * transpose(vert) + transpose(T(A(i,1),:)));
            end
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


%Funktionsweise der Buttons
%Ln
function pushbutton1_Callback(hObject, eventdata, handles)
    %ohne Animation
    if h==0
        p=puzzle(A);
        Ln(p);
        A=p.stones;
        plotcube(A);
    %mit Animation
    elseif h==1
    import /home/2016/streibls/puzzle.* 
    for a=0:pi/20:pi/2
        p=puzzle(A);
        A = p.stones;
        clf;
        drehung=[1 4 7 10 13 15 18 21 24];
        LP=[1 0 0; 0 cos(a) -sin(a); 0 sin(a) cos(a)];
        plot_animate(A,drehung,LP);        
    end
    %Aktualisieren des Würfelzustandes
    p=puzzle(A);
    Ln(p);
    A=p.stones;
    plotcube(A);
    end
end

%Rp
function pushbutton2_Callback(hObject, eventdata, handles)
    if h==0
        p=puzzle(A);
        Rp(p);
        A=p.stones;
        plotcube(A);
    elseif h==1
    import /home/2016/streibls/puzzle.* 
    for a=0:pi/20:pi/2
        p=puzzle(A);
        A = p.stones;
        clf;
        drehung=[3 6 9 12 14 17 20 23 26];
        LP=[1 0 0; 0 cos(a) -sin(a); 0 sin(a) cos(a)];
        plot_animate(A,drehung,LP);        
    end
    %Aktualisieren des Würfelzustandes
    p=puzzle(A);
    Rp(p);
    A=p.stones;
    plotcube(A);
    end
end

%Op
function pushbutton3_Callback(hObject, eventdata, handles)
    if h==0
        p=puzzle(A);
        Op(p);
        A=p.stones;
        plotcube(A);
    elseif h==1
    import /home/2016/streibls/puzzle.* 
    for a=0:pi/20:pi/2
        p=puzzle(A);
        A = p.stones;
        clf;
        drehung=[1 2 3 4 5 6 7 8 9];
        LP=[cos(a) -sin(a) 0; sin(a) cos(a) 0; 0 0 1];
        plot_animate(A,drehung,LP);        
    end
    %Aktualisieren des Würfelzustandes
    p=puzzle(A);
    Op(p);
    A=p.stones;
    plotcube(A);
    end
end

%Un
function pushbutton4_Callback(hObject, eventdata, handles)
    if h==0
        p=puzzle(A);
        Un(p);
        A=p.stones;
        plotcube(A);
    elseif h==1
    import /home/2016/streibls/puzzle.* 
    for a=0:pi/20:pi/2
        p=puzzle(A);
        A = p.stones;
        clf;
        drehung=[18 19 20 21 22 23 24 25 26];
        LP=[cos(a) -sin(a) 0; sin(a) cos(a) 0; 0 0 1];
        plot_animate(A,drehung,LP);        
    end
    %Aktualisieren des Würfelzustandes
    p=puzzle(A);
    Un(p);
    A=p.stones;
    plotcube(A);   
    end
end

%Vn
function pushbutton5_Callback(hObject, eventdata, handles)
    if h==0
        p=puzzle(A);
        Vn(p);
        A=p.stones;
        plotcube(A);
    elseif h==1
    import /home/2016/streibls/puzzle.* 
    for a=0:pi/20:pi/2
        p=puzzle(A);
        A = p.stones;
        clf;
        drehung=[1 2 3 10 11 12 18 19 20];
        LP=[cos(a) 0 sin(a); 0 1 0; -sin(a) 0 cos(a)];
        plot_animate(A,drehung,LP);        
    end
    %Aktualisieren des Würfelzustandes
    p=puzzle(A);
    Vn(p);
    A=p.stones;
    plotcube(A);
    end
end

%Hp
function pushbutton6_Callback(hObject, eventdata, handles)
    if h==0
        p=puzzle(A);
        Hp(p);
        A=p.stones;
        plotcube(A);
    elseif h==1
    import /home/2016/streibls/puzzle.* 
    for a=0:pi/20:pi/2
        p=puzzle(A);
        A = p.stones;
        clf;
        drehung=[7 8 9 15 16 17 24 25 26];
        LP=[cos(a) 0 sin(a); 0 1 0; -sin(a) 0 cos(a)];
        plot_animate(A,drehung,LP);        
    end
    %Aktualisieren des Würfelzustandes
    p=puzzle(A);
    Hp(p);
    A=p.stones;
    plotcube(A);
    end
end

%Lp
function pushbutton7_Callback(hObject, eventdata, handles)
    if h==0
        p=puzzle(A);
        Lp(p);
        A=p.stones;
        plotcube(A);
    elseif h==1
    import /home/2016/streibls/puzzle.* 
    for a=0:pi/20:pi/2
        p=puzzle(A);
        A = p.stones;
        clf;
        drehung=[1 4 7 10 13 15 18 21 24];
        LP=[1 0 0; 0 cos(a) sin(a); 0 -sin(a) cos(a)];
        plot_animate(A,drehung,LP);        
    end
    %Aktualisieren des Würfelzustandes
    p=puzzle(A);
    Lp(p);
    A=p.stones;
    plotcube(A);
    end
end

%Rn
function pushbutton8_Callback(hObject, eventdata, handles)
    if h==0
        p=puzzle(A);
        Rn(p);
        A=p.stones;
        plotcube(A);
    elseif h==1
    import /home/2016/streibls/puzzle.* 
    for a=0:pi/20:pi/2
        p=puzzle(A);
        A = p.stones;
        clf;
        drehung=[3 6 9 12 14 17 20 23 26];
        LP=[1 0 0; 0 cos(a) sin(a); 0 -sin(a) cos(a)];
        plot_animate(A,drehung,LP);        
    end
    %Aktualisieren des Würfelzustandes
    p=puzzle(A);
    Rn(p);
    A=p.stones;
    plotcube(A);
    end
end

%On
function pushbutton9_Callback(hObject, eventdata, handles)
    if h==0
        p=puzzle(A);                        
        On(p);
        A=p.stones;
        plotcube(A);
    elseif h==1
    import /home/2016/streibls/puzzle.* 
    for a=0:pi/20:pi/2
        p=puzzle(A);
        A = p.stones;
        clf;
        drehung=[1 2 3 4 5 6 7 8 9];
        LP=[cos(a) sin(a) 0; -sin(a) cos(a) 0; 0 0 1];
        plot_animate(A,drehung,LP);        
    end
    %Aktualisieren des Würfelzustandes
    p=puzzle(A);
    On(p);
    A=p.stones;
    plotcube(A);
    end
end

%Up
function pushbutton10_Callback(hObject, eventdata, handles)
    if h==0
        p=puzzle(A);
        Up(p);
        A=p.stones;
        plotcube(A);
    elseif h==1
    import /home/2016/streibls/puzzle.* 
    for a=0:pi/20:pi/2
        p=puzzle(A);
        A = p.stones;
        clf;
        drehung=[18 19 20 21 22 23 24 25 26];
        LP=[cos(a) sin(a) 0; -sin(a) cos(a) 0; 0 0 1];
        plot_animate(A,drehung,LP);        
    end
    %Aktualisieren des Würfelzustandes
    p=puzzle(A);
    Up(p);
    A=p.stones;
    plotcube(A);
    end
end

%Vp
function pushbutton11_Callback(hObject, eventdata, handles)
    if h==0
        p=puzzle(A);
        Vp(p);
        A=p.stones;
        plotcube(A);
    elseif h==1
    import /home/2016/streibls/puzzle.* 
    for a=0:pi/20:pi/2
        p=puzzle(A);
        A = p.stones;
        clf;
        drehung=[1 2 3 10 11 12 18 19 20];
        LP=[cos(a) 0 -sin(a); 0 1 0; sin(a) 0 cos(a)];
        plot_animate(A,drehung,LP);        
    end
    %Aktualisieren des Würfelzustandes
    p=puzzle(A);
    Vp(p);
    A=p.stones;
    plotcube(A);
    end
end

%Hn
function pushbutton12_Callback(hObject, eventdata, handles)
    if h==0
        p=puzzle(A);
        Hn(p);
        A=p.stones;
        plotcube(A);
    elseif h==1
    import /home/2016/streibls/puzzle.* 
    for a=0:pi/20:pi/2
        p=puzzle(A);
        A = p.stones;
        clf;
        drehung=[7 8 9 15 16 17 24 25 26];
        LP=[cos(a) 0 -sin(a); 0 1 0; sin(a) 0 cos(a)];
        plot_animate(A,drehung,LP);        
    end
    %Aktualisieren des Würfelzustandes
    p=puzzle(A);
    Hn(p);
    A=p.stones;
    plotcube(A);
    end
end

%checkbox Animation
function checkbox1_Callback(hObject, eventdata, handles)
h=1;
end

%zufälliger Würfel
function pushbutton13_Callback(hObject, eventdata, handles)
    A=zeros(26,2);
    A(:,1)=1:26;
    random_cube(A)
end

%Würfel eingeben
function pushbutton14_Callback(hObject, eventdata, handles)
    A = zeros(26,2);
    for i = 1:26
        answer = inputdlg(sprintf('Position und Drehindex von Stein %d', i), 'Würfelzustand', [1 50]);
        A(i,:) = str2num(answer{1});
    end
    plotcube(A)
end

%gelöster Würfel
function pushbutton15_Callback(hObject, eventdata, handles)
    A = zeros(26,2);
    A(:,1) = 1:26;
    plotcube(A)
end

end
