% figure(6);
% t0=[1:4000];
% y(1)=0;
%  plot(ti,y,ScopeData(:,1),ScopeData(:,2))  %�����һ�η��������ӵ�·k=1.3036 T1=23.73��T2=9.493
%  legend('ʵ������','��������')
 %�������⣬kֵ�Դ�k=1.4786
 %��ʱ�䳣���Դ�
 %һ��Kֵ��С k1=1.0416 ��׼k1=1.1
 %һ��ʱ�䳣��t�Դ�
% %  y=y.*10;
%  plot(ti,y,ti,x2) ;
%          out = timerfind;
%          stop(out);
%          delete(out);
%          disconnect(da); 
% 
% y=y.*0.46;
figure(2);
   plot(ti,y,ScopeData1(:,1),ScopeData1(:,2)) ;
   legend('ʵ������','��������')
%  figure(2);
%  plot( ti,y,ti,x2);% ti,y1,ti,x1 ti,y,ti,x2ti,y,ti,x2
%  legend('����ʵ������','���׷�������');
%  figure(3);
%   plot(ti,y1,ti,x1);
%   legend('һ��ʵ������','һ�׷�������');