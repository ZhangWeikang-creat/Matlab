function time=Contrast_wind(zv,rider,roads,wind)
[zP,zt]=PCurves_wind(zv,roads,wind);
Wmax=sum(roads(:,2))*10*rider(2);
zt=fix(zt);
time=sum(zt);
cr=1;k=80;
Pcurr=zeros(time,1);
for i=1:size(roads,1)
    Pcurr(cr:cr-1+roads(i,2))=zP(i);
    cr=cr+roads(i,2);
end
ct=1;Pcurt=zeros(time,1);
for i=1:size(roads,1)
    Pcurt(ct:ct+zt(i)-1)=zP(i)/k;
    ct=ct+zt(i);
end
Pc=cumsum(Pcurt)./(1:time)';
W=sum(zP.*zt);
if W>Wmax
    time=inf;
else
    tt=(1:time)';
    Pc0=rider(2)+rider(1).*(10./tt).^rider(3);
    be=0;
    for i=1:time
        if Pcurt(i)>rider(1)*k
            time=inf;
            break;
        end
        if Pc(i)>Pc0(i)*1.5*rider(3)
            time=inf;
            break;
        end
        if Pc(i)>Pc0(i)
            be=be+1;
        end
        if be>1000*rider(3)
            time=inf;
            break;
        end
    end
end