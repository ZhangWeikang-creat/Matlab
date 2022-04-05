clear
%处理数据
bb2=zeros(4,3);m=0;n=0;
for fanga=0:45:135
    m=m+1;
    for fangb=0:45:90
        n=n+1;
        rr=300.4;
        data1=readcell('data\附件1');
        data2=readmatrix('data\附件2');
        fang=data2(:,2:4)-data2(:,5:7);
        fang=fang./sqrt(fang(:,1).^2+fang(:,2).^2+fang(:,3).^2);
        data3=readcell('data\附件3');
        a=fanga/180*pi;b=fangb/180*pi;
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
        bianhao=cell(692,1);
        for i=1:2226
            if sqrt(sum((zhud-zb(i,:)).^2))<155.2914
                k=k+1;
                ge(k)=i;
                bianhao{k}=data1{i+1,1};
            end
        end
        shu1=k;
        zhu=zb(ge,:);
        zhuf=fang(ge,:);
        %找出需要调节的主节索点的反射面
        pian=[];fangzhi=[];wei=[];
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
                wei=[wei;[pan1 pan2 pan3]];
                pian=[pian;[zhu(pan1,:) zhu(pan2,:) zhu(pan3,:)]];
                fangzhi=[fangzhi;(zhuf(pan1,:)+zhuf(pan2,:)+zhuf(pan3,:))/3];
            end
        end
        shu2=size(pian,1);
        %计算三角反射面中心与方向直线的交点
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
        %抛物面与节索点方向的交点
        a=fanga/180*pi;b=fangb/180*pi;
        p=-280.029921085874;
        c=-168548.240045800;
        aa=zhuf(:,1);
        bb=zhuf(:,2);
        cc=zhuf(:,3);
        aaa=(cos(a)^2.*sin(b)^2+sin(a)^2+bb.^2./aa.^2.*(sin(a)^2*sin(b)^2+cos(a)^2)+cc.^2./...
            aa.^2.*cos(b)^2+2.*bb./aa.*(cos(a)*sin(a)*sin(b)^2-sin(a)*cos(a))-2.*cc./aa.*cos(a)*...
            cos(b)*sin(b)-2.*bb.*cc./aa.^2*cos(b)*sin(a)*sin(b));
        bbb=(2.*p.*sin(b).*cc./aa+2.*p.*cos(b).*sin(a).*bb./aa+2*p*cos(a)*cos(b));
        xpao1=(-bbb-sqrt(bbb.^2-4.*aaa*c))./(2.*aaa);
        xpao2=(-bbb+sqrt(bbb.^2-4.*aaa*c))./(2.*aaa);
        temp=[xpao1-zhu(:,1) xpao2-zhu(:,1)]';
        temp1=[xpao1 xpao2]';
        [~,xu]=min(abs(temp));
        xpao=zeros(size(xu,2),1);
        for i=1:size(xu,2)
            xpao(i)=temp1(xu(i),i);
        end
        ypao=xpao.*bb./aa;
        zpao=xpao.*cc./aa;
        pao=[xpao ypao zpao];
        pao(isnan(pao))=zhu(isnan(pao));
        pao1=pao;
        %抛物线与反射面中心的交点
        aa=fangzhi(:,1);
        bb=fangzhi(:,2);
        cc=fangzhi(:,3);
        aaa=(cos(a)^2.*sin(b)^2+sin(a)^2+bb.^2./aa.^2.*(sin(a)^2*sin(b)^2+cos(a)^2)+cc.^2./...
            aa.^2.*cos(b)^2+2.*bb./aa.*(cos(a)*sin(a)*sin(b)^2-sin(a)*cos(a))-2.*cc./aa.*cos(a)*...
            cos(b)*sin(b)-2.*bb.*cc./aa.^2*cos(b)*sin(a)*sin(b));
        bbb=(2.*p.*sin(b).*cc./aa+2.*p.*cos(b).*sin(a).*bb./aa+2*p*cos(a)*cos(b));
        xpao1=(-bbb-sqrt(bbb.^2-4.*aaa*c))./(2.*aaa);
        xpao2=(-bbb+sqrt(bbb.^2-4.*aaa*c))./(2.*aaa);
        temp=[xpao1-zhixian(:,1) xpao2-zhixian(:,1)]';
        temp1=[xpao1 xpao2]';
        [~,xu]=min(abs(temp));
        xpao=zeros(size(xu,2),1);
        for i=1:size(xu,2)
            xpao(i)=temp1(xu(i),i);
        end
        ypao=xpao.*bb./aa;
        zpao=xpao.*cc./aa;
        pao=[xpao ypao zpao];
        pao(isnan(pao))=zhixian(isnan(pao));
        pao2=pao;
        %遗传算法求解以及绘图
        [bestpop,bestv]=gafun(pao1,pao2,zhu,zhuf,wei,fangzhi,shu1,shu2);
        %xzhu=plotfun2(bestpop,zhu,zhuf,pao1);
        bb2(m,n)=bestv;
    end
end