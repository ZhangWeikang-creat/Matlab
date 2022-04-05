function [zP,zt]=PCurves_team(zv,roads,xu,bian)
rsize=size(roads,1);
zP=zeros(6,rsize);
zt=zeros(1,rsize);
M=70;m=10;g=9.81;
R=0.00466;A=0.19;
d1=[0.984 0.633 0.519 0.468 0.452 0.457];
d2=[0.99 0.652 0.544 0.499 0.484 0.485];
for i=1:rsize
    for j=1:6
        v=zv(i);
        lei=roads(i,1);
        length=roads(i,2);
        th=roads(i,3);
        Pg=(M+m)*g*sin(th)*v;
        Pr=(M+m)*g*R*v;
        if lei==1
            Pw=A*v^3*d1(xu(j));
            zP(j,i)=(Pg+Pr+Pw);
        end
        if lei==2||lei==3
            Pw=A*v^3*d2(xu(j));
            zP(j,i)=(Pg+Pr+Pw);
        end
        if bian(i)==1
            xu=xu-1;
            xu(xu==0)=6;
        end
        zt(i)=length/v;
    end
end