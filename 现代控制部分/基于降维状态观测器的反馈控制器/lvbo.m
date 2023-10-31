%½µÎ¬×´Ì¬¹Û²âÆ÷

alpha=0.95;
[m,n]=size(y);
y_sol=[1:n];
y_sol=y;
for i=1:n
    if i<=n-1
    y_sol(i+1)=alpha.*y_sol(i)+(1-alpha).*y(i+1);
    end
end
figure(10)
plot(ti,y_sol);
legend('²âÁ¿ÖµÂË²¨ºó')
