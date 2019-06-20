classdef puzzle < handle
    %Würfelklasse
    
    %Zustand des Würfels
    properties
        stones;
    end
    %Farben der Steine
    properties(Constant)
        Rot = [1 10 18 4 13 21 7 15 24];
        Gruen = [1 2 3 10 11 12 18 19 20];
        Orange = [3 6 9 12 14 17 20 23 26];
        Blau = [7 8 9 15 16 17 24 25 26];
        Gelb = [1 2 3 4 5 6 7 8 9];
        Weiss = [1 2 3 4 5 6 7 8 9] + 17;
    end
    
    methods
        %Konstruktor
        function p=puzzle(stones)
            p.stones=stones;
        end
        
        %Linksdrehung (im UZS)
        function Lp(p)
            
            %Zustand vor der Drehung speichern
            s=p.stones;
            position = s(:,1);
            
            %Stein, der auf Position 1 gedreht wird
            p1=find(position == 7);
            %neue Position
            p.stones(p1,1) = 1;
            %neuer Drehindex
            if(s(p1,2) == 0)
                p.stones(p1,2) = 1;
            elseif(s(p1,2) == 1)
                p.stones(p1,2) = 0;
            end           

            p2=find(position == 15);
            p.stones(p2,1) = 4;
            if(s(p2,2) == 0)
                p.stones(p2,2) = 1;
            elseif(s(p2,2) == 1 && (any(p.Gruen == p2) || any(p.Blau == p2)))
                p.stones(p2,2) = 2;
            elseif(s(p2,2) == 1 && (any(p.Rot == p2) || any(p.Orange == p2)))
                p.stones(p2,2) = 0;
            elseif(s(p2,2) == 2 && (any(p.Rot == p2) || any(p.Orange == p2)))
                p.stones(p2,2) = 2;
            elseif s(p2,2) == 2
                p.stones(p2,2) = 1;
            end            

            p3 = find(position == 24);
            p.stones(p3,1) = 7;
            if(s(p3,2) == 0)
                p.stones(p3,2) = 1;
            elseif(s(p3,2) == 1)
                p.stones(p3,2) = 0;
            end
            
            p4 = find(position == 21);
            p.stones(p4,1) = 15;
            if(s(p4,2) == 0)
                p.stones(p4,2) = 1;
            elseif(s(p4,2) == 1 && (any(p.Weiss == p4) || any(p.Gelb == p4)))
                p.stones(p4,2) = 2;
            elseif(s(p4,2) == 1 && (any(p.Rot == p4) || any(p.Orange == p4)))
                p.stones(p4,2) = 0;
            elseif(s(p4,2) == 2 && (any(p.Rot == p4) || any(p.Orange == p4)))
                p.stones(p4,2) = 2;
            elseif s(p4,2) == 2 
                p.stones(p4,2) = 1;    
            end
            
            p5 = find(position == 18);
            p.stones(p5,1) = 24;
            if(s(p5,2) == 0)
                p.stones(p5,2) = 1;
            elseif(s(p5,2) == 1)
                p.stones(p5,2) = 0;
            end
            
            p6 = find(position == 10);
            p.stones(p6,1) = 21;
            if(s(p6,2) == 0)
                p.stones(p6,2) = 1;
            elseif(s(p6,2) == 1 && (any(p.Blau == p6) || any(p.Gruen == p6)))
                p.stones(p6,2) = 2;
            elseif(s(p6,2) == 1 && (any(p.Rot == p6) || any(p.Orange == p6)))
                p.stones(p6,2) = 0;
            elseif(s(p6,2) == 2 && (any(p.Rot == p6) || any(p.Orange == p6)))
                p.stones(p6,2) = 2;
            elseif s(p6,2) == 2 
                p.stones(p6,2) = 1;
            end            
            
            p7 = find(position == 1);
            p.stones(p7,1) = 18;
            if(s(p7,2) == 0)
                p.stones(p7,2) = 1;
            elseif(s(p7,2) == 1)
                p.stones(p7,2) = 0;
            end
            
            p8 = find(position == 4);
            p.stones(p8,1) = 10;
            if(s(p8,2) == 0)
                p.stones(p8,2) = 1;
            elseif(s(p8,2) == 1 && (any(p.Weiss == p8) || any(p.Gelb == p8)))
                p.stones(p8,2) = 2;
            elseif(s(p8,2) == 1 && (any(p.Rot == p8) || any(p.Orange == p8)))
                p.stones(p8,2) = 0;
            elseif(s(p8,2) == 2 && (any(p.Rot == p8) || any(p.Orange == p8)))
                p.stones(p8,2) = 2;
            elseif s(p8,2) == 2
                 p.stones(p8,2) = 1;    
            end                                        
        end
        
        %Rechtsdrehung (im UZS)
        function Rp(p)

            s=p.stones;
            position = s(:,1);
            
            p1=find(position == 3);
            p.stones(p1,1) = 9;
            if(s(p1,2) == 0)
                p.stones(p1,2) = 1;
            elseif(s(p1,2) == 1)
                p.stones(p1,2) = 0;
            end
           
            p2=find(position == 12);
            p.stones(p2,1) = 6;
            if(s(p2,2) == 0)
                p.stones(p2,2) = 1;
            elseif(s(p2,2) == 1 && (any(p.Gruen == p2) || any(p.Blau == p2)))
                p.stones(p2,2) = 2;
            elseif(s(p2,2) == 1 && (any(p.Rot == p2) || any(p.Orange == p2)))
                p.stones(p2,2) = 0;
            elseif(s(p2,2) == 2 && (any(p.Rot == p2) || any(p.Orange == p2)))
                p.stones(p2,2) = 2;
            elseif s(p2,2) == 2
                p.stones(p2,2) = 1;
            end
            
            p3 = find(position == 20);
            p.stones(p3,1) = 3;
            if(s(p3,2) == 0)
                p.stones(p3,2) = 1;
            elseif(s(p3,2) == 1)
                p.stones(p3,2) = 0;
            end
            
            p4 = find(position == 23);
            p.stones(p4,1) = 12;
            if(s(p4,2) == 0)
                p.stones(p4,2) = 1;
            elseif(s(p4,2) == 1 && (any(p.Weiss == p4) || any(p.Gelb == p4)))
                p.stones(p4,2) = 2;
            elseif(s(p4,2) == 1 && (any(p.Rot == p4) || any(p.Orange == p4)))
                p.stones(p4,2) = 0;
            elseif(s(p4,2) == 2 && (any(p.Rot == p4) || any(p.Orange == p4)))
                p.stones(p4,2) = 2;
            elseif s(p4,2) == 2
                p.stones(p4,2) = 1;    
            end
            
            p5 = find(position == 26);
            p.stones(p5,1) = 20;
            if(s(p5,2) == 0)
                p.stones(p5,2) = 1;
            elseif(s(p5,2) == 1)
                p.stones(p5,2) = 0;
            end
            
            p6 = find(position == 17);
            p.stones(p6,1) = 23;
            if(s(p6,2) == 0)
                p.stones(p6,2) = 1;
            elseif(s(p6,2) == 1 && (any(p.Gruen == p6) || any(p.Blau == p6)))
                p.stones(p6,2) = 2;
            elseif(s(p6,2) == 1 && (any(p.Rot == p6) || any(p.Orange == p6)))
                p.stones(p6,2) = 0;
            elseif(s(p6,2) == 2 && (any(p.Rot == p6) || any(p.Orange == p6)))
                p.stones(p6,2) = 2;
            elseif s(p6,2) == 2
                p.stones(p6,2) = 1; 
            end
            
            p7 = find(position == 9);
            p.stones(p7,1) = 26;
            if(s(p7,2) == 0)
                p.stones(p7,2) = 1;
            elseif(s(p7,2) == 1)
                p.stones(p7,2) = 0;
            end
            
            p8 = find(position == 6);
            p.stones(p8,1) = 17;
            if(s(p8,2) == 0)
                p.stones(p8,2) = 1;
            elseif(s(p8,2) == 1 && (any(p.Weiss == p8) || any(p.Gelb == p8)))
                p.stones(p8,2) = 2;
            elseif(s(p8,2) == 1 && (any(p.Rot == p8) || any(p.Orange == p8)))
                p.stones(p8,2) = 0;
            elseif(s(p8,2) == 2 && (any(p.Rot == p8) || any(p.Orange == p8)))
                p.stones(p8,2) = 2;
            elseif s(p8,2) == 2
                p.stones(p8,2) = 1;    
            end
        end
               
        %obere Drehung (gegen UZS)
        function On(p)
            
            s = p.stones;        
            position = s(:,1); 
        
            p1 = find(position == 1);
            p.stones(p1,1) = 3;
            if(s(p1,2) == 0)
                p.stones(p1,2) = 0;
            elseif(s(p1,2) == 1)
                p.stones(p1,2) = 2;
            elseif(s(p1,2) == 2)
                p.stones(p1,2) = 1;
            end 
        
            p2=find(position == 2);
            p.stones(p2,1) = 6;
            if(s(p2,2) == 0)
                p.stones(p2,2) = 1;
            elseif(s(p2,2) == 1 && (any(p.Weiss == p2) || any(p.Gelb == p2)))
                p.stones(p2,2) = 0;
            elseif(s(p2,2) == 1 && (any(p.Gruen == p2) || any(p.Blau == p2)))
                p.stones(p2,2) = 2;
            elseif(s(p2,2) == 2 && (any(p.Weiss == p2) || any(p.Gelb == p2)))           
                p.stones(p2,2) = 2;
            elseif s(p2,2) == 2
                p.stones(p2,2) = 1;       
            end
        
            p3 = find(position == 3);
            p.stones(p3,1) = 9;
            if(s(p3,2) == 0)
                p.stones(p3,2) = 0;
            elseif(s(p3,2) == 1)
                p.stones(p3,2) = 2;
            elseif(s(p3,2) == 2)
                p.stones(p3,2) = 1;
            end 
        
            p4=find(position == 6);
            p.stones(p4,1) = 8;
            if(s(p4,2) == 0)
                p.stones(p4,2) = 1;
            elseif(s(p4,2) == 1 && (any(p.Weiss == p4) || any(p.Gelb == p4)))
                p.stones(p4,2) = 0;
            elseif(s(p4,2) == 1 && (any(p.Rot == p4) || any(p.Orange == p4)))
                p.stones(p4,2) = 2;
            elseif(s(p4,2) == 2 && (any(p.Weiss == p4) || any(p.Gelb == p4)))           
                p.stones(p4,2) = 2; 
            elseif s(p4,2) == 2 
                p.stones(p4,2) = 1; 
            end
       
            p5 = find(position == 9);
            p.stones(p5,1) = 7;
            if(s(p5,2) == 0)
                p.stones(p5,2) = 0;
            elseif(s(p5,2) == 1)
                p.stones(p5,2) = 2;
            elseif(s(p5,2) == 2)
                p.stones(p5,2) = 1;
            end 
        
            p6=find(position == 8);
            p.stones(p6,1) = 4;
            if(s(p6,2) == 0)
                p.stones(p6,2) = 1;
            elseif(s(p6,2) == 1 && (any(p.Weiss == p6) || any(p.Gelb == p6)))
                p.stones(p6,2) = 0;
            elseif(s(p6,2) == 1 && (any(p.Gruen == p6) || any(p.Blau == p6)))
                p.stones(p6,2) = 2;
            elseif(s(p6,2) == 2 && (any(p.Weiss == p6) || any(p.Gelb == p6)))           
                p.stones(p6,2) = 2;
            elseif s(p6,2) == 2
                p.stones(p6,2) = 1;      
            end
        
            p7 = find(position == 7);
            p.stones(p7,1) = 1;
            if(s(p7,2) == 0)
                p.stones(p7,2) = 0;
            elseif(s(p7,2) == 1)
                p.stones(p7,2) = 2;
            elseif(s(p7,2) == 2)
                p.stones(p7,2) = 1;
            end 
        
            p8=find(position == 4);
            p.stones(p8,1) = 2;
            if(s(p8,2) == 0)
                p.stones(p8,2) = 1;
            elseif(s(p8,2) == 1 && (any(p.Weiss == p8) || any(p.Gelb == p8)))
                p.stones(p8,2) = 0;
            elseif(s(p8,2) == 1 && (any(p.Rot == p8) || any(p.Orange == p8)))
                p.stones(p8,2) = 2;
            elseif(s(p8,2) == 2 && (any(p.Weiss == p8) || any(p.Gelb == p8)))           
                p.stones(p8,2) = 2; 
            elseif s(p8,2) == 2 
                p.stones(p8,2) = 1;       
            end
        end
    
        %untere Drehung (gegen UZS)
        function Un(p)
            
            s = p.stones;
            position = s(:,1); 
        
            p1 = find(position == 18);
            p.stones(p1,1) = 24;
            if(s(p1,2) == 0)
                p.stones(p1,2) = 0;
            elseif(s(p1,2) == 1)
                p.stones(p1,2) = 2;
            elseif(s(p1,2) == 2)
                p.stones(p1,2) = 1;
            end 
        
            p2=find(position == 19);
            p.stones(p2,1) = 21;
            if(s(p2,2) == 0)
                p.stones(p2,2) = 1;
            elseif(s(p2,2) == 1 && (any(p.Weiss == p2) || any(p.Gelb == p2)))
                p.stones(p2,2) = 0;
            elseif(s(p2,2) == 1 && (any(p.Gruen == p2) || any(p.Blau == p2)))
                p.stones(p2,2) = 2;
            elseif(s(p2,2) == 2 && (any(p.Weiss == p2) || any(p.Gelb == p2)))           
                p.stones(p2,2) = 2;
            elseif s(p2,2) == 2
                p.stones(p2,2) = 1;       
            end
        
            p3 = find(position == 20);
            p.stones(p3,1) = 18;
            if(s(p3,2) == 0)
                p.stones(p3,2) = 0;
            elseif(s(p3,2) == 1)
                p.stones(p3,2) = 2;
            elseif(s(p3,2) == 2)
                p.stones(p3,2) = 1;
            end 
        
            p4=find(position == 23);
            p.stones(p4,1) = 19;
            if(s(p4,2) == 0)
                p.stones(p4,2) = 1;
            elseif(s(p4,2) == 1 && (any(p.Weiss == p4) || any(p.Gelb == p4)))
                p.stones(p4,2) = 0;
            elseif(s(p4,2) == 1 && (any(p.Rot == p4) || any(p.Orange == p4)))
                p.stones(p4,2) = 2;
            elseif(s(p4,2) == 2 && (any(p.Weiss == p4) || any(p.Gelb == p4)))           
                p.stones(p4,2) = 2;
            elseif s(p4,2) == 2 
                p.stones(p4,2) = 1;       
            end
        
            p5 = find(position == 26);
            p.stones(p5,1) = 20;
            if(s(p5,2) == 0)
                p.stones(p5,2) = 0;
            elseif(s(p5,2) == 1)
                p.stones(p5,2) = 2;
            elseif(s(p5,2) == 2)
                p.stones(p5,2) = 1;
            end 
        
            p6=find(position == 25);
            p.stones(p6,1) = 23;
            if(s(p6,2) == 0)
                p.stones(p6,2) = 1;
            elseif(s(p6,2) == 1 && (any(p.Weiss == p6) || any(p.Gelb == p6)))
                p.stones(p6,2) = 0;
            elseif(s(p6,2) == 1 && (any(p.Gruen == p6) || any(p.Blau == p6)))
                p.stones(p6,2) = 2;
            elseif(s(p6,2) == 2 && (any(p.Weiss == p6) || any(p.Gelb == p6)))           
                p.stones(p6,2) = 2;
            elseif s(p6,2) == 2 
                p.stones(p6,2) = 1;       
            end
        
            p7 = find(position == 24);
            p.stones(p7,1) = 26;
            if(s(p7,2) == 0)
                p.stones(p7,2) = 0;
            elseif(s(p7,2) == 1)
                p.stones(p7,2) = 2;
            elseif(s(p7,2) == 2)
                p.stones(p7,2) = 1;
            end 
        
            p8=find(position == 21);
            p.stones(p8,1) = 25;
            if(s(p8,2) == 0)
                p.stones(p8,2) = 1;
            elseif(s(p8,2) == 1 && (any(p.Weiss == p8) || any(p.Gelb == p8)))
                p.stones(p8,2) = 0;
            elseif(s(p8,2) == 1 && (any(p.Rot == p8) || any(p.Orange == p8)))
                p.stones(p8,2) = 2;
            elseif(s(p8,2) == 2 && (any(p.Weiss == p8) || any(p.Gelb == p8)))           
                p.stones(p8,2) = 2;
            elseif s(p8,2) == 2
                p.stones(p8,2) = 1;       
            end
        end
       
        %vordere Drehung (gegen UZS)
        function Vn(p)
            
            s = p.stones;
            position = s(:,1); 
        
            p1=find(position==1);
            p.stones(p1,1)=18;
            if(s(p1,2)==0)
                p.stones(p1,2)=2;
            elseif(s(p1,2)==2)
                p.stones(p1,2)=0;
            end
        
            p2=find(position==2);
            p.stones(p2,1)=10;      
            if(s(p2,2)==0)
                p.stones(p2,2)=1;
            elseif(s(p2,2)==1 && (any(p.Weiss == p2) || any(p.Gelb == p2)))
                p.stones(p2,2)=2;
            elseif(s(p2,2)==1)
                p.stones(p2,2)=0;
            elseif(s(p2,2) == 2 && (any(p.Gruen == p2) || any(p.Blau == p2)))           
                p.stones(p2,2) = 2;
            elseif s(p2,2) == 2
                p.stones(p2,2) = 1;   
            end
        
            p3=find(position==3);
            p.stones(p3,1)=1;
            if(s(p3,2)==0)
                p.stones(p3,2)=2;
            elseif(s(p3,2)==2)
                p.stones(p3,2)=0;
            end
        
            p4=find(position==10);
            p.stones(p4,1)=19;
            if(s(p4,2)==0)
                p.stones(p4,2)=1;
            elseif(s(p4,2)==1 && (any(p.Gruen==p4)||any(p.Blau==p4)))
                p.stones(p4,2)=0;
            elseif(s(p4,2)==1)
                p.stones(p4,2)=2;
            elseif(s(p4,2) == 2 && (any(p.Gruen == p4) || any(p.Blau == p4)))           
                p.stones(p4,2) = 2;
            elseif s(p4,2) == 2
                p.stones(p4,2) = 1;
            end    
            
            p5=find(position==12);
            p.stones(p5,1)=2;
            if(s(p5,2)==0)
                p.stones(p5,2)=1;
            elseif(s(p5,2)==1 && (any(p.Gruen==p5)||any(p.Blau==p5)))
                p.stones(p5,2)=0;
            elseif(s(p5,2)==1)
                p.stones(p5,2)=2;
            elseif(s(p5,2) == 2 && (any(p.Gruen == p5) || any(p.Blau == p5)))           
                p.stones(p5,2) = 2;
            elseif s(p5,2) == 2
                p.stones(p5,2) = 1;
            end    
        
            p6=find(position==18);
            p.stones(p6,1)=20;
            if(s(p6,2)==0)
                p.stones(p6,2)=2;
            elseif(s(p6,2)==2)
                p.stones(p6,2)=0;
            end
        
            p7=find(position==19);
            p.stones(p7,1)=12;
            if(s(p7,2)==0)
                p.stones(p7,2)=1;
            elseif(s(p7,2)==1 && (any(p.Weiss == p7) || any(p.Gelb == p7)))
                p.stones(p7,2)=2;
            elseif(s(p7,2)==1)
                p.stones(p7,2)=0;
            elseif(s(p7,2) == 2 && (any(p.Gruen == p7) || any(p.Blau == p7)))           
                p.stones(p7,2) = 2;
            elseif s(p7,2) == 2
                p.stones(p7,2) = 1;   
            end
        
            p8=find(position==20);
            p.stones(p8,1)=3;
            if(s(p8,2)==0)
                p.stones(p8,2)=2;
            elseif(s(p8,2)==2)
                p.stones(p8,2)=0;
            end
        end
    
        %hintere Drehung (gegen UZS)
        function Hn(p)
            
            s = p.stones;
            position = s(:,1); 
        
            p1=find(position==9);
            p.stones(p1,1)=26;
            if(s(p1,2)==0)
                p.stones(p1,2)=2;
            elseif(s(p1,2)==2)
                p.stones(p1,2)=0;
            end
        
            p2=find(position==8);
            p.stones(p2,1)=17;
            if(s(p2,2)==0)
                p.stones(p2,2)=1;
            elseif(s(p2,2)==1 && (any(p.Weiss == p2) || any(p.Gelb == p2)))
                p.stones(p2,2)=2;
            elseif(s(p2,2)==1)
                p.stones(p2,2)=0;
            elseif(s(p2,2) == 2 && (any(p.Gruen == p2) || any(p.Blau == p2)))           
                p.stones(p2,2) = 2;
            elseif s(p2,2) == 2
                p.stones(p2,2) = 1;  
            end
        
            p3=find(position==7);
            p.stones(p3,1)=9;
            if(s(p3,2)==0)
                p.stones(p3,2)=2;
            elseif(s(p3,2)==2)
                p.stones(p3,2)=0;
            end
        
            p4=find(position==17);
            p.stones(p4,1)=25;
            if(s(p4,2)==0)
                p.stones(p4,2)=1;
            elseif(s(p4,2)==1 && (any(p.Gruen==p4)||any(p.Blau==p4)))
                p.stones(p4,2)=0;
            elseif(s(p4,2)==1)
                p.stones(p4,2)=2;
            elseif(s(p4,2) == 2 && (any(p.Gruen == p4) || any(p.Blau == p4)))           
                p.stones(p4,2) = 2;
            elseif s(p4,2) == 2
                p.stones(p4,2) = 1;  
            end
            
            p5=find(position==15);
            p.stones(p5,1)=8;
            if(s(p5,2)==0)
                p.stones(p5,2)=1;
            elseif(s(p5,2)==1 && (any(p.Gruen==p5)||any(p.Blau==p5)))
                p.stones(p5,2)=0;
            elseif(s(p5,2)==1)
                p.stones(p5,2)=2;
            elseif(s(p5,2) == 2 && (any(p.Gruen == p5) || any(p.Blau == p5)))           
                p.stones(p5,2) = 2;
            elseif s(p5,2) == 2
                p.stones(p5,2) = 1;  
            end
        
            p6=find(position==26);
            p.stones(p6,1)=24;
            if(s(p6,2)==0)
                p.stones(p6,2)=2;
            elseif(s(p6,2)==2)
                p.stones(p6,2)=0;
            end
        
            p7=find(position==25);
            p.stones(p7,1)=15;
            if(s(p7,2)==0)
                p.stones(p7,2)=1;
            elseif(s(p7,2)==1 && (any(p.Weiss==p7) || any(p.Gelb==p7)))
                p.stones(p7,2)=2;
            elseif(s(p7,2)==1)
                p.stones(p7,2)=0;
            elseif(s(p7,2) == 2 && (any(p.Gruen == p7) || any(p.Blau == p7)))           
                p.stones(p7,2) = 2;
            elseif s(p7,2) == 2
                p.stones(p7,2) = 1;  
            end
        
            p8=find(position==24);
            p.stones(p8,1)=7;
            if(s(p8,2)==0)
                p.stones(p8,2)=2;
            elseif(s(p8,2)==2)
                p.stones(p8,2)=0;
            end
        end

        %die verbleibenden Drehungen
        function Hp(p)
            Hn(p)
            Hn(p)
            Hn(p)
        end
    
        function Op(p)
            On(p)
            On(p)
            On(p)
        end
    
        function Up(p)
            Un(p)
            Un(p)
            Un(p)
        end
    
        function Ln(p)
            Lp(p)
            Lp(p)
            Lp(p)
        end
    
        function Rn(p)
            Rp(p)
            Rp(p)
            Rp(p)
        end
    
        function Vp(p)
            Vn(p)
            Vn(p)
            Vn(p)
        end
    
    end
end
