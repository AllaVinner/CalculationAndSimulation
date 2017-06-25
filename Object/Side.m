classdef Side
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        start;
        ending;
        v=start-ending;
    end
    
    methods
        function tf=isInside(r,side)

            n=[0 -1; 1 0]*side.v;

            toBeProjected = r - side.start;

            if( dot(n, toBeProjected) > 0 )
                tf = true;
            else 
                tf = false;
            end
        end % End function isInside
    
        function beamOut=reflect(beamIn, side)

        w = 1/norm(side.v) * side.v;
        M = 2*(w*w')-eye(2);

        beamOut = M*beamIn;
        end %End reflect
    end %Metod ending

end
