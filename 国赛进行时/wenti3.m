clear
%处理数据
for nn=1:10
    rr=300.4;jing=100;
    load('data\第二问结果2')
    data1=readcell('data\附件1');
    data2=readmatrix('data\附件2');
    fang=data2(:,2:4)-data2(:,5:7);
    fang=fang./sqrt(fang(:,1).^2+fang(:,2).^2+fang(:,3).^2);
    data3=readcell('data\附件3');
    a=36.795/180*pi;b=78.169/180*pi;
    xd=-rr*cos(b)*cos(a);
    yd=-rr*cos(b)*sin(a);
    zd=-rr*sin(b);
    zb=zeros(2226,3);
    %找出需要调节的主节索点
    for i=2:2227
        for j=2:4
            zb(i-1,j-1)=data1{i,j};
        end
    end
    ju=sqrt((zb(:,1)-xd).^2+(zb(:,2)-yd).^2+(zb(:,3)-zd).^2);
    [~,ding]=min(ju);
    zhud=zb(ding,:);
    k=0;
    for i=1:2226
        if sqrt(sum((zhud-zb(i,:)).^2))<155.2914
            k=k+1;
            ge(k)=i;
        end
    end
    zhu=zb(ge,:);
    zhuf=fang(ge,:);
    %找出需要调节的主节索点的反射面
    pian=[];fangzhi=[];
    for i=2:4301
        pan1=0;pan2=0;pan3=0;
        for j=1:size(ge,2)
            if isequal(data1{ge(j)+1,1},data3{i,1})
                pan1=j;
            end
            if isequal(data1{ge(j)+1,1},data3{i,2})
                pan2=j;
            end
            if isequal(data1{ge(j)+1,1},data3{i,3})
                pan3=j;
            end
        end
        if pan1~=0&&pan2~=0&&pan3~=0
            pian=[pian;[zhu(pan1,:) zhu(pan2,:) zhu(pan3,:)]];
            fangzhi=[fangzhi;(zhuf(pan1,:)+zhuf(pan2,:)+zhuf(pan3,:))/3];
        end
    end
    %计算三角反射面中心与方向直线的交点
    pp=(fangzhi(:,1).*xd+fangzhi(:,2).*yd+fangzhi(:,3).*zd)./...
        sqrt(fangzhi(:,1).^2+fangzhi(:,2).^2+fangzhi(:,3).^2)/sqrt(xd^2+yd^2+zd^2);
    Ni=fangzhi;
    a=36.795/180*pi;b=78.169/180*pi;
    L=[cos(b)*cos(a) cos(b)*sin(a) sin(b)];
    a1=L(1);b1=L(2);c1=L(3);
    xa=L(1);ya=L(2);za=L(3);
    xb=Ni(:,1);yb=Ni(:,2);zb=Ni(:,3);
    temp=xa*xb+ya*yb+za*zb;
    LL=L-2*temp.*Ni;
    LL=LL./sqrt(LL(:,1).^2+LL(:,2).^2+LL(:,3).^2);
    xx=-rr*0.534*cos(b)*cos(a);
    yy=-rr*0.534*cos(b)*sin(a);
    zz=-rr*0.534*sin(b);
    xinhao1=zeros(1295,1);
    for i=1:1295
        gg=0;
        a2=LL(i,1);
        b2=LL(i,2);
        c2=LL(i,3);
        d=-a1*xx-b1*yy-c1*zz;
        for j=1:jing
            fen1=rand(1);fen2=rand(1);fen3=rand(1);
            fen1=fen1/sum(fen1+fen2+fen3);
            fen2=fen2/sum(fen1+fen2+fen3);
            fen3=fen2/sum(fen1+fen2+fen3);
            temp1=pian(i,4:6)-pian(i,1:3);
            temp2=pian(i,7:9)-pian(i,1:3);
            x0=pian(i,1)+temp1(1)*fen1+temp2(1)*fen2;
            y0=pian(i,2)+temp1(2)*fen1+temp2(2)*fen2;
            z0=pian(i,3)+temp1(3)*fen1+temp2(3)*fen2;
            xn=(b1*b2*x0/a2+c1*c2*x0/a2-b1*y0-c1*z0-d)/(a1+b1*b2/a2+c1*c2/a2);
            yn=(xn-x0)/a2*b2+y0;
            zn=(xn-x0)/a2*c2+z0;
            if sqrt((xn-xx)^2+(yn-yy)^2+(zn-zz)^2)<0.5
                gg=gg+1;
            end
        end
        for j=1:jing
            fen1=rand(1);fen2=rand(1);fen3=rand(1);
            fen1=fen1/sum(fen1+fen2+fen3);
            fen2=fen2/sum(fen1+fen2+fen3);
            fen3=fen2/sum(fen1+fen2+fen3);
            temp1=pian(i,1:3)-pian(i,4:6);
            temp2=pian(i,7:9)-pian(i,4:6);
            x0=pian(i,4)+temp1(1)*fen1+temp2(1)*fen2;
            y0=pian(i,5)+temp1(2)*fen1+temp2(2)*fen2;
            z0=pian(i,6)+temp1(3)*fen1+temp2(3)*fen2;
            xn=(b1*b2*x0/a2+c1*c2*x0/a2-b1*y0-c1*z0-d)/(a1+b1*b2/a2+c1*c2/a2);
            yn=(xn-x0)/a2*b2+y0;
            zn=(xn-x0)/a2*c2+z0;
            if sqrt((xn-xx)^2+(yn-yy)^2+(zn-zz)^2)<0.5
                gg=gg+1;
            end
        end
        for j=1:jing
            fen1=rand(1);fen2=rand(1);fen3=rand(1);
            fen1=fen1/sum(fen1+fen2+fen3);
            fen2=fen2/sum(fen1+fen2+fen3);
            fen3=fen2/sum(fen1+fen2+fen3);
            temp1=pian(i,1:3)-pian(i,7:9);
            temp2=pian(i,4:6)-pian(i,7:9);
            x0=pian(i,7)+temp1(1)*fen1+temp2(1)*fen2;
            y0=pian(i,8)+temp1(2)*fen1+temp2(2)*fen2;
            z0=pian(i,9)+temp1(3)*fen1+temp2(3)*fen2;
            xn=(b1*b2*x0/a2+c1*c2*x0/a2-b1*y0-c1*z0-d)/(a1+b1*b2/a2+c1*c2/a2);
            yn=(xn-x0)/a2*b2+y0;
            zn=(xn-x0)/a2*c2+z0;
            if sqrt((xn-xx)^2+(yn-yy)^2+(zn-zz)^2)<0.5
                gg=gg+1;
            end
        end
        xinhao1(i)=gg/jing*pp(i)/3;
    end
    xinbi1=sum(xinhao1)/sum(pp);
    %新接收比
    xzhu=-zhuf.*(bestpop')+zhu;
    zhu=xzhu;
    %找出需要调节的主节索点的反射面
    pian=[];fangzhi=[];
    for i=2:4301
        pan1=0;pan2=0;pan3=0;
        for j=1:size(ge,2)
            if isequal(data1{ge(j)+1,1},data3{i,1})
                pan1=j;
            end
            if isequal(data1{ge(j)+1,1},data3{i,2})
                pan2=j;
            end
            if isequal(data1{ge(j)+1,1},data3{i,3})
                pan3=j;
            end
        end
        if pan1~=0&&pan2~=0&&pan3~=0
            pian=[pian;[zhu(pan1,:) zhu(pan2,:) zhu(pan3,:)]];
            fangzhi=[fangzhi;(zhuf(pan1,:)+zhuf(pan2,:)+zhuf(pan3,:))/3];
        end
    end
    %计算三角反射面中心与方向直线的交点
    pp=(fangzhi(:,1).*xd+fangzhi(:,2).*yd+fangzhi(:,3).*zd)./...
        sqrt(fangzhi(:,1).^2+fangzhi(:,2).^2+fangzhi(:,3).^2)/sqrt(xd^2+yd^2+zd^2);
    Ni=fangzhi;
    a=36.795/180*pi;b=78.169/180*pi;
    L=[cos(b)*cos(a) cos(b)*sin(a) sin(b)];
    a1=L(1);b1=L(2);c1=L(3);
    xa=L(1);ya=L(2);za=L(3);
    xb=Ni(:,1);yb=Ni(:,2);zb=Ni(:,3);
    temp=xa*xb+ya*yb+za*zb;
    LL=L-2*temp.*Ni;
    LL=LL./sqrt(LL(:,1).^2+LL(:,2).^2+LL(:,3).^2);
    xx=-rr*0.534*cos(b)*cos(a);
    yy=-rr*0.534*cos(b)*sin(a);
    zz=-rr*0.534*sin(b);
    xinhao2=zeros(1295,1);
    for i=1:1295
        gg=0;
        a2=LL(i,1);
        b2=LL(i,2);
        c2=LL(i,3);
        d=-a1*xx-b1*yy-c1*zz;
        for j=1:jing
            fen1=rand(1);fen2=rand(1);fen3=rand(1);
            fen1=fen1/sum(fen1+fen2+fen3);
            fen2=fen2/sum(fen1+fen2+fen3);
            fen3=fen2/sum(fen1+fen2+fen3);
            temp1=pian(i,4:6)-pian(i,1:3);
            temp2=pian(i,7:9)-pian(i,1:3);
            x0=pian(i,1)+temp1(1)*fen1+temp2(1)*fen2;
            y0=pian(i,2)+temp1(2)*fen1+temp2(2)*fen2;
            z0=pian(i,3)+temp1(3)*fen1+temp2(3)*fen2;
            xn=(b1*b2*x0/a2+c1*c2*x0/a2-b1*y0-c1*z0-d)/(a1+b1*b2/a2+c1*c2/a2);
            yn=(xn-x0)/a2*b2+y0;
            zn=(xn-x0)/a2*c2+z0;
            if sqrt((xn-xx)^2+(yn-yy)^2+(zn-zz)^2)<0.5
                gg=gg+1;
            end
        end
        for j=1:jing
            fen1=rand(1);fen2=rand(1);fen3=rand(1);
            fen1=fen1/sum(fen1+fen2+fen3);
            fen2=fen2/sum(fen1+fen2+fen3);
            fen3=fen2/sum(fen1+fen2+fen3);
            temp1=pian(i,1:3)-pian(i,4:6);
            temp2=pian(i,7:9)-pian(i,4:6);
            x0=pian(i,4)+temp1(1)*fen1+temp2(1)*fen2;
            y0=pian(i,5)+temp1(2)*fen1+temp2(2)*fen2;
            z0=pian(i,6)+temp1(3)*fen1+temp2(3)*fen2;
            xn=(b1*b2*x0/a2+c1*c2*x0/a2-b1*y0-c1*z0-d)/(a1+b1*b2/a2+c1*c2/a2);
            yn=(xn-x0)/a2*b2+y0;
            zn=(xn-x0)/a2*c2+z0;
            if sqrt((xn-xx)^2+(yn-yy)^2+(zn-zz)^2)<0.5
                gg=gg+1;
            end
        end
        for j=1:jing
            fen1=rand(1);fen2=rand(1);fen3=rand(1);
            fen1=fen1/sum(fen1+fen2+fen3);
            fen2=fen2/sum(fen1+fen2+fen3);
            fen3=fen2/sum(fen1+fen2+fen3);
            temp1=pian(i,1:3)-pian(i,7:9);
            temp2=pian(i,4:6)-pian(i,7:9);
            x0=pian(i,7)+temp1(1)*fen1+temp2(1)*fen2;
            y0=pian(i,8)+temp1(2)*fen1+temp2(2)*fen2;
            z0=pian(i,9)+temp1(3)*fen1+temp2(3)*fen2;
            xn=(b1*b2*x0/a2+c1*c2*x0/a2-b1*y0-c1*z0-d)/(a1+b1*b2/a2+c1*c2/a2);
            yn=(xn-x0)/a2*b2+y0;
            zn=(xn-x0)/a2*c2+z0;
            if sqrt((xn-xx)^2+(yn-yy)^2+(zn-zz)^2)<0.5
                gg=gg+1;
            end
        end
        xinhao2(i)=gg/jing*pp(i)/3;
    end
    xinbi2=sum(xinhao2)/sum(pp);
    xinbi1,xinbi2
    (xinbi2-xinbi1)/xinbi1
end