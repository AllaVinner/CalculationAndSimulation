function beamOut=reflect(beamIn, mirror)

w = 1/norm(mirror) * mirror;
M = 2*(w*w')-eye(2);

beamOut = M*beamIn;