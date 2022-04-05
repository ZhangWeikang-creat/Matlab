function Pxfigure(YMatrix1)
%CREATEFIGURE(YMatrix1)
%  YMATRIX1:  y 数据的矩阵

%  由 MATLAB 于 20-Feb-2022 17:32:13 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 使用 plot 的矩阵输入创建多行
plot1 = plot(YMatrix1,'LineWidth',2,'Parent',axes1);
set(plot1(1),'DisplayName','Rouleur','LineStyle',':');
set(plot1(2),'DisplayName','Sprinter','MarkerSize',2);
set(plot1(3),'DisplayName','Climber','LineStyle','--');
set(plot1(4),'DisplayName','Specialist');
set(plot1(5),'DisplayName','Puncheur','LineStyle','-.');

% 创建 ylabel
ylabel({'Power(W)'});

% 创建 xlabel
xlabel({'Position(m)'});

box(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'Color','none','FontName','Times New Roman','FontSize',14,...
    'FontWeight','bold','LineWidth',1.5);
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.142857142857143 0.68015873015873 0.216071428571429 0.236507936507936],...
    'EdgeColor','none',"Color","none","Location","best");

