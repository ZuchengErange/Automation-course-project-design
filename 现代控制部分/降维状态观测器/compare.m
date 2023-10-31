% figure(6);
% t0=[1:4000];
% y(1)=0;
%  plot(ti,y,ScopeData(:,1),ScopeData(:,2))  %软件第一次分析，焊接电路k=1.3036 T1=23.73，T2=9.493
%  legend('实际曲线','仿真曲线')
 %存在问题，k值略大k=1.4786
 %总时间常数略大
 %一次K值略小 k1=1.0416 标准k1=1.1
 %一阶时间常数t略大
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
   legend('实际曲线','仿真曲线')
%  figure(2);
%  plot( ti,y,ti,x2);% ti,y1,ti,x1 ti,y,ti,x2ti,y,ti,x2
%  legend('二阶实际曲线','二阶仿真曲线');
%  figure(3);
%   plot(ti,y1,ti,x1);
%   legend('一阶实际曲线','一阶仿真曲线');