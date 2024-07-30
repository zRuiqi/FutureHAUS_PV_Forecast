% plot(PGrid);title('id [A]','linewidth',8);grid on;

subplot(3,1,1)
timec=PowerFlow.time;
PowerFlow2=PowerFlow.signals.values;
PowerFlow3=resample(PowerFlow2,length(time),length(PowerFlow2));
plot(PowerFlow3(:,4),'LineWidth',1);grid on;
title('futureHAUS Load Demand')
legend('Load')
xlabel('Time [min]') 
ylabel('Power [W]') 

subplot(3,1,2)
plot(PowerFlow3,'LineWidth',1);grid on;
title('futureHAUS Power Flow')
legend('PV','Battery','Load','Sold Back')
xlabel('Time [min]') 
ylabel('Power [W]') 

subplot(3,1,3)
PGrid2=PGrid.signals.values;
PGrid3=resample(PGrid2,length(time),length(PGrid2));grid on;
plot(PGrid3,'LineWidth',1);grid on;
title('futureHAUS net-Power')
legend('net-Power')
xlabel('Time [min]') 
ylabel('Power [W]') 

% subplot(4,1,4)
% PGrid2=PGrid.signals.values;
% PGrid3=resample(PGrid2,length(time),length(PGrid2));grid on;
% plot(PGrid3,'LineWidth',1);grid on;
% title('futureHAUS net-Power')
% legend('net-Power')
% xlabel('Time [min]') 
% ylabel('Power [W]') 

