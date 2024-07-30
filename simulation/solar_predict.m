data = csvread("predicted.csv",1,1);

time2 = data(:,1);
PV_Predict = data(:,2);

PV_Predict = PV_Predict*10;

% disp(time2)
% disp(PV_Predict);
integral = trapz(time2, PV_Predict);
Predict_Total = ones(length(PV_Predict),1)*integral;

plot(Predict_Total,'LineWidth',1);grid on;

title('futureHAUS predict-Power')
legend('Power')
xlabel('Time [min]') 
ylabel('Power [W]') 