clc;
clear;
close all;


t1 = 0:0.5:20;
y1 = sin(0.5*t1);

t2 = 0:1:20;
y2 = sin(0.5*t2);

figure;
subplot(2,1,1)
plot(t1,y1,'*-');
xlabel('t');ylabel('y');
grid on;

subplot(2,1,2)
plot(t2,y2,'*-');
xlabel('t');ylabel('y');
grid on;


y3 = 5 + rand(1,50);
t3 = linspace(0,20,50);
figure;
plot(t3,y3,'*-');
title('unstable signal');
xlabel('t');ylabel('y');
grid on;

