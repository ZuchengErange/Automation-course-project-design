figure(6);
t0=[1:4000];
y(1)=0;
 plot(ScopeData0(:,1),ScopeData0(:,2),'--',ScopeData1(:,1),ScopeData1(:,2))  %软件第一次分析，焊接电路k=1.3036 T1=23.73，T2=9.493
 legend('实际曲线','仿真曲线')
