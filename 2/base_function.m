% 
clc;
clear;
close all;

% 
t = 0:0.05:50;
y_base1 = sin(5*t);
figure
plot(t,y_base1);
title('FT base function')
xlabel('t');ylabel('y');grid on;

ts = 25;
width = 10;
left = ts-width/2;
right = ts+width/2;
y_window = 1*(t<right & t>left);
y_base2 = y_base1.*y_window;

figure
plot(t,y_base2);
title('STFT base function')
xlabel('t');ylabel('y');grid on;

