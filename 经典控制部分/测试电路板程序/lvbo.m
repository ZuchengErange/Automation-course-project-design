alpha=0.3;
[m,n]=size(y);
figure(1)
y_1=[1:n];
y_1=y;
t=[1:n];
for i=1:n
    if i<=n-1
    y(i+1)=alpha.*y(i)+(1-alpha).*y(i+1);
    end
end
plot(t,y_1,t,y);