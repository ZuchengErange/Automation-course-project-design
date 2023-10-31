clc,clear all;
global tt k y da grp itmRead Ts itmWrite i nCounter ti  e  x1 x2 num_dis1 den_dis1 num_dis2  den_dis2 x2_1 x1_1
global Set_point K1 K2 itmRead1 y1
i=1;
Set_point=1;
da = opcda('localhost', 'NI USB-6008.Server');
Ts=0.01;%����Ƶ��
T=80;     %����ʱ��

A=[-0.0939 0;0.31295 -0.236 ]';B=[0.1032 0]';
C=[0 1]';
P=[-1 -1];     %��������
g=acker(A,C,P);
K1=g(1);
K2=g(2);

nCounter=T/Ts;  %��������
ti=[];
connect(da);
grp = addgroup(da);
itmWrite = additem(grp,'Dev1/AO1');        %���������������

itmRead = additem(grp,'Dev1/AI1');%���������������
itmRead1 = additem(grp,'Dev1/AI2');%���������������
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

num1=[1];    %д��һ��ˮ��ģ��
den1=[1 1/10.649];
forward_Correcting1=tf(num1,den1);    
discret1=c2d(forward_Correcting1, Ts, 'z');%ת��Ϊ��ַ���  Ts��ϵͳ����Ƶ����ͬ
[num_dis1, den_dis1] = tfdata(discret1,'v'); % ��ȡ��ַ���ϵ��



num2=[1];    %д��һ��ˮ��ģ��
den2=[1 1/4.237];
forward_Correcting2=tf(num2,den2);    
discret2=c2d(forward_Correcting2, Ts, 'z');%ת��Ϊ��ַ���  Ts��ϵͳ����Ƶ����ͬ
[num_dis2, den_dis2] = tfdata(discret2,'v'); % ��ȡ��ַ���ϵ��
write(itmWrite,Set_point);

t = timer('TimerFcn',@myread1_ob, 'Period', Ts,'ExecutionMode','fixedRate');
start(t);