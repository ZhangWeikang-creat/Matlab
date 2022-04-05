function [zP,zt]=PCurves_wind(zv,roads,wind)
rsize=size(roads,1);
zP=zeros(1,rsize);
zt=zeros(1,rsize);
M=70;m=10;g=9.81;
R=0.00466;A=0.19;
for i=1:rsize
    v=zv(i);
    length=roads(i,2);
    th=roads(i,3);
    Pg=(M+m)*g*sin(th)*v;
    Pr=(M+m)*g*R*v;
    Pw=A*(v-wind)^2*v;
    zP(i)=(Pg+Pr+Pw);
    zt(i)=length/v;
end