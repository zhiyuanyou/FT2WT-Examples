% 
clc;
clear;
close all;
addpath('../Basic');

% Define the function
f = @(t) sin(3*t);
f1 = @(t) sin(3*t).*sin(4*t);
f2 = @(t) sin(3*t).*sin(3.1*t);
f3 = @(t) sin(3*t).*sin(3*t);

t = 0:0.05:50;
y = f(t);
y1 = f1(t);
y2 = f2(t);
y3 = f3(t);

% draw pic & calculate the integraton
figure
plot(t,y);
title('y=sin(3t)');grid on;xlabel('t');ylabel('y');
int_res = double(integral(f,0,50))

figure
plot(t,y1);
title('y1=sin(3t)*sin(4t)');grid on;xlabel('t');ylabel('y1');
int_res1 = double(integral(f1,0,50))

figure
plot(t,y2);
title('y2=sin(3t)*sin(3.1t)');grid on;xlabel('t');ylabel('y2');
int_res2 = double(integral(f2,0,50))

figure
plot(t,y3);
title('y3=sin(3t)*sin(3t)');grid on;xlabel('t');ylabel('y3');
int_res3 = double(integral(f3,0,50))

% use the fft the draw the Single-Sided Amplitude Spectrum
Fs = 20;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1000;             % Length of signal
t = (0:L-1)*T;        % Time vector
S = sin(3*t);
% My_FFT is my own defined function in '../Basic'. You can use Matlab function fft(), 
% use 'help fft' to see how to use fft.
Y = My_FFT(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L*2*pi;
figure
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of y=sin(3t)')
xlabel('w (rad/s)');ylabel('|X(w)|');grid on;

