k=5;
x = linspace(-150,150,100); %设置x轴的范围
y = x; %设置y轴范围
[X,Y] = meshgrid(x,y); %将其x，y轴网格化
Z = -(X.^2+Y.^2+cc(k))/(2*pp(k)); %直接计算
%绘制曲面
Fig = mesh(X,Y,Z,'EdgeColor','b','FaceColor',[0 0 1] ); %绘制三维曲面图
hold on
scatter3(zb(:,1),zb(:,2),zb(:,3),'.','k')