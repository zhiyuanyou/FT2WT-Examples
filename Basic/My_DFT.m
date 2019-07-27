function Y = My_DFT(y)
    % DFT: Find the DFT of the discrete number list y
    % input: 
    % y: the discrete number list y
    % output
    % Y: the DFT of discrete number list y
    
    % 矩阵法
    N = length(y); 
    omega = exp(-1j*2*pi/N); 
    row = 0:N-1; 
    col = row'; 
    F = omega.^(col*row);
    Y = F*y';
    % 转置会引起共轭，故使用reshape
    Y = reshape(Y,1,N);
    
    % 定义法
%     N = length(y);
%     num_list = 0:N-1;
%     Y = zeros(1,N);
%     
%     sum(omega.^(0:7).*y)
%     
%     for index = 1:1
%         calculate the coefficient
%         Y(index+1) = sum(y.*exp(-1j*2*pi*index/N*num_list))
%     end
    
end
