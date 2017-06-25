%% Bouning generic


%% Create the polygon
%Initialization of U (vertices vectors)
t = 0:0.7:2*pi;
x = cos(t);
y = sin(t);
U = [1 3 0.3 -1 -2 -1;
     -3 0 4  3  0 -3];
U = [x ; y];

 %Initialize the number of vertices
 n = size(U);
 n= n(2);
 
%Initialization of V (side vectors)
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


%% OP 2 Create the ball
r = [0; 0];
c = [0.1;0.1];
kMax = 600;
dt = 0.1;
%% OP 3 Simulate it
title('Ray reflection in a polygon')
xlabel('x-axis, distance [m]')
ylabel('y-axis, distance [m]')
for t = 1:dt:dt*kMax
    r = r + dt*c;
    
    % Check if inside/before the side, side 1 to n
    for i = 1:n
       if(~isInside(r,U(:,i),V(:,i)))
            r = r - dt*c;   %Reverse on step to get inside of the polygon
            c = reflect(c,V(:,i));    %Reflect the line
            
            %Added to 1. dont have to have remember old place and
            % 2. The beam do not stop when reflected
            r = r + dt*c;
        end
    end
   
   
    figure(2),plot(r(1),r(2),'.r')
  % pause(0.1);
end;


