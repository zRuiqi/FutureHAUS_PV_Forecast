% Civil sunset and sunrise in Oct 2018 in Dubai
% from: https://www.timeanddate.com/sun/united-arab-emirates/dubai

sunrise = ...
    [370, 371, 371, 372, 372, 372, 373, 373, 374, 374, ...
     375, 375, 376, 376, 377, 377, 378, 378, 379, 379, ...
     380, 380, 381, 381, 382, 382, 383, 383, 384, 385, ...
     385];
 
sunset = ...
    [1085, 1084, 1083, 1082, 1081, 1080, 1079, 1078, 1077, 1076, ...
     1075, 1074, 1073, 1072, 1071, 1070, 1070, 1069, 1068, 1067, ...
     1066, 1065, 1064, 1064, 1063, 1062, 1061, 1060, 1060, 1059, ...
     1058];
    
noon = ...
    [728, 728, 727, 727, 727, 726, 726, 726, 726, 725, ...
     725, 725, 725, 724, 724, 724, 724, 723, 723, 723, ...
     723, 723, 723, 723, 722, 722, 722, 722, 722, 722, ...
     722];
 
% quick fix for Blacksburg August 24
% this is because we have real measurement from Aug.24, 2018 - Blacksburg
% and we can easily compare model with real value
sun66rise(1) = 411;
sunset(1) = 1206;
noon(1) = 809;

% chose the day from 1..31 and it will draw the solar curve for that day
% day 1 is special
day = 1;  
 
whole_day = 1440;  % day in minutes 24*60 = 1440
x = (0:1:whole_day);  % x axis in minutes

% daylight is time btw sunrise and sunset but
% pv starts working litle bit later so we need this
% lets asume that pw will stop working sooner 
% in this case it is 25 min after sunrise and before sunset
daylight_correction = 50;  
daylight = sunset(day)-sunrise(day)-daylight_correction;

% normal distribution
% since 3 sigma left and right equals 6 sigma
% represent 99.73% array below the curve
% daylight will be devided by 6
norm = normpdf(x, noon(day), daylight/6);  

pv_pow = 13500;  % max PV power. in our case 13.5kW
pv_pow_slope = 5.5;  % don't ask me why! answer is: because!

factor = (pv_pow*pv_pow_slope)/max(norm);  % y-axis scaling factor
pv = norm.*factor;  % this is our model

% Max OutBack power 7.2kW (30A)
inv_pow = 7200;

% Since our Outback is able to give us 7.7kWh
% we have to clip (shave :-)) this curve
pv_clipped = min(pv, inv_pow);

% Since we shouldnt have any value during the night
% set it to zero (0)
clip_to = sunrise(day)+round(daylight_correction/2);
pv_clipped(1:clip_to)=0;
clip_from = sunset(day)-round(daylight_correction/2); 
pv_clipped(clip_from:end)=0;

% Real PV
real_pv = xlsread('data/0824 pv.xlsx',1,'B2:B1407');
real_pv(numel(pv_clipped)) = 0;

% Voila - pretty decent estimation
figure;
plot(x, pv_clipped)  % blue
if day == 1
    hold on
    plot(x, real_pv)  % red
    hold off
end