clear
ztmin=zeros(11,1);
load("data/Wind.mat")
for i=1:11
    ztmin(i)=sum(Windd{1,i});
end
ztmin=zeros(11,1);
load("data/Ex.mat")
for i=1:11
    ztmin(i)=sum(Exd{1,i});
end