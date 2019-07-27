% 
clc;
clear;
close all;

t = -10:0.05:10;
y = 1*(t>-5&t<5);
figure
plot(t,y);
xlabel('t');ylabel('y_{window}');grid on;

t = 0:0.05:50;
y = 1*(t>20&t<30);
figure
plot(t,y,'r','LineWidth',2);
hold on

t_signal = 0:0.05:50;
y_signal = sin(5*t_signal);
plot(t_signal,y_signal,'b');
hold off
legend('y_{window}(t-25)','sin(5t)');
title('y & y_{window}(t-25)')
xlabel('t');ylabel('y/y_{window}');grid on;

figure
plot(t,y.*y_signal);
title('y*y_{window}(t-25)')
xlabel('t');ylabel('y');grid on;


