classdef puzzle < handle
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        stones;
    end
    properties(Constant)
        Rot = [1 10 18 4 13 21 7 15 24];
        Gruen = [1 2 3 10 11 12 18 19 20];
        Orange = [3 6 9 12 14 17 20 23 26];
        Blau = [7 8 9 15 16 17 24 25 26];
        Gelb = [1 2 3 4 5 6 7 8 9];
        Weiss = [1 2 3 4 5 6 7 8 9] + 17;
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
                p.stones(p1,2) = 0;
            end
           
            p2=find(position == 15);
            p.stones(p2,1) = 4;
            if(s(p2,2) == 0)
                p.stones(p2,2) = 1;
            elseif(s(p2,2) == 1 && (any(p.Weiss == p2) || any(p.Gelb == p2)))
                p.stones(p2,2) = 0;
            elseif(s(p2,2) == 1 && (any(p.Rot == p2) || any(p.Orange == p2)))
                p.stones(p2,2) = 2;
            elseif(s(p2,2) == 2 && (any(p.Weiss == p2) || any(p.Gelb == p2)))
                p.stones(p2,2) = 2;
            elseif(s(p2,2) == 2 && (any(p.Rot == p2) || any(p.Orange == p2)))
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
            elseif(s(p4,2) == 2 && (any(p.Weiss == p4) || any(p.Gelb == p4)))
                p.stones(p4Lp,2) = 2;
            elseif(s(p4,2) == 2 && (any(p.Rot == p4) || any(p.Orange == p4)))
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
            elseif(s(p6,2) == 1 && (any(p.Weiss == p6) || any(p.Gelb == p6)))
                p.stones(p6,2) = 0;
            elseif(s(p6,2) == 1 && (any(p.Rot == p6) || any(p.Orange == p6)))
                p.stones(p6,2) = 2;
            elseif(s(p6,2) == 2 && (any(p.Weiss == p6) || any(p.Gelb == p6)))
                p.stones(p6,2) = 2;
            elseif(s(p6,2) == 2 && (any(p.Rot == p6) || any(p.Orange == p6)))
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
            elseif(s(p8,2) == 2 && (any(p.Weiss == p8) || any(p.Gelb == p8)))
                p.stones(p8,2) = 2;
            elseif(s(p8,2) == 2 && (any(p.Rot == p8) || any(p.Orange == p8)))
                p.stones(p8,2) = 1;    
            end
            
                
            
           
        end
        
        
        function Rp(p)
            s=p.stones;
            position = s(:,1);
            
            p1=find(position == 7);
            p.stones(p1,1) = 1;
            if(s(p1,2) == 0)
                p.stones(p1,2) = 1;
            elseif(s(p1,2) == 1)
                p.stones(p1,2) = 0;
            end
           
            p2=find(position == 15);
            p.stones(p2,1) = 4;
            if(s(p2,2) == 0)
                p.stones(p2,2) = 1;
            elseif(s(p2,2) == 1 && (any(p.Weiss == p2) || any(p.Gelb == p2)))
                p.stones(p2,2) = 0;
            elseif(s(p2,2) == 1 && (any(p.Rot == p2) || any(p.Orange == p2)))
                p.stones(p2,2) = 2;
            elseif(s(p2,2) == 2 && (any(p.Weiss == p2) || any(p.Gelb == p2)))
                p.stones(p2,2) = 2;
            elseif(s(p2,2) == 2 && (any(p.Rot == p2) || any(p.Orange == p2)))
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
            elseif(s(p4,2) == 2 && (any(p.Weiss == p4) || any(p.Gelb == p4)))
                p.stones(p4Lp,2) = 2;
            elseif(s(p4,2) == 2 && (any(p.Rot == p4) || any(p.Orange == p4)))
                p.stones(p4,2) = 1;    
            end
            
            p5 = find(position == 18);
            p.stones(p5,1) = 24;
            if(s(p5,2) == 0)
                p.stones(p5,2) = 1;
            elseif(s(p5,2) == 1)
                p.stones(p5,2) = 0;
            end
            
            p6 = find(position == 17);
            p.stones(p6,1) = 22;
            if(s(p6,2) == 0)
                p.stones(p6,2) = 1;
            elseif(s(p6,2) == 1 && (any(p.Weiss == p6) || any(p.Gelb == p6)))
                p.stones(p6,2) = 0;
            elseif(s(p6,2) == 1 && (any(p.Rot == p6) || any(p.Orange == p6)))
                p.stones(p6,2) = 2;
            elseif(s(p6,2) == 2 && (any(p.Weiss == p6) || any(p.Gelb == p6)))
                p.stones(p6,2) = 2;
            elseif(s(p6,2) == 2 && (any(p.Rot == p6) || any(p.Orange == p6)))
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
            elseif(s(p8,2) == 2 && (any(p.Weiss == p8) || any(p.Gelb == p8)))
                p.stones(p8,2) = 2;
            elseif(s(p8,2) == 2 && (any(p.Rot == p8) || any(p.Orange == p8)))
                p.stones(p8,2) = 1;    
            end
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
        end 
        
        q4=find(position == 6);
        p.stones(q4,1) = 8;
        if(s(q4,2) == 0)
            p.stones(q4,2) = 1;
        elseif(s(q4,2) == 1 && (any(p.Weiss == q4) || any(p.Gelb == q4)))
            p.stones(q4,2) = 0;
        elseif(s(q4,2) == 1 && (any(p.Rot == q4) || any(p.Orange == q4)))
            p.stones(q4,2) = 2;
        elseif(s(q4,2) == 2 && (any(p.Weiss == q4) || any(p.Gelb == q4)))           
            p.stones(q4,2) = 2;
        elseif(s(q4,2) == 2 && (any(p.Rot == q4) || any(p.Orange == q4)))
            p.stones(q4,2) = 1;       
        end
        q2=find(position == 2);
        p.stones(q2,1) = 6;
        if(s(q2,2) == 0)
            p.stones(q2,2) = 1;
        elseif(s(q2,2) == 1 && (any(p.Weiss == q2) || any(p.Gelb == q2)))
            p.stones(q2,2) = 0;
        elseif(s(q2,2) == 1 && (any(p.Gruen == q2) || any(p.Blau == q2)))
            p.stones(q2,2) = 2;
        elseif(s(q2,2) == 2 && (any(p.Weiss == q2) || any(p.Gelb == q2)))           
            p.stones(q2,2) = 2;
        elseif(s(q2,2) == 2 && (any(p.Gruen == q2) || any(p.Blau == q2)))
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
        elseif(s(q4,2) == 1 && (any(p.Weiss == q4) || any(p.Gelb == q4)))
            p.stones(q4,2) = 0;
        elseif(s(q4,2) == 1 && (any(p.Rot == q4) || any(p.Orange == q4)))
            p.stones(q4,2) = 2;
        elseif(s(q4,2) == 2 && (any(p.Weiss == q4) || any(p.Gelb == q4)))           
            p.stones(q4,2) = 2;
        elseif(s(q4,2) == 2 && (any(p.Rot == q4) || any(p.Orange == q4)))
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
        elseif(s(q6,2) == 1 && (any(p.Weiss == q6) || any(p.Gelb == q6)))
            p.stones(q6,2) = 0;
        elseif(s(q6,2) == 1 && (any(p.Gruen == q6) || any(p.Blau == q6)))
            p.stones(q6,2) = 2;
        elseif(s(q6,2) == 2 && (any(p.Weiss == q6) || any(p.Gelb == q6)))           
            p.stones(q6,2) = 2;
        elseif(s(q6,2) == 2 && (any(p.Gruen == q6) || any(p.Blau == q6)))
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
        elseif(s(q8,2) == 1 && (any(p.Weiss == q8) || any(p.Gelb == q8)))
            p.stones(q8,2) = 0;
        elseif(s(q8,2) == 1 && (any(p.Rot == q8) || any(p.Orange == q8)))
            p.stones(q8,2) = 2;
        elseif(s(q8,2) == 2 && (any(p.Weiss == q8) || any(p.Gelb == q8)))           
            p.stones(q8,2) = 2;
        elseif(s(q8,2) == 2 && (any(p.Rot == q8) || any(p.Orange == q8)))
            p.stones(q8,2) = 1;       
        end
    end
       
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
        elseif((any(p.Weiss==p2)||any(p.Gelb==p2)&&(any(p.Rot==p2)||any(p.Orange==p2))))
            p.stones(p2,2)=1;
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
        elseif((any(p.Weiss==p4)||any(p.Gelb==p4)&&(any(p.Orange==p4)||any(p.Rot==p4))))
            p.stones(p4,2)=1;
        end    
            
        p5=find(position==12);
        p.stones(p5,1)=2;
        if(s(p5,2)==0)
            p.stones(p5,2)=1;
        elseif(s(p5,2)==1 && (any(p.Gruen==p5)||any(p.Blau==p5)))
            p.stones(p5,2)=0;
        elseif(s(p5,2)==1)
            p.stones(p5,2)=2;
        elseif((any(p.Weiss==p5)||any(p.Gelb==p5)&&(any(p.Orange==p5)||any(p.Rot==p5))))
            p.stones(p5,2)=1;
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
        elseif(s(p7,2)==1 && (any(p.Weiss==p7) || any(p.Gelb==p7)))
            p.stones(p7,2)=2;
        elseif(s(p7,2)==1)
            p.stones(p7,2)=0;
        elseif((any(p.Weiss==p7)||any(p.Gelb==p7)&&(any(p.Rot==p7)||any(p.Orange==p7))))
            p.stones(p7,2)=1;
        end
        
        p8=find(position==20);
        p.stones(p8,1)=3;
        if(s(p8,2)==0)
            p.stones(p8,2)=2;
        elseif(s(p8,2)==2)
            p.stones(p8,2)=0;
        end
    end
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
        elseif((any(p.Weiss==p2)||any(p.Gelb==p2)&&(any(p.Rot==p2)||any(p.Orange==p2))))
            p.stones(p2,2)=1;
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
        elseif((any(p.Weiss==p4)||any(p.Gelb==p4)&&(any(p.Orange==p4)||any(p.Rot==p4))))
            p.stones(p4,2)=1;
        end    
            
        p5=find(position==15);
        p.stones(p5,1)=8;
        if(s(p5,2)==0)
            p.stones(p5,2)=1;
        elseif(s(p5,2)==1 && (any(p.Gruen==p5)||any(p.Blau==p5)))
            p.stones(p5,2)=0;
        elseif(s(p5,2)==1)
            p.stones(p5,2)=2;
        elseif((any(p.Weiss==p5)||any(p.Gelb==p5)&&(any(p.Orange==p5)||any(p.Rot==p5))))
            p.stones(p5,2)=1;
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
        elseif((any(p.Weiss==p7)||any(p.Gelb==p7)&&(any(p.Rot==p7)||any(p.Orange==p7))))
            p.stones(p7,2)=1;
        end
        
        p8=find(position==24);
        p.stones(p8,1)=7;
        if(s(p8,2)==0)
            p.stones(p8,2)=2;
        elseif(s(p8,2)==2)
            p.stones(p8,2)=0;
        end
end
    
    end
end
