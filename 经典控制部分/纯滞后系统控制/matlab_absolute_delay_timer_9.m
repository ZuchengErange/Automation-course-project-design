clc,clear all;
global  y  da grp itmRead Ts itmWrite i nCounter ti Set_point e  delay_Counter
i=1;
Set_point=1;
delay=1;
da = opcda('localhost', 'NI USB-6008.Server');
Ts=0.05;%����Ƶ��
T=80;     %����ʱ��

nCounter=T/Ts;  %��������
delay_Counter=delay/Ts;  %�ӳٵ���
ti=[];
connect(da);
grp = addgroup(da);
itmWrite = additem(grp,'Dev1/AO1');        %���������������
%  write(itmWrite, u);   
itmRead = additem(grp,'Dev1/AI1');%���������������
y=[0];
e=[0];

t = timer('TimerFcn',@myread1_delay, 'Period', Ts,'ExecutionMode','fixedRate');
start(t);