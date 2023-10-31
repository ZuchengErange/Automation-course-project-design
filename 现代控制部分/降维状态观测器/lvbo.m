alpha=0.95;
[m,n]=size(y1);
y1_sol=[1:n];
y1_sol=y1;
t=[1:n];
[m,n]=size(x1);
x1_sol=[1:n];
x1_sol=x1;
for i=1:n
    if i<=n-1
    y1_sol(i+1)=alpha.*y1_sol(i)+(1-alpha).*y1(i+1);
    x1_sol(i+1)=alpha.*x1_sol(i)+(1-alpha).*x1(i+1);
    end
end
figure(10)
plot(ti,x1_sol,ti,y1_sol,'--');
legend('观测器计算值','测量值滤波后')
