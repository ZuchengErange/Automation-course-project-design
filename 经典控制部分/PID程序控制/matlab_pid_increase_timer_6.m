clc,clear all;
global tt k y u da grp itmRead Ts itmWrite i nCounter ti Set_point e 
i=1;
Set_point=1;
da = opcda('localhost', 'NI USB-6008.Server');
Ts=0.1;%����Ƶ��
T=80;     %����ʱ��
nCounter=T/Ts;  %��������
ti=[];
connect(da);
grp = addgroup(da);
itmWrite = additem(grp,'Dev1/AO1');        %���������������
%  write(itmWrite, u);   
itmRead = additem(grp,'Dev1/AI1');%���������������
y=[0];
e=[0];
t = timer('TimerFcn',@myread1, 'Period', Ts,'ExecutionMode','fixedRate');
start(t);