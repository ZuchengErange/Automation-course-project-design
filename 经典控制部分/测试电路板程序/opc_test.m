 global tt k y u da grp itmRead Ts itmWrite i nCounter itmRead1
Ts=2;%����Ƶ��
T=80;     %����ʱ��
nCounter=T/Ts;  %��������
u=1;
ti=[];
da = opcda('localhost', 'NI USB-6008.Server'); 
connect(da);
grp = addgroup(da);
itmWrite = additem(grp,'Dev1/AO1');        %���������������
write(itmWrite, u);
itmRead = additem(grp,'Dev1/AI1');%���������������
itmRead1 = additem(grp,'Dev1/AI2');
y=[0];
for i=1:nCounter    
pause(Ts);
ti(i)=i*Ts;
r=read(itmRead);       
  y(i)=r.Value;                                        %��ȡ�������ֵ
  r=read(itmRead1);       
  y1(i)=r.Value;    
end
% t = timer('TimerFcn',@myread1, 'Period', Ts,'ExecutionMode','fixedRate');
% start(t);
% disconnect(da);
figure(3);
plot(ti,y,ti,y1);
% figure(4);
% plot(ti,y,ScopeData2(:,1),ScopeData2(:,2))


