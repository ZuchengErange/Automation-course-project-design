num1=[1.4095];   
den1=[10.649 1]; 
G1=tf(num1,den1);
num2=[1];
den2=[4.2372  1];
G2=tf(num2,den2,'inputdelay',3);
G=series(G1,G2);  