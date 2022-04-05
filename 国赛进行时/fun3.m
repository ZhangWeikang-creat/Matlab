function zhi=fun3(x,zhu,zhuf)
%求新主节索点位置
yzhu=zhu;
zhu=-zhuf.*(x')+zhu;
%判断主节索点变化前后的距离是否符合要求
pan=0;
for i=1:691
    for j=i:692
        ju1=sqrt(sum((zhu(i,:)-zhu(j,:)).^2));
        ju2=sqrt(sum((yzhu(i,:)-yzhu(j,:)).^2));
        if abs(ju1-10.39)<1&&abs((ju1-ju2))/ju2>0.0007
            pan=pan+1;
        end
    end
end
zhi=pan;
end