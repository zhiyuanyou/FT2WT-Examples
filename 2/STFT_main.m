% 
clc;
clear;
close all;
addpath('../Basic');

% 
width = 10;
t = 0:0.05:50;
y = sin(20*t).*(t<25) + sin(t).*(t>=25);

ts_list = [5,25,45];

for ts = ts_list
    
    left = ts-width/2;
    right = ts+width/2;
    y_window = (t<right & t>left);
    y_fft = y.*y_window;
    
    figure
    plot(t,y,'b') 
    hold on;
    plot(t,y_window,'r','LineWidth',2);
    hold off;
    title(['y1 & y_{window}(t=',num2str(ts),')'])
    xlabel('t');ylabel('y/y_{window}');grid on;

    % use the fft the draw the Single-Sided Amplitude Spectrum
    Fs = 20;            % Sampling frequency                    
    T = 1/Fs;             % Sampling period       
    L = 1002;             % Length of signal
    Y = My_FFT(y_fft);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = Fs*(0:(L/2))/L*2*pi;
    
    figure
    plot(f,P1) 
    title(['Single-Sided Amplitude Spectrum of (t_s =',num2str(ts),')']);
    xlabel('w (rad/s)');ylabel('|X(w)|');grid on;
    
end

% STFT
figure
for ts_stft = 0:0.1:50
    STFT_funciton(ts_stft,width);
end
title('The STFT');
xlabel('w/rad/s');ylabel('ts/s');zlabel('|X(w,ts)|');
grid on;
