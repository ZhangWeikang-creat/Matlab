function Pxplot(Y1)

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 plot
plot(Y1,'LineWidth',2);

% 创建 ylabel
ylabel({'Power(W)'});

% 创建 xlabel
xlabel({'Position(m)'});

box(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'Color','none','FontName','Times New Roman','FontSize',14,...
    'FontWeight','bold','LineWidth',1.5);
