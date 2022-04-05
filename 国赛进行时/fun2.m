function zhi=fun2(x,pao1,pao2,zhu,zhuf,wei,fangzhi)
%求新主节索点位置
zhu=-zhuf.*(x')+zhu;
zhi1=sum(sqrt(sum((zhu-pao1).^2,2)));
pian=zeros(1295,9);
for i=1:1295
    pian(i,:)=[zhu(wei(i,1),:) zhu(wei(i,2),:) zhu(wei(i,3),:)];
end
x1=pian(:,1);y1=pian(:,2);z1=pian(:,3);
x2=pian(:,4);y2=pian(:,5);z2=pian(:,6);
x3=pian(:,7);y3=pian(:,8);z3=pian(:,9);
a=(y2-y1).*(z3-z1)-(y3-y1).*(z2-z1);
b=(z2-z1).*(x3-x1)-(z3-z1).*(x2-x1);
c=(x2-x1).*(y3-y1)-(x3-x1).*(y2-y1);
d=-a.*x1-b.*y1-c.*z1;
aa=fangzhi(:,1);bb=fangzhi(:,2);cc=fangzhi(:,3);
xzhi=-d./(a+b.*bb./aa+c.*cc./aa);
yzhi=bb.*xzhi./aa;
zzhi=cc.*xzhi./aa;
zhixian=[xzhi yzhi zzhi];
zhixian(isnan(zhixian))=0;
zhi2=sum(sqrt(sum((zhixian-pao2).^2,2)));
zhi=zhi1+zhi2;
end