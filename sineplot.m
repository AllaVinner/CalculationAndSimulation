%% First script
%Sineplot
%
%Definitions of paramiters and variables
%
%Definition of time
t=[0:0.1:10];
%Definition of angular velocity
w = 2;
%%Calculations
%
%Calculation of sine
y = sin (w*t);
%%Plot of graf
%
%Activation of window
figure(2);
%Plot a graf in the generated window
plot(t,y);
figure(gcf);
title('sineplot');
xlabel('Time secounds');
ylabel('sin(wt)');

