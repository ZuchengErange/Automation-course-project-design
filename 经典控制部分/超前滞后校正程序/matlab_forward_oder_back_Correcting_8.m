clc,clear all;
global tt k y u da grp itmRead Ts itmWrite i nCounter ti Set_point e num_dis  den_dis y_max_cal 
i=1;
Set_point=1;
y_max_cal=7.05;
da = opcda('localhost', 'NI USB-6008.Server');
Ts=0.05;%采样频率
T=80;     %仿真时间
nCounter=T/Ts;  %采样点数
ti=[];
connect(da);
grp = addgroup(da);
itmWrite = additem(grp,'Dev1/AO1');        %在组中添加数据项
%  write(itmWrite, u);   
itmRead = additem(grp,'Dev1/AI1');%在组中添加数据项
y=[0];
e=[0];

num13=[2.22 1];    %采用超前校正频率 
den13=[1.065 1];
forward_Correcting=tf(num13,den13);    
discret=c2d(forward_Correcting, Ts, 'z');%转化为差分方程  Ts和系统采样频率相同
[num_dis, den_dis] = tfdata(discret,'v'); % 提取差分方程系数

ymax=y_max_cal;
ymin=0;
umax=5;
umin=0;
% plot(ti,y);
t = timer('TimerFcn',@myread_Correcting, 'Period', Ts,'ExecutionMode','fixedRate');
start(t);
% disconnect(da);
% plot(y);