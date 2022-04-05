clear
load("data/pt.mat")
roadm=[1 2000 0
    2 1000 2.5/180*pi
    3 1000 -2.5/180*pi
    4 1000 0];
roads=[];
temp1=[1 1 2 1 1 3 1 1];
temp1=[temp1 temp1];
rsize=size(temp1,2);
ub=ones(1,rsize)*25;lb=ones(1,rsize);
vmin=sqrt(80*9.81*sin(2.5/180*pi)/0.19);
for i=1:rsize
    roads=[roads;roadm(temp1(i),:)];
    if temp1(i)==4
        ub(i)=10;
    end
    if temp1(i)==3
        lb(i)=vmin;
    end
end
j=4;rider=xx(j,:);
Windd=cell(6,11);
parfor wind=-5:5
    T=cell(6,1);
    [zv,tmin]=ga(@(zv)Contrast_wind(zv,rider,roads,wind),rsize,[],[],[],[],lb,ub);
    [zP,zt]=PCurves_wind(zv,roads,wind);
    zt=fix(zt);
    time=sum(zt);
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
    W=sum(zP.*zt);
    tt=(1:time)';
    Pc0=rider(2)+rider(1).*(10./tt).^rider(3);
    T{1}=zt;T{2}=Pcurr;
    T{3}=vcurt;T{4}=Pc;
    T{5}=Pc0;T{6}=Pcurt;
    for i=1:6
        Windd{i,wind+6}=T{i};
    end
    [wind+6 tmin]
end
save("Wind.mat","Windd")