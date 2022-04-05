clear
%焦点范围
r=300.4;
rmin=r-0.6;
rmax=r+0.6;
pmax1=-rmax*0.534-(rmax*sqrt(3)/2-rmax*0.534)/(-0.5+rmax/2)*-0.5;
pmax2=-rmin*0.534-(rmin*sqrt(3)/2-rmin*0.534)/(-0.5+rmin/2)*-0.5;
pmin1=-rmax*0.534-(rmax*sqrt(3)/2-rmax*0.534)/(0.5+rmax/2)*0.5;
pmin2=-rmin*0.534-(rmin*sqrt(3)/2-rmin*0.534)/(0.5+rmin/2)*0.5;
pmin=pmin1;pmax=pmax2;
%是否宽松条件
%pmin=pmin-1.5;pmax=pmax+1.5;
%最理想抛物面
x1=r/2;z1=-r*sqrt(3)/2;z2=-r*0.534;
b=2*z1-2*z2;
p0=(-b+sqrt(b^2+4*x1^2))/-2;
c0=-p0^2-2*p0*z2;
%四种情况下的理想抛物面
options = optimset('Display','final','PlotFcns',@optimplotfval);
[x1,fval1,exitflag1,output1]=fminsearch(@fun1,[p0 c0],options,pmin,pmax);
p1=x1(1);c1=x1(2);
[x2,fval2,exitflag2,output2]=fminsearch(@fun2,[p0 c0],options,pmin,pmax);
p2=x2(1);c2=x2(2);
[x3,fval3,exitflag3,output3]=fminsearch(@fun3,p0,options,pmin,pmax);
p3=x3;c3=-((r/2)^2-2*p3*r*sqrt(3)/2);
[x4,fval4,exitflag4,output4]=fminsearch(@fun4,p0,options,pmin,pmax);
p4=x4;c4=-((r/2)^2-2*p4*300*sqrt(3)/2);
pp=[p0 p1 p2 p3 p4];
cc=[c0 c1 c2 c3 c4];
zhi=plotfun1(pp,cc);
save('data\非放宽结果','pp','cc','zhi')
%save('data\放宽结果','pp','cc','zhi')
function zhi1=fun1(x,pmin,pmax)
rr=300.4;
p=x(1);c=x(2);
temp=-p/2-c/2/p;
if temp>pmax||temp<pmin
    zhi1=inf;
else
    e=2*pi*3/4+0.0001:0.0001:2*pi*5/6;
    r=(-2.*p.*sin(e)+sqrt((2.*p.*sin(e)).^2-4.*cos(e).^2.*c))./(2.*cos(e).^2);
    ju=r-rr;
    zhi1=sum(abs(ju));
    zhi2=max(abs(ju));
    if zhi2>0.6
        zhi1=inf;
    end
end
end
function zhi2=fun2(x,pmin,pmax)
rr=300.4;
p=x(1);c=x(2);
temp=-p/2-c/2/p;
if temp>pmax||temp<pmin
    zhi2=inf;
else
    e=2*pi*3/4+0.0001:0.0001:2*pi*5/6;
    r=(-2.*p.*sin(e)+sqrt((2.*p.*sin(e)).^2-4.*cos(e).^2.*c))./(2.*cos(e).^2);
    ju=r-rr;
    zhi2=max(abs(ju));
end
end
function zhi1=fun3(x,pmin,pmax)
rr=300.4;
p=x;c=-(rr/2)^2+2*p*rr*sqrt(3)/2;
temp=-p/2-c/2/p;
if temp>pmax||temp<pmin
    zhi1=inf;
else
    e=2*pi*3/4+0.0001:0.0001:2*pi*5/6;
    r=(-2.*p.*sin(e)+sqrt((2.*p.*sin(e)).^2-4.*cos(e).^2.*c))./(2.*cos(e).^2);
    ju=r-rr;
    zhi1=sum(abs(ju));
    zhi2=max(abs(ju));
    if zhi2>0.6
        zhi1=inf;
    end
end
end
function zhi2=fun4(x,pmin,pmax)
rr=300.4;
p=x;c=-(rr/2)^2+2*p*rr*sqrt(3)/2;
temp=-p/2-c/2/p;
if temp>pmax||temp<pmin
    zhi2=inf;
else
    e=2*pi*3/4+0.0001:0.0001:2*pi*5/6;
    r=(-2.*p.*sin(e)+sqrt((2.*p.*sin(e)).^2-4.*cos(e).^2.*c))./(2.*cos(e).^2);
    ju=r-rr;
    zhi2=max(abs(ju));
end
end