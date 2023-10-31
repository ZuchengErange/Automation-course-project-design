clc,clear all;
global tt k y y1 u da grp itmRead Ts itmWrite i nCounter ti Set_valve e y_max_cal itmRead1 y_tem y_tem1
i=1;
Set_valve=12.591;
da = opcda('localhost', 'NI USB-6008.Server');
Ts=0.01;%采样频率
T=30;     %仿真时间
y_max_cal=7.05;
nCounter=T/Ts;  %采样点数
ti=[];
connect(da);
grp = addgroup(da);
itmWrite = additem(grp,'Dev1/AO1');        %在组中添加数据项
%  write(itmWrite, u);   
itmRead = additem(grp,'Dev1/AI1');%在组中添加数据项
itmRead1 = additem(grp,'Dev1/AI2');%在组中添加数据项
y=[0];
y1=[0];
e=[0];
y_tem=[0];
y_tem1=[0];
ymax=y_max_cal;
ymin=0;
umax=5;
umin=0;
u(1)=0;u(2)=0;u(3)=0;
y(1)=0;y(2)=0;y(3)=0;
y1(1)=0;y1(2)=0;y1(3)=0;
e(1)=0;e(2)=0;e(3)=0;
y_tem(1)=0;y_tem1(1)=0;
t = timer('TimerFcn',@myread1_state_feedback_controll, 'Period', Ts,'ExecutionMode','fixedRate');
start(t);