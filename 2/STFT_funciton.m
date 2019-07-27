function  STFT_funciton(ts,width)
    % STFT_funciton()为STFT_main的组成函数
    % input:
    % ts: 窗函数位置
    % width: 窗函数宽度
    % output:
    % no
    % 本函数无输出值，但是会hold on已画的图，便于窗函数滑动后的继续画图。
    
    addpath('../Basic');
    
    t = 0:0.05:50;
    y = sin(20*t).*(t<25) + sin(t).*(t>25);
    
    left = ts-width/2;
    right = ts+width/2;
    y_window = 1*(t<right & t>left);
    y_fft = y.*y_window;
    
    % use the fft the draw the Single-Sided Amplitude Spectrum
    Fs = 20;            % Sampling frequency                    
    T = 1/Fs;             % Sampling period       
    L = 1002;             % Length of signal
    Y = My_FFT(y_fft);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = Fs*(0:(L/2))/L*2*pi;
    
    ts_list = ones(1,L/2+1)*ts;
    
    plot3(f,ts_list,P1)
    hold on
    
end