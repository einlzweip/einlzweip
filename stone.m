classdef stone < handle
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        type;
        colors;
        turn;
    end
    
    methods
        function s = stone(type,colors,turn)
            s.type=type;
            s.colors=colors;
            s.turn=turn;
        end
        function s1 = set(s,type)
            s1=s;
            s1.type=type;
        end
        function set2(a,type)
            a.type=type;
        end
    end 
end

