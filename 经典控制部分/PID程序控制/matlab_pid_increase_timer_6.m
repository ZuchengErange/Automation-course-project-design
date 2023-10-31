clc,clear all;
global tt k y u da grp itmRead Ts itmWrite i nCounter ti Set_point e 
i=1;
Set_point=1;
da = opcda('localhost', 'NI USB-6008.Server');
Ts=0.1;%采样频率
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
t = timer('TimerFcn',@myread1, 'Period', Ts,'ExecutionMode','fixedRate');
start(t);