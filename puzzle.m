classdef puzzle < handle
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        stones;
    end
    properties(Constant)
        Rot = [1 10 18 4 13 21 7 15 24];
        Grün = [1 2 3 10 11 12 18 19 20];
        Orange = [3 6 9 12 14 17 20 23 26];
        Blau = Grün + 6;
        Gelb = [1 2 3 4 5 6 7 8 9];
        Weiß = Gelb + 17;
    end
    
    methods
        function p=puzzle(stones)
            p.stones=stones;
        end
        function Lp(p)
            s=p.stones;
            position = s(:,1);
            
            p1=find(position == 7);
            p.stones(p1,1) = 1;
            if(s(p1,2) == 0)
                p.stones(p1,2) = 1;
            elseif(p1.turn==1)
                p1.turn=0;
            end
            
            p.stones(4) = s(15);
            p2=find(position == 15);
            p.stones(p2,1) = 4
            if(s(p2,2) == 0)
                p.stones(p2,2) = 1;
            elseif(s(p2,2) == 1 & (any(p.Rot == p2) | any(p.Orange == p2)))
                p.stones(p2,2) = 0;
            elseif(s(p2,2) == 1 & (any(p.Grün == p2) | any(p.Blau == p2)))
                p.stones(p2,2) = 2;
            elseif(s(p2,2) == 2 & (any(p.Rot == p2) | any(p.Orange == p2)))
                p.stones(p2,2) = 2;
            elseif(s(p2,2) == 2 & (any(p.Grün == p2) | any(p.Blau == p2)))
                p.stones(p2,2) = 1;
               
            end
            p.stones(7)=s(24);
            p3=s(24)
            if (p3.turn==0)
                p3.turn=1;
            elseif(p3.turn==1)
                p3.turn=0;
            end       
            p.stones(10)=s(4);
            p4=s(4);
            
            p.stones(15)=s(21);
            p.stones(18)=s(1);
            p.stones(21)=s(10);
            p.stones(24)=s(18);
        end
    end
    
end

