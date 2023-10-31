function myread1_ob(obj,event) 
global y i da grp itmRead Ts x1 x2 nCounter ti  e u  num_dis1 den_dis1 num_dis2  den_dis2 x2_1 x1_1
global Set_point K1 K2 itmRead1 y1
ti(i)=(i-3)*Ts;   %尝试改一下这里，提高PID效率
r=read(itmRead);      
 y(i)=r.Value;  %读取数据项的值
 r=read(itmRead1);      
 y1(i)=r.Value;

 
%  K1=2.6234;K2=1.6701;  %这里考虑再设计
 if i>=2
x1_1(i)=Set_point*1.1/10.649+(y(i)-x2(i-1))*K1; 
x1(i)=(num_dis1(1)*x1_1(i)+num_dis1(2)*x1_1(i-1)-den_dis1(2)*x1(i-1))/den_dis1(1);

x2_1(i)=x1(i)*1.326/4.237+(y(i)-x2(i-1))*K2;
x2(i)=(num_dis2(1)*x2_1(i)+num_dis2(2)*x2_1(i-1)-den_dis2(2)*x2(i-1))/den_dis2(1);
 end

    if i>nCounter
         out = timerfind;
         stop(out);
         delete(out);
         disconnect(da); 
         y1=y1.*-1;
 plot(ti,y,ti,x2,ti,y1,ti,x1) 

    end
    i=i+1; 
end