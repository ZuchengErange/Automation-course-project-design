function myread1_delay(obj,event) 
global y i da  itmRead Ts itmWrite nCounter ti Set_point e u  delay_Counter 
r=read(itmRead);      
 y(i)=r.Value;  %读取数据项的值

%  y(i)=y(i)/(ymax-ymin)*100;
ti(i)=i*Ts;
u(1)=0;u(2)=0;u(3)=0;
y(1)=0;y(2)=0;y(3)=0;
e(1)=0;e(2)=0;e(3)=0;
Kp=5;Ti=10;Td=1.5;%PID初值  Kp=29.19625;Ti=1.845;Td=0.615;
e(i)=Set_point-y(i);
if i>=3
deltaU=Kp*(e(i)-e(i-1))+Kp*Ts/Ti*e(i)+Kp*Td/Ts*[e(i)-2*e(i-1)+e(i-2)];
% deltaU=deltaU*(umax-umin)/100;
u(i)=u(i-1)+deltaU;
end
if i>delay_Counter
write(itmWrite, u(i-delay_Counter));
end
    if i>(nCounter+delay_Counter)
         out = timerfind;
         stop(out);
         delete(out);
         disconnect(da); 
 plot(ti,y) 
 legend('实际曲线')
    end
    i=i+1; 
end