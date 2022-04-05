clear
temp1=[3 4 2 2 4 3 3 1 1 3 4 2 2 2 3 3 4 1 1];
temp1=[temp1 temp1];
temp2=[1 1 3 4 1 1 1 4 2 1 1 3 4 1 1 1 1 1 4 1 1 1 1 1 2 2];
temp3=[1 4 1 2 1 4 1 3 1 4 1];
temp3=[temp3 temp3];
temp=[1 1 4 1 1 2 1 1 4 1 1 3 1 1 4 1 1];;
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
    end
end
%plot(l,h)
fill([0;l;l(end)],[0;h;0],"r")