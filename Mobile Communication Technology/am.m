% 基本参数设置
clear all; close all;
fm = 5; % 基带信号频率，降低频率以便可视化
fc = 50; % 载波频率，降低频率以便可视化
T = 1; % 信号时长
fs = 200; % 采样频率
dt = 1/fs; % 时间采样间隔
N = T/dt; % 采样点个数
t = [0:N-1]*dt; % 时间序列

% 生成基带信号
Am = 1; % 基带信号幅度
mt = Am * cos(2*pi*fm*t); % 基带信号

% 生成载波信号
Ac = 1; % 载波信号幅度
ct = Ac * cos(2*pi*fc*t); % 载波信号

% 进行AM调制
ma = 0.5; % 调制指数
s_am = (1 + ma * mt) .* ct; % AM调制信号

% 可视化调制信号
figure;
subplot(3,1,1);
plot(t, s_am);
title('AM调制信号');
xlabel('时间 (s)');
ylabel('幅度');

% 可视化基带信号
subplot(3,1,2);
plot(t, mt);
title('基带信号');
xlabel('时间 (s)');
ylabel('幅度');

% 可视化载波信号
subplot(3,1,3);
plot(t, ct);
title('载波信号');
xlabel('时间 (s)');
ylabel('幅度');
