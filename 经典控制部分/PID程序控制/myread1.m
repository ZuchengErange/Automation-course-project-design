function myread1(obj,event) 
global y i da grp itmRead Ts itmWrite nCounter ti Set_point e u 
r=read(itmRead);      
 y(i)=r.Value;  %��ȡ�������ֵ
%  y(i)=y(i)/(ymax-ymin)*100;
ti(i)=(i-3)*Ts;   %���Ը�һ��������PIDЧ��
u(1)=0;u(2)=0;u(3)=0;
y(1)=0;y(2)=0;y(3)=0;
e(1)=0;e(2)=0;e(3)=0;
Kp=4;Ti=180000000;Td=0;%PID��ֵ  Kp=29.19625;Ti=1.845;Td=0.615;
e(i)=Set_point-y(i);
if i>=3
deltaU=Kp*(e(i)-e(i-1))+Kp*Ts/Ti*e(i)+Kp*Td/Ts*[e(i)-2*e(i-1)+e(i-2)];
u(i)=u(i-1)+deltaU;
end
write(itmWrite, u(i));
    if i>nCounter
         out = timerfind;
         stop(out);
         delete(out);
         disconnect(da); 
 plot(ti,y) 
 legend('ʵ������')
    end
    i=i+1; 
end