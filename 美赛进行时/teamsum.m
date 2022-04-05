clear
load("Team.mat")
load("Team_com.mat")
v1=Teamd{3,4};
v2=Trackd{3,4};
yyaxis left
plot(v1)
hold on
plot(v2)
yyaxis right
temp=[1 1 4 1 1 2 1 1 4 1 1 3 1 1 4 1 1];
l=[0];h=[300];
L=0;H=300;
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
        plot(l((end-1):end),h((end-1):end),"LineWidth",4)
    end
end
fill([0;l;l(end)],[0;h;0],"r")
l=[0];h=[300];
L=0;H=300;
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
        plot(l((end-1):end),h((end-1):end),"-ok","LineWidth",4)
    end
end