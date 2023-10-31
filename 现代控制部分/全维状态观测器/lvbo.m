alpha=0.95;
[m,n]=size(y);
y_sol=[1:n];
y_sol=y;
[m,n]=size(y1);
t=[1:n];
for i=1:n
    if i<=n-1
    y_sol(i+1)=alpha.*y_sol(i)+(1-alpha).*y(i+1);
    end
end
figure(10)
plot(ti,x1,ti,y_sol,'--');
legend('观测器计算值','y滤波后')