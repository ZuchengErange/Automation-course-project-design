function myread1_ob_controller(obj,event) 
global y i da grp itmRead Ts x1 x2 nCounter ti  u  num_dis1 den_dis1 num_dis2  den_dis2 x2_1 x1_1
global Set_point K1 K2 y_tem1 y_tem itmWrite
ti(i)=(i-3)*Ts;   %尝试改一下这里，提高PID效率
r=read(itmRead);      
 y(i)=r.Value;  %读取数据项的值


%  K1=2.6234;K2=1.6701;  %这里考虑再设计
 if i>=2
x1_1(i)=u(i-1)*1.1/10.649+(y(i)-x2(i-1))*K1; 
x1(i)=(num_dis1(1)*x1_1(i)+num_dis1(2)*x1_1(i-1)-den_dis1(2)*x1(i-1))/den_dis1(1);

x2_1(i)=x1(i)*1.326/4.237+(y(i)-x2(i-1))*K2;
x2(i)=(num_dis2(1)*x2_1(i)+num_dis2(2)*x2_1(i-1)-den_dis2(2)*x2(i-1))/den_dis2(1);
 end
  y_tem(i)=x2(i)*7.886;
 y_tem1(i)=x1(i)*5.3304;
 
u(i)=Set_point-y_tem(i)-y_tem1(i);
 write(itmWrite, u(i));
    if i>nCounter
         out = timerfind;
         stop(out);
         delete(out);
         disconnect(da); 
 plot(ti,y) 
 legend('y')
    end
    i=i+1; 
end