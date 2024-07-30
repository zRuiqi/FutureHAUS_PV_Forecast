
M = xlsread("Energy_Cost.xlsx");
cost = M(:,2);
time3 = M(:,1);

cost_max = max(cost)*ones(length(cost),1);
% disp(time3);

