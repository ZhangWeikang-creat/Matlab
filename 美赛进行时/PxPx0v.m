clear
load("data/Track1.mat")
yyaxis right
plot(Trackd{3,4})
hold on
yyaxis left
ylim([0,20])
plot(Trackd{4,4})
plot(Trackd{5,4})
