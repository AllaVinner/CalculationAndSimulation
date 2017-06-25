
%% Create the polygon

%Vertices vectors
u1 = [1;-3];
u2 = [2;4];
u3 = [-0.3;4];
u4 = [-5;-3];

%Side vectors
v1 = u2 - u1;
v2 = u3 - u2;
v3 = u4 - u3;
v4 = u1 - u4;

shape = [u1 u2 u3 u4 u1];
scale=1.2*max(max(abs(shape)));
%plot the window and make it square
figure(2),clf,axis([-scale scale -scale scale]),axis('equal')
set(gcf,'DoubleBuffer','on');
hold on
plot(shape(1,:), shape(2,:));

% Delete when know how to make the screen bigger...

%% OP 2 Create the ball
r = [0; 0];
c = [0.1;0];
kMax = 250;
dt = 0.3;
%% OP 3 Simulate it
title('Ray reflection in a polygon')
xlabel('x-axis, distance [m]')
ylabel('y-axis, distance [m]')
for t = 1:dt:dt*kMax
    r = r + dt*c;
    
    % Check if inside/before the line
    if(~isInside(r,u1,v1))
        %If one wants the bouncing point to be inside the rectangle
        r = r - dt*c;
        c=reflect(c,v1);    %Reflect the line
        %Added to 1. dont have to have remember old place and 2. Dont stop
        %when reflected
        r = r + dt*c;
    end
    if(~isInside(r,u2,v2))
        c=reflect(c,v2);    %Reflect the line
        %Added to 1. dont have to have remember old place and 2. Dont stop
        %when reflected
        r = r + dt*c;
    end
    if(~isInside(r,u3,v3))
        c=reflect(c,v3);    %Reflect the line
        %Added to 1. dont have to have remember old place and 2. Dont stop
        %when reflected
        r = r + dt*c;
    end
    if(~isInside(r,u4,v4))
        c=reflect(c,v4);    %Reflect the line
        %Added to 1. dont have to have remember old place and 2. Dont stop
        %when reflected
        r = r + dt*c;
    end
    figure(2),plot(r(1),r(2),'.r')
  % pause(0.1);
end;


