function xzhu=plotfun2(bestpop,zhu,zhuf,pao1)
yzhu=zhu;
xzhu=-zhuf.*(bestpop')+zhu;
figure
scatter3(xzhu(:,1),xzhu(:,2),xzhu(:,3))
hold on
scatter3(yzhu(:,1),yzhu(:,2),yzhu(:,3))
scatter3(pao1(:,1),pao1(:,2),pao1(:,3))
% 创建 figure
figure1 = figure;
colormap(jet);
% 创建 axes
axes1 = axes('Parent',figure1,...
    'Position',[0.150714274875701 0.14968253968254 0.76619048702906 0.815]);
hold(axes1,'on');
% 创建 scatter
scatter(xzhu(:,1),xzhu(:,2),round(bestpop*50)+40,xzhu(:,3),'DisplayName','z坐标','MarkerFaceColor','flat',...
    'MarkerEdgeColor','none');
% 取消以下行的注释以保留坐标区的 X 范围
% xlim(axes1,[-231.71744312847 153.28255687153]);
% 取消以下行的注释以保留坐标区的 Y 范围
% ylim(axes1,[-231.93249502933 153.06750497067]);
box(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'FontName','Times New Roman','FontSize',16,'FontWeight','bold','LineWidth',...
    1.5);
% 创建 ylabel
ylabel('横坐标','FontWeight','bold','FontName','宋体');
% 创建 xlabel
xlabel('纵坐标','FontWeight','bold','FontName','宋体');
end