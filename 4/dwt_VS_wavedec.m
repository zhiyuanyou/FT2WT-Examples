% 
clc;
clear;
close all;

% 
load data_train.mat
y = data_fist(:,1);
s = y(1:64);
Len = length(s);

% dwt 和 wavedec 的对比
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 采用dwt逐层分解，必须按照第1, 2, 3, ...层的分解顺序，进行层层递推
[ca1, cd1] = dwt(s, 'db1'); % dwt:1层小波分解，采用db1小波基分解,ca1低频，cd1高频
a1 = upcoef('a', ca1, 'db1', 1, Len); % upcoef: 单一重构,从系数得到近似/低频信号
d1 = upcoef('d', cd1, 'db1', 1, Len); % upcoef: 单一重构,从系数得到细节/高频信号
s1 = a1 + d1; % 重构信号，从第1层重构

[ca2, cd2] = dwt(ca1, 'db1'); % dwt:1层小波分解，采用db1小波基分解,ca2低频，cd2高频
a2 = upcoef('a', ca2, 'db1', 2, Len); % upcoef: 单一重构,从系数得到近似/低频信号
d2 = upcoef('d', cd2, 'db1', 2, Len); % upcoef: 单一重构,从系数得到细节/高频信号
s2 = a2 + d2 + d1; % 重构信号,从第2层重构

% 画图
figure;
subplot(5, 1, 1); plot(s); title('original signal');
subplot(5, 1, 2); plot(ca1); title('low-frequency information');
subplot(5, 1, 3); plot(cd1); title('high-frequency information');
subplot(5, 1, 4); plot(s1, 'r-'); title('re-constructed signal from levle 1');
subplot(5, 1, 5); plot(s2, 'r-'); title('re-constructed signal from levle 2');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 采用wavedec可以达到同样的分解效果，可以直接从原始信号s进行多层分解，不需要层层递推
[C1,L1] = wavedec(s,1,'db1'); %wavedec：多尺度一维离散小波变换函数
CA1 = appcoef(C1,L1,'db1',1); %从上面的C中提取第1层的低频系数，CA1与ca1完全相同
A1 = wrcoef('a',C1,L1,'db1',1); %重构第1层的低频信号，A1与a1完全相同
D1 = wrcoef('d',C1,L1,'db1',1); %重构第1层的高频信号，D1与d1完全相同
S1 = A1 + D1; % 重构信号，从第1层重构

% 【注意】这里是直接从原始信号s进行第2层分解，没有利用第1层的结果，这是wavedec的优势，不需要层层递推
[C2,L2] = wavedec(s,2,'db1'); %wavedec：多尺度一维离散小波变换函数
CA1_too = appcoef(C2,L2,'db1',1); %从上面的C中提取第1层的低频系数，这里的CA1_too与ca1、CA1完全相同
CA2 = appcoef(C2,L2,'db1',2); %从上面的C中提取第2层的低频系数，CA2与ca2完全相同
A2 = wrcoef('a',C2,L2,'db1',2); %重构第2层的低频信号，A2与a2完全相同
D2 = wrcoef('d',C2,L2,'db1',2); %重构第2层的高频信号，D2与d2完全相同
S2 = A2 + D2 + D1; % 重构信号，从第2层重构

% waverec 全重构函数，可直接将wavedec的分解结果重构原信号
S_waverec1 = waverec(C1,L1,'db1'); %比较通过第1层重构信号与原始信号
err1 = max(abs(s-S_waverec1)); %重构最大误差
S_waverec2 = waverec(C2,L2,'db1'); %比较通过第2层重构信号与原始信号
err2 = max(abs(s-S_waverec2)); %重构最大误差

% 画图
figure;
subplot(5, 1, 1); plot(s); title('original signal');
subplot(5, 1, 2); plot(CA1); title('low-frequency information');
subplot(5, 1, 3); plot(CA2); title('high-frequency information');
subplot(5, 1, 4); plot(S_waverec1, 'r-'); title('re-constructed signal from levle 1');
subplot(5, 1, 5); plot(S_waverec2, 'r-'); title('re-constructed signal from levle 2');
