function myread_Correcting(obj,event) 
global y i da grp itmRead Ts itmWrite nCounter ti Set_point e u  num_dis  den_dis y_max_cal
r=read(itmRead);      
 y(i)=r.Value;  %读取数据项的值
% ymax=y_max_cal;
% ymin=0;
% umax=5;
% umin=0;
% y(i)=y(i)/(ymax-ymin)*100;
% Set_point=(Set_point/100)*(ymax-ymin);
ti(i)=(i-2)*Ts;
 u(1)=0;u(2)=0;u(3)=0;
 y(1)=0;y(2)=0;y(3)=0;
 e(1)=0;e(2)=0;e(3)=0;
e(i)=Set_point-y(i);
e(i)=e(i)*10;
if i>=2
u(i)=(num_dis(1)*e(i)+num_dis(2)*e(i-1)-den_dis(2)*u(i-1))/den_dis(1);  %超前滞后校正转换为离散数组
end
write(itmWrite, u(i));
    if i>nCounter
         out = timerfind;
         stop(out);
         delete(out);
         disconnect(da); 
 plot(ti,y) 
 legend('实际曲线')
    end
    i=i+1;
   
end