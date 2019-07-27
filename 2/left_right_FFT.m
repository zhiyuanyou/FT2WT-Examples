% 
clc;
clear;
close all;
addpath('../Basic')

% 采样频率为20HZ，根据采样定理，最大可检测信号为10HZ，对应63rad/s
% 若信号的频率超过63rad/s，则产生紊乱
f = @(t) sin(t);
t = 0:0.05:50;
y = f(t);

figure
plot(t,y,'.');
title('y=sin(t)');grid on;xlabel('t');ylabel('y');

% 
t1_1 = 0:0.05:25;
y1_1 = sin(5*t1_1);
t1_2 = 25:0.05:50;
y1_2 = sin(t1_2);
t1 = [t1_1(1:end-1),t1_2];
y1 = [y1_1(1:end-1),y1_2];
figure
plot(t1,y1);
title('y1=sin(5t)*(0<t<25)+sin(t)*(25<t<50)');grid on;xlabel('t');ylabel('y');

% 
t2_1 = 0:0.05:25;
y2_1 = sin(t2_1);
t2_2 = 25:0.05:50;
y2_2 = sin(5*t2_2);

t2 = [t2_1,t2_2];
y2 = [y2_1,y2_2];
figure
plot(t2,y2);
title('y2=sin(t)*(0<t<25)+sin(5t)*(25<t<50)');grid on;xlabel('t');ylabel('y');

% use the fft the draw the Single-Sided Amplitude Spectrum
Fs = 20;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1002;             % Length of signal
t = (0:L-1)*T;        % Time vector
Y = fft(y1);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L*2*pi;
figure
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of y1');
xlabel('w (rad/s)');ylabel('|X(w)|');grid on;

% use the fft the draw the Single-Sided Amplitude Spectrum
Fs = 20;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1002;             % Length of signal
Y = My_FFT(y2);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L*2*pi;
figure
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of y2');
xlabel('w (rad/s)');ylabel('|X(w)|');grid on;
axis([0,70,0,0.5]);

% use the fft the draw the Single-Sided Amplitude Spectrum
Fs = 20;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 502;             % Length of signal
Y = My_FFT(y1_1);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L*2*pi;
figure
subplot(2,2,1)
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of left-y1');
xlabel('w (rad/s)');ylabel('|X(w)|');grid on;

% use the fft the draw the Single-Sided Amplitude Spectrum
Fs = 20;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 502;             % Length of signal
Y = My_FFT(y1_2);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L*2*pi;
subplot(2,2,2)
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of right-y1');
xlabel('w (rad/s)');ylabel('|X(w)|');grid on;

% use the fft the draw the Single-Sided Amplitude Spectrum
Fs = 20;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 502;             % Length of signal
t = (0:L-1)*T;        % Time vector
Y = My_FFT(y2_1);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L*2*pi;
subplot(2,2,3)
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of left-y2');
xlabel('w (rad/s)');ylabel('|X(w)|');grid on;

% use the fft the draw the Single-Sided Amplitude Spectrum
Fs = 20;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 502;             % Length of signal
Y = My_FFT(y2_2);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L*2*pi;
subplot(2,2,4)
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of right-y2');
xlabel('w (rad/s)');ylabel('|X(w)|');grid on;

