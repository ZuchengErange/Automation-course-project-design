alpha=0.95;
[m,n]=size(y);
y_sol=[1:n];
y_sol=y;
% y1_sol=[1:n];
% y1_sol=y1;
for i=1:n
    if i<=n-1
    y_sol(i+1)=alpha.*y_sol(i)+(1-alpha).*y(i+1);
%     y1_sol(i+1)=alpha.*y1_sol(i)+(1-alpha).*y1(i+1);
    end
end
figure(10)
plot(ti,y_sol);
legend('测量值y滤波后')
% figure(11)
% plot(ti,y1_sol,'--');
% legend('测量值y1滤波后')

