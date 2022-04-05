function time=Contrast_team(x,rider,roads)
rsize=size(roads,1);
zv=x(1:rsize);
bian=x((rsize+1):(2*rsize));
[~,xu]=sort(x((2*rsize+1):end));
[zzP,zt]=PCurves_team(zv,roads,xu,bian);
for j=1:6
    zP=zzP(j,:);
    Wmax=sum(roads(:,2))*30*rider(j,3);
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
        Pc0=rider(j,2)+rider(j,1).*(10./tt).^rider(j,3);
        be=0;
        for i=1:time
            if Pcurt(i)>rider(1)*k
                time=inf;
                break;
            end
            if Pc(i)>Pc0(i)*1.2*rider(j,3)
                time=inf;
                break;
            end
            if Pc(i)>Pc0(i)
                be=be+1;
            end
            if be>500*rider(j,3)
                time=inf;
                break;
            end
        end
    end
    if time==inf
        break
    end
end