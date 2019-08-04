function Y = My_FFT(y)
    % My_FFT: find the FFT of y
    % input: 
    % y: signal y
    % output:
    % Y: FFT of y
    
    % make the length of y is 2^n
    N = length(y);
    if(rem(log2(N),1))
        N_new = 2^ceil(log2(N));
        y(N+1:N_new) = 0;
        N = N_new;
    end
    
    % FFT
    if(N == 1)
        Y = y;
        return
    end
    
    omega = exp(-2*pi*1i/N);
    k = (0:N/2-1)';
    w = omega.^k;
    u = My_FFT(y(1:2:N-1));
    v = w.*My_FFT(y(2:2:N));
    Y = [u+v; u-v];
    
end
