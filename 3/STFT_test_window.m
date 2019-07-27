% 
clc;
clear;
close all;

% 
f = @(t) sin(300*2*pi*t).*(t<=0.25)+sin(200*2*pi*t).*(t<=0.5 & t>0.25)+sin(100*2*pi*t).*(t<=0.75 & t>0.5)+sin(50*2*pi*t).*(t<=1 & t>0.75);
t = 0:0.0005:1;
y = f(t);

% 
figure
plot(t,y);
xlabel('x');ylabel('y');
grid on;
title('original signal');

% width value list: 0.02,0.1,0.3
width_list = [0.02,0.1,0.3];
Fs = 2000;

for width = width_list
    
    figure
    for ts = 0:0.01:1
        STFT_funciton(y,t,Fs,ts,width);
    end
    xlabel('f(HZ)');ylabel('ts(s)');zlabel('|X(f,ts)|');
    grid on;
    title(['The STFT: width = ',num2str(width)]);
    
end


