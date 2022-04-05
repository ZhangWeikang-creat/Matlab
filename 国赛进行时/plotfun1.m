function zhi=plotfun1(pp,cc)
p0=pp(1);c0=cc(1);
e=2*pi*3/4+0.0001:0.0001:2*pi*5/6;
e180=e/pi*180;
r=(-2.*p0.*sin(e)+sqrt((2.*p0.*sin(e)).^2-4.*cos(e).^2.*c0))./(2.*cos(e).^2);
ju0=r-300;
zhi01=sum(abs(ju0));
zhi02=max(abs(ju0));
p0=pp(2);c0=cc(2);
r=(-2.*p0.*sin(e)+sqrt((2.*p0.*sin(e)).^2-4.*cos(e).^2.*c0))./(2.*cos(e).^2);
ju1=r-300;
zhi11=sum(abs(ju1));
zhi12=max(abs(ju1));
p0=pp(3);c0=cc(3);
r=(-2.*p0.*sin(e)+sqrt((2.*p0.*sin(e)).^2-4.*cos(e).^2.*c0))./(2.*cos(e).^2);
ju2=r-300;
zhi21=sum(abs(ju2));
zhi22=max(abs(ju2));
p0=pp(4);c0=cc(4);
r=(-2.*p0.*sin(e)+sqrt((2.*p0.*sin(e)).^2-4.*cos(e).^2.*c0))./(2.*cos(e).^2);
ju3=r-300;
zhi31=sum(abs(ju3));
zhi32=max(abs(ju3));
p0=pp(5);c0=cc(5);
r=(-2.*p0.*sin(e)+sqrt((2.*p0.*sin(e)).^2-4.*cos(e).^2.*c0))./(2.*cos(e).^2);
ju4=r-300;
zhi41=sum(abs(ju4));
zhi42=max(abs(ju4));
zhi=[zhi01 zhi02;zhi11 zhi12;zhi21 zhi22;zhi31 zhi32;zhi41 zhi42];
% 创建 figure
figure1 = figure;
% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% 使用 plot 的矩阵输入创建多行
plot1 = plot([e180' e180' e180' e180' e180'],[ju0' ju1' ju2' ju3' ju4'],'LineWidth',1.5,'Parent',axes1);
set(plot1(1),'DisplayName','最理想抛物面','Color',[0 0 0]);
set(plot1(2),'DisplayName','总行程目标+无边缘约束','LineStyle','--','Color',[0 0 1]);
set(plot1(3),'DisplayName','幅值目标+无边缘约束','Color',[0 0 1]);
set(plot1(4),'DisplayName','总行程目标+边缘约束','LineStyle','--','Color',[1 0 0]);
set(plot1(5),'DisplayName','幅值目标+边缘约束','Color',[1 0 0]);
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'Color','none','FontName','Times New Roman','FontSize',12,...
    'FontWeight','bold','LineWidth',1.5);
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,'FontName','宋体','EdgeColor','none');
% 创建 ylabel
ylabel('理想抛物面与基准球面的距离/米','FontWeight','bold','FontName','宋体');
% 创建 xlabel
xlabel('极坐标角度/度','FontWeight','bold','FontName','宋体');
end