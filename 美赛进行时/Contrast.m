function time=Contrast(zv,rider,roads)
[zP,zt]=PCurves(zv,roads);
Wmax=sum(roads(:,2))*30*rider(3)*rider(4);
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
        if Pc(i)>Pc0(i)*1.2*rider(3)
            time=inf;
            break;
        end
        if Pc(i)>Pc0(i)
            be=be+1;
        end
        if be>500*rider(3)
            time=inf;
            break;
        end
    end
end