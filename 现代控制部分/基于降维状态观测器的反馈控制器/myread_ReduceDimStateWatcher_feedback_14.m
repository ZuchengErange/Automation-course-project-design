function myread_ReduceDimStateWatcher_feedback_14(obj,event) 
global y y1 i da grp itmRead Ts itmWrite nCounter ti Set_valve e itmRead1 y_tem1 y_tem  x1 w u
r=read(itmRead);      
 y(i)=r.Value;  %读取数据项的值
 r=read(itmRead1);      
 y1(i)=r.Value;

%  P1=-2;
%  G=(place(-1/10.649,1.326/4.237,P1))'; %降维观测器的反馈矩阵
 G=2.8953;%反馈矩阵
 if i>=2
 w(i)=((((-0.0939-G*0.3130)*G+0.2360*G)*y(i)+0.1033*u(i-1))*Ts+ w(i-1))/(1-Ts*(-0.0939-G*0.3130));
 x1(i)= w(i)+G*y(i);   %把上面的Set_valve改为u
 end
  y_tem(i)=y(i)*7.886;
 y_tem1(i)=x1(i)*5.3304;
u(i)=Set_valve-y_tem(i)-y_tem1(i);

write(itmWrite, u(i));

ti(i)=i*Ts;
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