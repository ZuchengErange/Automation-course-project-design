figure(7);
% y(1)=0;
 plot(ti,y,ScopeData1(:,1),ScopeData1(:,2))  %软件第一次分析，焊接电路k=1.3036 T1=23.73，T2=9.493
 legend('实验曲线','机理建模曲线')
 figure(8);
% y1(1)=0;
 plot(ti,y1,ScopeData(:,1),ScopeData(:,2))  %软件第一次分析，焊接电路k=1.3036 T1=23.73，T2=9.493
 legend('实验曲线','机理建模曲线')
 %存在问题，k值略大k=1.4786
 %总时间常数略大
 %一次K值略小 k1=1.0416 标准k1=1.1
 %一阶时间常数t略大
 test=[0];
for i=1:40
    test(i)=1;
end