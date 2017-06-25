
%% Create the polygon


%Vertices vectors
U = [1 2 -0.3 -5 -1;
     -3 4 4 -1  -4];
 n = size(U);
 n= n(2);
V =zeros(2,n);
 for i= 1:n
    V(:,i)=U(:,mod(i,n)+1)-U(:,i);
 end
shape = [U U(:,1)];
scale=1.2*max(max(abs(shape)));
%plot the window and make it square
figure(2),clf,axis([-scale scale -scale scale]),axis('equal')
set(gcf,'DoubleBuffer','on');
hold on
plot(shape(1,:), shape(2,:));

% Delete when know how to make the screen bigger...

%% OP 2 Create the ball
r = [0; 0];
c = [0.1;0.1];
kMax = 550;
dt = 0.3;
%% OP 3 Simulate it
title('Ray reflection in a polygon')
xlabel('x-axis, distance [m]')
ylabel('y-axis, distance [m]')
for t = 1:dt:dt*kMax
    r = r + dt*c;
    
    % Check if inside/before the line
    for i = 1:n
       if(~isInside(r,U(:,i),V(:,i)))
            c=reflect(c,V(:,i));    %Reflect the line
            %Added to 1. dont have to have remember old place and 2. Dont stop
            %when reflected
            r = r + dt*c;
        end
    end
   
   
    figure(2),plot(r(1),r(2),'.r')
  % pause(0.1);
end;


