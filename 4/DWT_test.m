% 
clc;
clear;
close all;

% 构建信号
Fs = 1000;
t_list = 0:512;
t_list = t_list/Fs;
y1_list = [zeros(1,256),cos(0.2*t_list(257:end))]; % 频率为0.2，周期为5
y2_list = sin(60*t_list); % 频率为60
y3_list = sin(180*t_list); % 频率为180
y4_list = sin(350*t_list); % 频率为350
y_list = y1_list + y2_list + y3_list + y4_list;

% 
s = y_list;
Len = length(s);

% 采用dwt逐层分解

[ca1, cd1] = dwt(s, 'db1'); % dwt:1层小波分解，采用db1小波基分解,ca1低频，cd1高频
a1 = upcoef('a', ca1, 'db1', 1, Len); % upcoef: 单一重构,从系数得到近似/低频信号,0-250HZ
d1 = upcoef('d', cd1, 'db1', 1, Len); % upcoef: 单一重构,从系数得到细节/高频信号,250-500HZ
s1 = a1 + d1; % 重构信号，第1层重构得到的s1和s完全一样,0-500HZ

[ca2, cd2] = dwt(ca1, 'db1'); % dwt:1层小波分解，采用db1小波基分解,ca2低频，cd2高频
a2 = upcoef('a', ca2, 'db1', 2, Len); % upcoef: 单一重构,从系数得到近似/低频信号,0-125HZ
d2 = upcoef('d', cd2, 'db1', 2, Len); % upcoef: 单一重构,从系数得到细节/高频信号,125-250HZ
s2 = a2 + d2; % 重构信号,第2层重构, 0-250HZ

[ca3, cd3] = dwt(ca2, 'db1'); % dwt:1层小波分解，采用db1小波基分解,ca3低频，cd3高频
a3 = upcoef('a', ca3, 'db1', 3, Len); % upcoef: 单一重构,从系数得到近似/低频信号,0-62.5HZ
d3 = upcoef('d', cd3, 'db1', 3, Len); % upcoef: 单一重构,从系数得到细节/高频信号,62.5-125HZ
s3 = a3 + d3; % 重构信号,第3层重构, 0-125HZ

[ca4, cd4] = dwt(ca3, 'db1'); % dwt:1层小波分解，采用db1小波基分解,ca4低频，cd4高频
a4 = upcoef('a', ca4, 'db1', 4, Len); % upcoef: 单一重构,从系数得到近似/低频信号,0-31.25HZ
d4 = upcoef('d', cd4, 'db1', 4, Len); % upcoef: 单一重构,从系数得到细节/高频信号,31.25-62.5HZ
s4 = a4 + d4; % 重构信号,第4层重构, 0-62.5HZ

[ca5, cd5] = dwt(ca4, 'db1'); % dwt:1层小波分解，采用db1小波基分解,ca5低频，cd5高频
a5 = upcoef('a', ca5, 'db1', 5, Len); % upcoef: 单一重构,从系数得到近似/低频信号,0-15.625HZ
d5 = upcoef('d', cd5, 'db1', 5, Len); % upcoef: 单一重构,从系数得到细节/高频信号,15.625-31.25HZ
s5 = a5 + d5; % 重构信号,第5层重构,0-31.25HZ

% 画小波变换系数图
figure
subplot(7,1,1);
plot(y_list);title('Origin')
subplot(7,1,2);
plot(cd1);title('250-500HZ')
subplot(7,1,3);
plot(cd2);title('125-250HZ')
subplot(7,1,4);
plot(cd3);title('62.5-125HZ') 
subplot(7,1,5);
plot(cd4);title('31.25-62.5HZ')
subplot(7,1,6);
plot(cd5);title('15.625-31.25HZ')
subplot(7,1,7);
plot(ca5);title('0-15.625HZ')

% 画小波变换重构图
figure
subplot(7,1,1);
plot(y_list);title('Origin')
subplot(7,1,2);
plot(d1);title('250-500HZ')
subplot(7,1,3);
plot(d2);title('125-250HZ')
subplot(7,1,4);
plot(d3);title('62.5-125HZ') 
subplot(7,1,5);
plot(d4);title('31.25-62.5HZ')
subplot(7,1,6);
plot(d5);title('15.625-31.25HZ')
subplot(7,1,7);
plot(a5);title('0-15.625HZ')
