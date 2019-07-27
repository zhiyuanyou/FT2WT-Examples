function  STFT_funciton(y,t,Fs,ts,width)
    
    left = ts-width/2;
    right = ts+width/2;
    y_window = 1*(t<right & t>left);
    y_fft = y.*y_window;
    
    % use the fft the draw the Single-Sided Amplitude Spectrum
    L = ceil(length(y)/2)*2;             % Length of signal
    Y = fft(y_fft);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = Fs*(0:(L/2))/L;
    
    ts_list = ones(1,L/2+1)*ts;
    
    if(ts<=0.25)
        plot3(f,ts_list,P1,'r')
        hold on
    elseif(ts<=0.5 && ts>0.25)
        plot3(f,ts_list,P1,'g')
        hold on
    elseif(ts<=0.75 && ts>0.5)
        plot3(f,ts_list,P1,'b')
        hold on
    else
        plot3(f,ts_list,P1,'y')
        hold on
    end
end