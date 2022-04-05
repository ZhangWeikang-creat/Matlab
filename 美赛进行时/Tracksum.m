clear
tmin=zeros(3,5);
fangcha=zeros(3,5);
for i=1:3
    load("data/Track"+string(i)+".mat")
    P=[];
    for j=1:5
        tmin(i,j)=sum(Trackd{1,j});
        fangcha(i,j)=9./std(smoothdata(Trackd{3,j}));
        Pcurr=Trackd{2,j};
        Pcurr=smoothdata(Pcurr);
        Pcurr(find(Pcurr>1500))=1500;
        P=[P Pcurr];
    end
    %Pxfigure(P)
    %parentfig("filename","image/Track"+string(i))
end