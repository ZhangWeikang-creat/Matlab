clear
load("data/pt.mat")
rider=[xx;sum(xx)];
roadm=[1 2000 0
    2 1000 4.5/180*pi
    3 1000 -4.5/180*pi
    4 1000 0];
roads=[];
temp1=[1 1 4 1 1 2 1 1 4 1 1 3 1 1 4 1 1];
rsize=size(temp1,2);
ub=ones(1,rsize)*30;lb=ones(1,rsize);
vmin=((80*9.81*sin(4.5/180*pi)/0.19)/0.452)^(1/2);
for i=1:rsize
    roads=[roads;roadm(temp1(i),:)];
    if temp1(i)==4
        ub(i)=8;
    end
    if temp1(i)==3
        lb(i)=vmin;
    end
end
ub=[ub ones(1,rsize) ones(1,6)];
lb=[lb zeros(1,rsize) zeros(1,6)];
intcon=(rsize+1):2*rsize;
options = optimoptions('ga','PlotFcn', @gaplotbestf);
[x,tmin]=ga(@(x)Contrast_team(x,rider,roads),rsize*2+6,[],[],[],[],lb,ub,[],intcon,options);
zv=x(1:rsize);
bian=x((rsize+1):(2*rsize));
[~,xu]=sort(x((2*rsize+1):end));
[zzP,zt]=PCurves_team(zv,roads,xu,bian);
Teamd=cell(6,6);zt=fix(zt);time=sum(zt);
for j=1:6
    T=cell(6,1);
    zP=zzP(j,:);
    cr=1;k=80;
    Pcurr=zeros(time,1);
    for i=1:size(roads,1)
        Pcurr(cr:cr-1+roads(i,2))=zP(i);
        cr=cr+roads(i,2);
    end
    ct=1;Pcurt=zeros(time,1);
    vcurt=zeros(time,1);
    for i=1:size(roads,1)
        Pcurt(ct:ct+zt(i)-1)=zP(i)/k;
        vcurt(ct:ct+zt(i)-1)=zv(i);
        ct=ct+zt(i);
    end
    Pc=cumsum(Pcurt)./(1:time)';
    tt=(1:time)';
    Pc0=rider(j,2)+rider(j,1).*(10./tt).^rider(j,3);
    T{1}=zt;T{2}=Pcurr;
    T{3}=vcurt;T{4}=Pc;
    T{5}=Pc0;T{6}=Pcurt;
    for i=1:6
        Teamd{i,j}=T{i};
    end
end
save("Team.mat","Teamd")