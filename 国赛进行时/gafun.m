function [bestpop,Y]=gafun(pao1,pao2,zhu,zhuf,wei,fangzhi)
%遗传算法求解（运行前将文件夹gabox添加到预设路径）
NIND=50;MAXGEN=5000;
NVAR=692;PRECI=10;
GGAP=0.9;lb=ones(1,692)*-0.6;up=ones(1,692)*0.6;
FieldID=[ones(1,NVAR)*PRECI;lb;up;ones(1,NVAR);zeros(1,NVAR);ones(1,NVAR);ones(1,NVAR)];
Chrom=crtbp(NIND,NVAR*PRECI);
gen=0;
trace=zeros(MAXGEN,2);
ObjV=zeros(NIND,1);
x=bs2rv(Chrom,FieldID);
for i=1:NIND
    ObjV(i)=fun2(x(i,:),pao1,pao2,zhu,zhuf,wei,fangzhi);
    %ObjV(i)=fun3(x(i,:),zhu,zhuf);
end
while gen<MAXGEN
    FitnV=ranking(ObjV);
    SelCh=select('sus',Chrom,FitnV,GGAP);
    SelCh=recombin('xovsp',SelCh,0.7);
    SelCh=mut(SelCh);
    x=bs2rv(SelCh,FieldID);
    ObjVSel=zeros(NIND*GGAP,1);
    for i=1:NIND*GGAP
        ObjVSel(i)=fun2(x(i,:),pao1,pao2,zhu,zhuf,wei,fangzhi);
        %ObjVSel(i)=fun3(x(i,:),zhu,zhuf);
    end
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
    gen=gen+1;
    [Y,I]=min(ObjV);
    disp(Y)
    bestpop=bs2rv(Chrom(I,:),FieldID);
    trace(gen,1)=Y;
    trace(gen,2)=mean(ObjV);
end
figure
hold on
plot(trace(:,1))
plot(trace(:,2))
grid