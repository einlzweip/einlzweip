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
            elseif(s(p1,2) == 1)
                p1.turn = 0;
            end
           
            p2=find(position == 15);
            p.stones(p2,1) = 4;
            if(s(p2,2) == 0)
                p.stones(p2,2) = 1;
            elseif(s(p2,2) == 1 & (any(p.Rot == p2) | any(p.Orange == p2)))
                p.stones(p2,2) = 0;
            elseif(s(p2,2) == 1 & (any(p.Grün == p2) | any(p.Blau == p2)))
                p.stones(p2,2) = 2;
            elseif(s(p2,2) == 2 & (any(p.Rot == p2) | any(p.Orange == p2)))
                p.stones(p2,2) = 2;
            elseif(s(p2,2) == 2 & (any(p.Grün == p2) | any(p.Blau == p2)))
                p.stones(p2,2) = 1    
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
                
            
           
        end
        
    function Occ(p)
        s = p.stones;
        position = s(:,1); 
        
        q1 = find(position == 1);
        p.stones(q1,1) = 3;
        if(s(q1,2) == 0)
            p.stones(q1,2) = 1;
        elseif(s(q1,2) == 1)
        p.stones(q1,2) = 0;
        eq4=find(position == 6);
        p.stones(q4,1) = 8;
        if(s(q4,2) == 0)
            p.stones(q4,2) = 1;
        elseif(s(q4,2) == 1 & (any(p.Weiß == q4) | any(p.Gelb == q4)))
            p.stones(q4,2) = 0;
        elseif(s(q4,2) == 1 & (any(p.Rot == q4) | any(p.Orange == q4)))
            p.stones(q4,2) = 2;
        elseif(s(q4,2) == 2 & (any(p.Weiß == q4) | any(p.Gelb == q4)           
            p.stones(q4,2) = 2;
        elseif(s(q4,2) == 2 & (any(p.Rot == q4) | any(p.Orange == q4)))
            p.stones(q4,2) = 1;       
        end
        q2=find(position == 2);
        p.stones(q2,1) = 6;
        if(s(q2,2) == 0)
            p.stones(q2,2) = 1;
        elseif(s(q2,2) == 1 & (any(p.Weiß == q2) | any(p.Gelb == q2)))
            p.stones(q2,2) = 0;
        elseif(s(q2,2) == 1 & (any(p.Grün == q2) | any(p.Blau == q2)))
            p.stones(q2,2) = 2;
        elseif(s(q2,2) == 2 & (any(p.Weiß == q2) | any(p.Gelb == q2)           
            p.stones(q2,2) = 2;
        elseif(s(q2,2) == 2 & (any(p.Grün == q2) | any(p.Blau == q2)))
            p.stones(q2,2) = 1;       
        end
        
        q3 = find(position == 3);
        p.stones(q3,1) = 9;
        if(s(q3,2) == 0)
            p.stones(q3,2) = 1;
        elseif(s(q3,2) == 1)
            p.stones(q3,2) = 0;
        end 
        
        q4=find(position == 6);
        p.stones(q4,1) = 8;
        if(s(q4,2) == 0)
            p.stones(q4,2) = 1;
        elseif(s(q4,2) == 1 & (any(p.Weiß == q4) | any(p.Gelb == q4)))
            p.stones(q4,2) = 0;
        elseif(s(q4,2) == 1 & (any(p.Rot == q4) | any(p.Orange == q4)))
            p.stones(q4,2) = 2;
        elseif(s(q4,2) == 2 & (any(p.Weiß == q4) | any(p.Gelb == q4)           
            p.stones(q4,2) = 2;
        elseif(s(q4,2) == 2 & (any(p.Rot == q4) | any(p.Orange == q4)))
            p.stones(q4,2) = 1;       
        end
        
        q5 = find(position == 9);
        p.stones(q5,1) = 7;
        if(s(q5,2) == 0)
            p.stones(q5,2) = 1;
        elseif(s(q5,2) == 1)
            p.stones(q5,2) = 0;
        end 
        
        q6=find(position == 8);
        p.stones(q6,1) = 4;
        if(s(q6,2) == 0)
            p.stones(q6,2) = 1;
        elseif(s(q6,2) == 1 & (any(p.Weiß == q6) | any(p.Gelb == q6)))
            p.stones(q6,2) = 0;
        elseif(s(q6,2) == 1 & (any(p.Grün == q6) | any(p.Blau == q6)))
            p.stones(q6,2) = 2;
        elseif(s(q6,2) == 2 & (any(p.Weiß == q6) | any(p.Gelb == q6)           
            p.stones(q6,2) = 2;
        elseif(s(q6,2) == 2 & (any(p.Grün == q6) | any(p.Blau == q6)))
            p.stones(q6,2) = 1;       
        end
        
        q7 = find(position == 7);
        p.stones(q7,1) = 1;
        if(s(q7,2) == 0)
            p.stones(q7,2) = 1;
        elseif(s(q7,2) == 1)
            p.stones(q7,2) = 0;
        end 
        
        q8=find(position == 4);
        p.stones(q8,1) = 2;
        if(s(q8,2) == 0)
            p.stones(q8,2) = 1;
        elseif(s(q8,2) == 1 & (any(p.Weiß == q8) | any(p.Gelb == q8)))
            p.stones(q8,2) = 0;
        elseif(s(q8,2) == 1 & (any(p.Rot == q8) | any(p.Orange == q8)))
            p.stones(q8,2) = 2;
        elseif(s(q8,2) == 2 & (any(p.Weiß == q8) | any(p.Gelb == q8)           
            p.stones(q8,2) = 2;
        elseif(s(q8,2) == 2 & (any(p.Rot == q8) | any(p.Orange == q8)))
            p.stones(q8,2) = 1;       
        end
        
        
        
    end
    
end

