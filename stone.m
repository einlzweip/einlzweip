classdef stone
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
    end 
end

