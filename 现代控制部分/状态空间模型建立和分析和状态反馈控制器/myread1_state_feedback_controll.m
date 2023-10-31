function myread1_state_feedback_controll(obj,event) 
global y y1 i da grp itmRead Ts itmWrite nCounter ti Set_valve  u itmRead1 y_tem1 y_tem
r=read(itmRead);      
 y(i)=r.Value;  %读取数据项的值
 r=read(itmRead1);      
 y1(i)=r.Value;
  y_tem(i)=y(i)*7.886;
 y_tem1(i)=y1(i)*5.3304;


u(i)=Set_valve-y_tem(i)+y_tem1(i);
% u(i)=u(i)*(umax-umin)/100;

%  y(i)=y(i)/(ymax-ymin)*100;
%  y1(i)=y1(i)/(ymax-ymin)*100;


write(itmWrite, u(i));

ti(i)=i*Ts;
% 
% Set_valve=Set_valve/(umax-umin)*100*12.591;
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