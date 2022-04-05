clear
load("data/Track3.mat")
P1=Trackd{2,1};
P1(P1>1500)=1500;
P2=Trackd{2,5};
P2(P2>1500)=1500;
xlim([0 34000])
yyaxis left
plot(P1)
hold on
plot(P2)
yyaxis right
temp1=[1 4 1 2 1 4 1 3 1 4 1];
temp=[temp1 temp1];
l=[0];h=[100];
L=0;H=100;
for i=1:size(temp,2)
    if temp(i)==1
        L=L+2000;
        l=[l;L];
        h=[h;H];
    end
    if temp(i)==2
        L=L+1000;
        H=H+1000*sin(4.5/180*pi);
        l=[l;L];
        h=[h;H];
    end
    if temp(i)==3
        L=L+1000;
        H=H-1000*sin(4.5/180*pi);
        l=[l;L];
        h=[h;H];
    end
    if temp(i)==4
        L=L+1000;
        l=[l;L];
        h=[h;H];
    end
end
ylim([0 250])
fill([0;l;l(end)],[0;h;0],"r")
l=[0];h=[100];
L=0;H=100;
for i=1:size(temp,2)
    if temp(i)==1
        L=L+2000;
        l=[l;L];
        h=[h;H];
    end
    if temp(i)==2
        L=L+1000;
        H=H+1000*sin(4.5/180*pi);
        l=[l;L];
        h=[h;H];
    end
    if temp(i)==3
        L=L+1000;
        H=H-1000*sin(4.5/180*pi);
        l=[l;L];
        h=[h;H];
    end
    if temp(i)==4
        L=L+1000;
        l=[l;L];
        h=[h;H];
        plot(l((end-1):end),h((end-1):end),"-*k","LineWidth",3)
    end
end