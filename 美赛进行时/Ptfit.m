clear
data=[19.85	9.55	5.74	4.71
    21.03	9.09	4.81	3.91
    16.89	8.74	5.53	4.98
    16.89	10.12	5.84	4.35
    18.96	10.01	5.33	4.53
    ];
xx=[];
ydata=[5,60,300,3600];
figure
for i=1:5
    xdata=data(i,:);
    fun = @(x,xdata)(10./((xdata-x(2))./x(1)).^x(3));
    x0 = [13,3,3];
    x=lsqcurvefit(fun,x0,xdata,ydata);
    P=linspace(x(1),x(2),1000);
    plot(fun(x,P),P)
    hold on
    xx=[xx;x];
end
xlim([0,5000])
ylim([3,10])
legend("Rouleur","Sprinter","Climber","Specialist","Puncheur")
save("pt","xx")

figure
m=[17.0809230892899*1.3	5.02629212445641*0.9	1.05472435865596*1.1];
P=linspace(m(1),m(2),1000);
plot(P,fun(m,P))
hold on
f=[17.0809230892899	5.02629212445641	1.05472435865596];
P=linspace(f(1),f(2),1000);
plot(P,fun(f,P))
hold on
ylim([0,5000])
xlim([3,10])
