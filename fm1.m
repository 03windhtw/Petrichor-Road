% 基本参数设置
clear all; close all;
fm = 5; % 基带信号频率
fc = 50; % 载波频率
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
Delta_f = 5; % 频率偏差

% 进行FM调制
s_fm = Ac * cos(2*pi*fc*t + (2*pi*Delta_f/fm) * sin(2*pi*fm*t)); % FM调制信号

% 可视化调制信号
figure;
subplot(2,1,1);
plot(t, s_fm);
title('FM调制信号');
xlabel('时间 (s)');
ylabel('幅度');

% 可视化基带信号
subplot(2,1,2);
plot(t, mt);
title('基带信号');
xlabel('时间 (s)');
ylabel('幅度');