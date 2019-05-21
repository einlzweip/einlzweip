classdef puzzle < handle
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        stones;
    end
    
    methods
        function p=puzzle(stones)
            p.stones=stones;
        end
        function Lp(p)
            s=p.stones;
            p1=s(7);
            p.stones(1)=s(7);
            if(p1.turn==0)
                p1.turn=1;
            elseif(p1.turn==1)
                p1.turn=0;
            end
            p.stones(4)=s(15);
            p5=s(15);
            if(p1
            p2=s(7);
            p.stones(1)=s(7);
            if(p2.turn==0)
                p2.turn=1;
            elseif(p2.turn==1)
                p2.turn=0;
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

