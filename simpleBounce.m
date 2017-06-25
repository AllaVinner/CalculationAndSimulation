

%% OP 1 Create the bouncing line

% Initialze the vectors to the vertices
u1= [ 1;-2];
u2= [ 2;3];


% Initialze the line-vector
v1=u2-u1;
vLine = [u1 u1+v1];
n= [ 0 -1; 1 0]*v1;
nLine = [u1 u1+n];
scale = 1.2*max(max(abs(vLine)));
figure(2),clf,axis([-scale scale -scale scale]),axis('equal')
hold on
plot(vLine(1, :),vLine(2, :));
plot(nLine(1, :),nLine(2, :));



%% OP 2 Create the ball

r = [0; 0];
c = [0.2;0];
kMax = 40;
dt = 1;


%% OP 3 Simulate it
for t = 1:dt:dt*kMax
    r = r + dt*c;
    
    % Check if inside/before the line
    if(~isInside(r,u1,v1))
        c=reflect(c,v1);    %Reflect the line
        %Added to 1. dont have to have remember old place and 2. Dont stop
        %when reflected
        r = r + dt*c;
    end        
    plot(r(1), r(2), 'o');
    pause(0.5);
end;


