clc,clear all;
global tt k y da grp itmRead Ts itmWrite i nCounter ti  e  x1 x2 num_dis1 den_dis1 num_dis2  den_dis2 x2_1 x1_1
global Set_point K1 K2 itmRead1 y1
i=1;
Set_point=1;
da = opcda('localhost', 'NI USB-6008.Server');
Ts=0.01;%采样频率
T=80;     %仿真时间

A=[-0.0939 0;0.31295 -0.236 ]';B=[0.1032 0]';
C=[0 1]';
P=[-1 -1];     %极点配置
g=acker(A,C,P);
K1=g(1);
K2=g(2);

nCounter=T/Ts;  %采样点数
ti=[];
connect(da);
grp = addgroup(da);
itmWrite = additem(grp,'Dev1/AO1');        %在组中添加数据项

itmRead = additem(grp,'Dev1/AI1');%在组中添加数据项
itmRead1 = additem(grp,'Dev1/AI2');%在组中添加数据项
y=[0];
e=[0];
x1=[0];
x2=[0];
x1_1=[0];
x2_1=[0];
x1(1)=0;x2(1)=0;x1(2)=0;x2(2)=0;
x1_1(1)=0;x2_1(1)=0;x1_1(2)=0;x2_1(2)=0;
y1(1)=0;y1(2)=0;
y1=[0];

num1=[1];    %写入一阶水箱模型
den1=[1 1/10.649];
forward_Correcting1=tf(num1,den1);    
discret1=c2d(forward_Correcting1, Ts, 'z');%转化为差分方程  Ts和系统采样频率相同
[num_dis1, den_dis1] = tfdata(discret1,'v'); % 提取差分方程系数



num2=[1];    %写入一阶水箱模型
den2=[1 1/4.237];
forward_Correcting2=tf(num2,den2);    
discret2=c2d(forward_Correcting2, Ts, 'z');%转化为差分方程  Ts和系统采样频率相同
[num_dis2, den_dis2] = tfdata(discret2,'v'); % 提取差分方程系数
write(itmWrite,Set_point);

t = timer('TimerFcn',@myread1_ob, 'Period', Ts,'ExecutionMode','fixedRate');
start(t);