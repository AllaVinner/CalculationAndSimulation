function tf=isInside(r, u, v)

n=[0 -1; 1 0]*v;

toBeProjected = r - u;

if( dot(n, toBeProjected) > 0 )
    tf = true;
else 
    tf = false;
end
    