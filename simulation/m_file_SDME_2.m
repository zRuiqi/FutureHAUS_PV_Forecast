
PV = xlsread('SolarGaussian.xlsx',1,'B1:D241');
timex=PV(:,1);
Psolar2=PV(:,3);

time=0:1:24*60-1;

Psolar=resample(Psolar2,length(time),length(Psolar2));
Noise=wgn(1440,1,20);

LOAD = xlsread('LoadSDME Total Loads.xlsx',1,'B5:R17284');
Pload2=LOAD(:,16);
Pload=resample(Pload2,length(time),length(Pload2));

time=time(:);
Psolar=Psolar(:);

cooktop2 = xlsread('cooktop.xlsx',1,'B2:B61');
dishwasher2 = xlsread('dishwasher.xlsx',1,'B2:B79');
fridge2 = xlsread('fridge.xlsx',1,'B2:B781');
hvac2 = xlsread('hvac.xlsx',1,'B2:B1174');
island2 = xlsread('island.xlsx',1,'B2:B4');
lights2 = xlsread('cooktop.xlsx',1,'B2:B3');
oven2 = xlsread('cooktop.xlsx',1,'B2:B256');
warmingdrawer2 = xlsread('warming drawer.xlsx',1,'B2:B36');
washerdryer2 = xlsread('washer dryer.xlsx',1,'B2:B78');


empty=zeros(1440,1);

CompetitionDAY =10; % Enter Competition Day

% Start Competition Day 1 -----------------------------

if CompetitionDAY == 1

HVAC(1:1440)=1680/240; HVAC=HVAC(:);
HVAC(1:5*60+45)=3;
HVAC(17*60+45:1440)=3;

Lights_TimeON = 17*60 + 15; % Enter time 
Lights=empty; Lights(Lights_TimeON:(Lights_TimeON-1)+(2*60+45))=350/240; Lights=Lights(:);

EV_TimeON = 0*60; % Enter time
EV=empty; %EV(EV_TimeON:(EV_TimeON-1)+(2*60+34))=16; EV=EV(:);

Oven_TimeON = 12*60; % Enter time
Oven=empty; Oven(Oven_TimeON:(Oven_TimeON-1)+length(oven2))=oven2; Oven=Oven(:);

Cooktop_TimeON = 12*60; % Enter time
Cooktop=empty; %Cooktop(Cooktop_TimeON:(Cooktop_TimeON-1)+length(cooktop2))=cooktop2; Cooktop=Cooktop(:);

Warming_TimeON = 13*60+10; % Enter time
WarmingDrawer=empty; %WarmingDrawer(Warming_TimeON:(Warming_TimeON-1)+length(warmingdrawer2))=warmingdrawer2; WarmingDrawer=WarmingDrawer(:);

HE_TimeON = 9*60; % Enter time
HomeElectronics=empty; HomeElectronics(HE_TimeON:(HE_TimeON-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);
HE_TimeON2 = 15*60; % Enter time
HomeElectronics(HE_TimeON2:(HE_TimeON2-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);

WD_TimeON = 13*60+50; % Enter time
WasherDryer=empty; WasherDryer(WD_TimeON:(WD_TimeON-1)+length(washerdryer2))=washerdryer2; WasherDryer=0.5*WasherDryer(:);

FR_TimeON = 6*60; % Enter time
Fridge=empty; Fridge(FR_TimeON:(FR_TimeON-1)+length(fridge2))=fridge2; Fridge=Fridge(:);

DW_TimeON = 0*60; % Enter time
Dishwasher=empty; %Dishwasher(DW_TimeON:(DW_TimeON-1)+length(dishwasher2))=dishwasher2; Dishwasher=0.5*Dishwasher(:);

TotalLoad=HVAC+Lights+EV+Oven+Cooktop+WarmingDrawer+HomeElectronics+WasherDryer+Fridge+Dishwasher;

end
% End Competition Day 1 --------------------------------



% Start Competition Day 2 -----------------------------

if CompetitionDAY == 2

HVAC(1:1440)=1680/240; HVAC=HVAC(:);
HVAC(1:5*60+45)=3;
HVAC(17*60+45:1440)=3;

Lights_TimeON = 17*60 + 15; % Enter time 
Lights=empty; Lights(Lights_TimeON:(Lights_TimeON-1)+(2*60+45))=350/240; Lights=Lights(:);

EV_TimeON = 13*60; % Enter time
EV=empty; EV(EV_TimeON:(EV_TimeON-1)+(2*60+34))=16; EV=EV(:);

Oven_TimeON = 12*60; % Enter time
Oven=empty; %Oven(Oven_TimeON:(Oven_TimeON-1)+length(oven2))=oven2; Oven=Oven(:);

Cooktop_TimeON = 12*60; % Enter time
Cooktop=empty; Cooktop(Cooktop_TimeON:(Cooktop_TimeON-1)+length(cooktop2))=cooktop2; Cooktop=Cooktop(:);

Warming_TimeON = 13*60+10; % Enter time
WarmingDrawer=empty; WarmingDrawer(Warming_TimeON:(Warming_TimeON-1)+length(warmingdrawer2))=warmingdrawer2; WarmingDrawer=WarmingDrawer(:);

HE_TimeON = 9*60; % Enter time
HomeElectronics=empty; HomeElectronics(HE_TimeON:(HE_TimeON-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);
HE_TimeON2 = 15*60; % Enter time
HomeElectronics(HE_TimeON2:(HE_TimeON2-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);

WD_TimeON = 13*60+50; % Enter time
WasherDryer=empty; WasherDryer(WD_TimeON:(WD_TimeON-1)+length(washerdryer2))=washerdryer2; WasherDryer=0.5*WasherDryer(:);

FR_TimeON = 6*60; % Enter time
Fridge=empty; Fridge(FR_TimeON:(FR_TimeON-1)+length(fridge2))=fridge2; Fridge=Fridge(:);

DW_TimeON = 15*60; % Enter time
Dishwasher=empty; Dishwasher(DW_TimeON:(DW_TimeON-1)+length(dishwasher2))=dishwasher2; Dishwasher=0.5*Dishwasher(:);

TotalLoad=HVAC+Lights+EV+Oven+Cooktop+WarmingDrawer+HomeElectronics+WasherDryer+Fridge+Dishwasher;

end
% End Competition Day 2 --------------------------------


% Start Competition Day 3 -----------------------------

if CompetitionDAY == 3

HVAC(1:1440)=1680/240; HVAC=HVAC(:);
HVAC(1:5*60+45)=3;
HVAC(17*60+45:1440)=3;

Lights_TimeON = 17*60 + 15; % Enter time 
Lights=empty; Lights(Lights_TimeON:(Lights_TimeON-1)+(2*60+45))=350/240; Lights=Lights(:);

EV_TimeON = 13*60; % Enter time
EV=empty; EV(EV_TimeON:(EV_TimeON-1)+(2*60+34))=16; EV=EV(:);

Oven_TimeON = 12*60; % Enter time
Oven=empty; Oven(Oven_TimeON:(Oven_TimeON-1)+length(oven2))=oven2; Oven=Oven(:);

Cooktop_TimeON = 12*60; % Enter time
Cooktop=empty; %Cooktop(Cooktop_TimeON:(Cooktop_TimeON-1)+length(cooktop2))=cooktop2; Cooktop=Cooktop(:);

Warming_TimeON = 13*60+10; % Enter time
WarmingDrawer=empty; %WarmingDrawer(Warming_TimeON:(Warming_TimeON-1)+length(warmingdrawer2))=warmingdrawer2; WarmingDrawer=WarmingDrawer(:);

HE_TimeON = 9*60; % Enter time
HomeElectronics=empty; HomeElectronics(HE_TimeON:(HE_TimeON-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);
HE_TimeON2 = 15*60; % Enter time
HomeElectronics(HE_TimeON2:(HE_TimeON2-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);

WD_TimeON = 13*60+50; % Enter time
WasherDryer=empty; WasherDryer(WD_TimeON:(WD_TimeON-1)+length(washerdryer2))=washerdryer2; WasherDryer=0.5*WasherDryer(:);

FR_TimeON = 6*60; % Enter time
Fridge=empty; Fridge(FR_TimeON:(FR_TimeON-1)+length(fridge2))=fridge2; Fridge=Fridge(:);

DW_TimeON = 15*60; % Enter time
Dishwasher=empty; Dishwasher(DW_TimeON:(DW_TimeON-1)+length(dishwasher2))=dishwasher2; Dishwasher=0.5*Dishwasher(:);

TotalLoad=HVAC+Lights+EV+Oven+Cooktop+WarmingDrawer+HomeElectronics+WasherDryer+Fridge+Dishwasher;

end
% End Competition Day 3 --------------------------------

% Start Competition Day 4 -----------------------------

if CompetitionDAY == 4

HVAC(1:1440)=1680/240; HVAC=HVAC(:);
HVAC(1:5*60+45)=3;
HVAC(17*60+45:1440)=3;

Lights_TimeON = 17*60 + 15; % Enter time 
Lights=empty; Lights(Lights_TimeON:(Lights_TimeON-1)+(2*60+45))=350/240; Lights=Lights(:);

EV_TimeON = 13*60; % Enter time
EV=empty; EV(EV_TimeON:(EV_TimeON-1)+(2*60+34))=16; EV=EV(:);

Oven_TimeON = 12*60; % Enter time
Oven=empty; Oven(Oven_TimeON:(Oven_TimeON-1)+length(oven2))=oven2; Oven=Oven(:);

Cooktop_TimeON = 12*60; % Enter time
Cooktop=empty; %Cooktop(Cooktop_TimeON:(Cooktop_TimeON-1)+length(cooktop2))=cooktop2; Cooktop=Cooktop(:);

Warming_TimeON = 13*60+10; % Enter time
WarmingDrawer=empty; %WarmingDrawer(Warming_TimeON:(Warming_TimeON-1)+length(warmingdrawer2))=warmingdrawer2; WarmingDrawer=WarmingDrawer(:);

HE_TimeON = 9*60; % Enter time
HomeElectronics=empty; HomeElectronics(HE_TimeON:(HE_TimeON-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);
HE_TimeON2 = 15*60; % Enter time
HomeElectronics(HE_TimeON2:(HE_TimeON2-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);

WD_TimeON = 13*60+50; % Enter time
WasherDryer=empty; WasherDryer(WD_TimeON:(WD_TimeON-1)+length(washerdryer2))=washerdryer2; WasherDryer=0.5*WasherDryer(:);

FR_TimeON = 6*60; % Enter time
Fridge=empty; Fridge(FR_TimeON:(FR_TimeON-1)+length(fridge2))=fridge2; Fridge=Fridge(:);

DW_TimeON = 15*60; % Enter time
Dishwasher=empty; Dishwasher(DW_TimeON:(DW_TimeON-1)+length(dishwasher2))=dishwasher2; Dishwasher=0.5*Dishwasher(:);

TotalLoad=HVAC+Lights+EV+Oven+Cooktop+WarmingDrawer+HomeElectronics+WasherDryer+Fridge+Dishwasher;

end
% End Competition Day 4 --------------------------------

% Start Competition Day 5 -----------------------------

if CompetitionDAY == 5

HVAC(1:1440)=1680/240; HVAC=HVAC(:);
HVAC(1:5*60+45)=3;
HVAC(17*60+45:1440)=3;

Lights_TimeON = 17*60 + 15; % Enter time 
Lights=empty; Lights(Lights_TimeON:(Lights_TimeON-1)+(2*60+45))=350/240; Lights=Lights(:);

EV_TimeON = 13*60; % Enter time
EV=empty; %EV(EV_TimeON:(EV_TimeON-1)+(2*60+34))=16; EV=EV(:);

Oven_TimeON = 12*60; % Enter time
Oven=empty; %Oven(Oven_TimeON:(Oven_TimeON-1)+length(oven2))=oven2; Oven=Oven(:);

Cooktop_TimeON = 12*60; % Enter time
Cooktop=empty; Cooktop(Cooktop_TimeON:(Cooktop_TimeON-1)+length(cooktop2))=cooktop2; Cooktop=Cooktop(:);

Warming_TimeON = 13*60+10; % Enter time
WarmingDrawer=empty; WarmingDrawer(Warming_TimeON:(Warming_TimeON-1)+length(warmingdrawer2))=warmingdrawer2; WarmingDrawer=WarmingDrawer(:);

HE_TimeON = 9*60; % Enter time
HomeElectronics=empty; HomeElectronics(HE_TimeON:(HE_TimeON-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);
HE_TimeON2 = 15*60; % Enter time
HomeElectronics(HE_TimeON2:(HE_TimeON2-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);

WD_TimeON = 13*60+50; % Enter time
WasherDryer=empty; %WasherDryer(WD_TimeON:(WD_TimeON-1)+length(washerdryer2))=washerdryer2; WasherDryer=0.5*WasherDryer(:);

FR_TimeON = 6*60; % Enter time
Fridge=empty; Fridge(FR_TimeON:(FR_TimeON-1)+length(fridge2))=fridge2; Fridge=Fridge(:);

DW_TimeON = 15*60; % Enter time
Dishwasher=empty; %Dishwasher(DW_TimeON:(DW_TimeON-1)+length(dishwasher2))=dishwasher2; Dishwasher=0.5*Dishwasher(:);

TotalLoad=HVAC+Lights+EV+Oven+Cooktop+WarmingDrawer+HomeElectronics+WasherDryer+Fridge+Dishwasher;

end
% End Competition Day 5 --------------------------------


% Start Competition Day 6 -----------------------------

if CompetitionDAY == 6

HVAC(1:1440)=1680/240; HVAC=HVAC(:);
HVAC(1:5*60+45)=3;
HVAC(17*60+45:1440)=3;

Lights_TimeON = 17*60 + 15; % Enter time 
Lights=empty; Lights(Lights_TimeON:(Lights_TimeON-1)+(2*60+45))=350/240; Lights=Lights(:);

EV_TimeON = 13*60; % Enter time
EV=empty; %EV(EV_TimeON:(EV_TimeON-1)+(2*60+34))=16; EV=EV(:);

Oven_TimeON = 12*60; % Enter time
Oven=empty; %Oven(Oven_TimeON:(Oven_TimeON-1)+length(oven2))=oven2; Oven=Oven(:);

Cooktop_TimeON = 12*60; % Enter time
Cooktop=empty; %Cooktop(Cooktop_TimeON:(Cooktop_TimeON-1)+length(cooktop2))=cooktop2; Cooktop=Cooktop(:);

Warming_TimeON = 13*60+10; % Enter time
WarmingDrawer=empty; %WarmingDrawer(Warming_TimeON:(Warming_TimeON-1)+length(warmingdrawer2))=warmingdrawer2; WarmingDrawer=WarmingDrawer(:);

HE_TimeON = 9*60; % Enter time
HomeElectronics=empty; HomeElectronics(HE_TimeON:(HE_TimeON-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);
HE_TimeON2 = 15*60; % Enter time
HomeElectronics(HE_TimeON2:(HE_TimeON2-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);

WD_TimeON = 13*60+50; % Enter time
WasherDryer=empty; %WasherDryer(WD_TimeON:(WD_TimeON-1)+length(washerdryer2))=washerdryer2; WasherDryer=0.5*WasherDryer(:);

FR_TimeON = 6*60; % Enter time
Fridge=empty; Fridge(FR_TimeON:(FR_TimeON-1)+length(fridge2))=fridge2; Fridge=Fridge(:);

DW_TimeON = 15*60; % Enter time
Dishwasher=empty; %Dishwasher(DW_TimeON:(DW_TimeON-1)+length(dishwasher2))=dishwasher2; Dishwasher=0.5*Dishwasher(:);

TotalLoad=HVAC+Lights+EV+Oven+Cooktop+WarmingDrawer+HomeElectronics+WasherDryer+Fridge+Dishwasher;

end
% End Competition Day 6 --------------------------------

% Start Competition Day 7 -----------------------------

if CompetitionDAY == 7

HVAC(1:1440)=1680/240; HVAC=HVAC(:);
HVAC(1:5*60+45)=3;
HVAC(17*60+45:1440)=3;

Lights_TimeON = 17*60 + 15; % Enter time 
Lights=empty; Lights(Lights_TimeON:(Lights_TimeON-1)+(2*60+45))=350/240; Lights=Lights(:);

EV_TimeON = 13*60; % Enter time
EV=empty; %EV(EV_TimeON:(EV_TimeON-1)+(2*60+34))=16; EV=EV(:);

Oven_TimeON = 12*60; % Enter time
Oven=empty; %Oven(Oven_TimeON:(Oven_TimeON-1)+length(oven2))=oven2; Oven=Oven(:);

Cooktop_TimeON = 12*60; % Enter time
Cooktop=empty; Cooktop(Cooktop_TimeON:(Cooktop_TimeON-1)+length(cooktop2))=cooktop2; Cooktop=Cooktop(:);

Warming_TimeON = 13*60+10; % Enter time
WarmingDrawer=empty; WarmingDrawer(Warming_TimeON:(Warming_TimeON-1)+length(warmingdrawer2))=warmingdrawer2; WarmingDrawer=WarmingDrawer(:);

HE_TimeON = 9*60; % Enter time
HomeElectronics=empty; HomeElectronics(HE_TimeON:(HE_TimeON-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);
HE_TimeON2 = 15*60; % Enter time
HomeElectronics(HE_TimeON2:(HE_TimeON2-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);

WD_TimeON = 13*60+50; % Enter time
WasherDryer=empty; %WasherDryer(WD_TimeON:(WD_TimeON-1)+length(washerdryer2))=washerdryer2; WasherDryer=0.5*WasherDryer(:);

FR_TimeON = 6*60; % Enter time
Fridge=empty; Fridge(FR_TimeON:(FR_TimeON-1)+length(fridge2))=fridge2; Fridge=Fridge(:);

DW_TimeON = 15*60; % Enter time
Dishwasher=empty; %Dishwasher(DW_TimeON:(DW_TimeON-1)+length(dishwasher2))=dishwasher2; Dishwasher=0.5*Dishwasher(:);

TotalLoad=HVAC+Lights+EV+Oven+Cooktop+WarmingDrawer+HomeElectronics+WasherDryer+Fridge+Dishwasher;

end
% End Competition Day 7 --------------------------------

% Start Competition Day 8 -----------------------------

if CompetitionDAY == 8

HVAC(1:1440)=1680/240; HVAC=HVAC(:);
HVAC(1:5*60+45)=3;
HVAC(17*60+45:1440)=3;

Lights_TimeON = 17*60 + 15; % Enter time 
Lights=empty; Lights(Lights_TimeON:(Lights_TimeON-1)+(2*60+45))=350/240; Lights=Lights(:);

EV_TimeON = 13*60; % Enter time
EV=empty; EV(EV_TimeON:(EV_TimeON-1)+(2*60+34))=16; EV=EV(:);

Oven_TimeON = 12*60; % Enter time
Oven=empty; Oven(Oven_TimeON:(Oven_TimeON-1)+length(oven2))=oven2; Oven=Oven(:);

Cooktop_TimeON = 12*60; % Enter time
Cooktop=empty; %Cooktop(Cooktop_TimeON:(Cooktop_TimeON-1)+length(cooktop2))=cooktop2; Cooktop=Cooktop(:);

Warming_TimeON = 13*60+10; % Enter time
WarmingDrawer=empty; %WarmingDrawer(Warming_TimeON:(Warming_TimeON-1)+length(warmingdrawer2))=warmingdrawer2; WarmingDrawer=WarmingDrawer(:);

HE_TimeON = 9*60; % Enter time
HomeElectronics=empty; HomeElectronics(HE_TimeON:(HE_TimeON-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);
HE_TimeON2 = 15*60; % Enter time
HomeElectronics(HE_TimeON2:(HE_TimeON2-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);

WD_TimeON = 13*60+50; % Enter time
WasherDryer=empty; WasherDryer(WD_TimeON:(WD_TimeON-1)+length(washerdryer2))=washerdryer2; WasherDryer=0.5*WasherDryer(:);

FR_TimeON = 6*60; % Enter time
Fridge=empty; Fridge(FR_TimeON:(FR_TimeON-1)+length(fridge2))=fridge2; Fridge=Fridge(:);

DW_TimeON = 15*60; % Enter time
Dishwasher=empty; Dishwasher(DW_TimeON:(DW_TimeON-1)+length(dishwasher2))=dishwasher2; Dishwasher=0.5*Dishwasher(:);

TotalLoad=HVAC+Lights+EV+Oven+Cooktop+WarmingDrawer+HomeElectronics+WasherDryer+Fridge+Dishwasher;

end
% End Competition Day 8 --------------------------------

% Start Competition Day 9 -----------------------------

if CompetitionDAY == 9

HVAC(1:1440)=1680/240; HVAC=HVAC(:);
HVAC(1:5*60+45)=3;
HVAC(17*60+45:1440)=3;

Lights_TimeON = 17*60 + 15; % Enter time 
Lights=empty; Lights(Lights_TimeON:(Lights_TimeON-1)+(2*60+45))=350/240; Lights=Lights(:);

EV_TimeON = 13*60; % Enter time
EV=empty; EV(EV_TimeON:(EV_TimeON-1)+(2*60+34))=16; EV=EV(:);

Oven_TimeON = 12*60; % Enter time
Oven=empty; Oven(Oven_TimeON:(Oven_TimeON-1)+length(oven2))=oven2; Oven=Oven(:);

Cooktop_TimeON = 12*60; % Enter time
Cooktop=empty; %Cooktop(Cooktop_TimeON:(Cooktop_TimeON-1)+length(cooktop2))=cooktop2; Cooktop=Cooktop(:);

Warming_TimeON = 13*60+10; % Enter time
WarmingDrawer=empty; %WarmingDrawer(Warming_TimeON:(Warming_TimeON-1)+length(warmingdrawer2))=warmingdrawer2; WarmingDrawer=WarmingDrawer(:);

HE_TimeON = 9*60; % Enter time
HomeElectronics=empty; HomeElectronics(HE_TimeON:(HE_TimeON-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);
HE_TimeON2 = 15*60; % Enter time
HomeElectronics(HE_TimeON2:(HE_TimeON2-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);

WD_TimeON = 13*60+50; % Enter time
WasherDryer=empty; WasherDryer(WD_TimeON:(WD_TimeON-1)+length(washerdryer2))=washerdryer2; WasherDryer=0.5*WasherDryer(:);

FR_TimeON = 6*60; % Enter time
Fridge=empty; Fridge(FR_TimeON:(FR_TimeON-1)+length(fridge2))=fridge2; Fridge=Fridge(:);

DW_TimeON = 15*60; % Enter time
Dishwasher=empty; Dishwasher(DW_TimeON:(DW_TimeON-1)+length(dishwasher2))=dishwasher2; Dishwasher=0.5*Dishwasher(:);

TotalLoad=HVAC+Lights+EV+Oven+Cooktop+WarmingDrawer+HomeElectronics+WasherDryer+Fridge+Dishwasher;

end
% End Competition Day 9 --------------------------------


% Start Competition Day 10 -----------------------------

if CompetitionDAY == 10

HVAC(1:1440)=1680/240; HVAC=HVAC(:);
HVAC(1:5*60+45)=3;
HVAC(17*60+45:1440)=3;

Lights_TimeON = 17*60 + 15; % Enter time 
Lights=empty; Lights(Lights_TimeON:(Lights_TimeON-1)+(2*60+45))=350/240; Lights=Lights(:);

EV_TimeON = 13*60; % Enter time
EV=empty; EV(EV_TimeON:(EV_TimeON-1)+(2*60+34))=16; EV=EV(:);

Oven_TimeON = 12*60; % Enter time
Oven=empty; Oven(Oven_TimeON:(Oven_TimeON-1)+length(oven2))=oven2; Oven=Oven(:);

Cooktop_TimeON = 12*60; % Enter time
Cooktop=empty; %Cooktop(Cooktop_TimeON:(Cooktop_TimeON-1)+length(cooktop2))=cooktop2; Cooktop=Cooktop(:);

Warming_TimeON = 13*60+10; % Enter time
WarmingDrawer=empty; %WarmingDrawer(Warming_TimeON:(Warming_TimeON-1)+length(warmingdrawer2))=warmingdrawer2; WarmingDrawer=WarmingDrawer(:);

HE_TimeON = 9*60; % Enter time
HomeElectronics=empty; HomeElectronics(HE_TimeON:(HE_TimeON-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);
HE_TimeON2 = 15*60; % Enter time
HomeElectronics(HE_TimeON2:(HE_TimeON2-1)+3*60)=350/240; HomeElectronics=HomeElectronics(:);

WD_TimeON = 13*60+50; % Enter time
WasherDryer=empty; WasherDryer(WD_TimeON:(WD_TimeON-1)+length(washerdryer2))=washerdryer2; WasherDryer=0.5*WasherDryer(:);

FR_TimeON = 6*60; % Enter time
Fridge=empty; Fridge(FR_TimeON:(FR_TimeON-1)+length(fridge2))=fridge2; Fridge=Fridge(:);

DW_TimeON = 15*60; % Enter time
Dishwasher=empty; Dishwasher(DW_TimeON:(DW_TimeON-1)+length(dishwasher2))=dishwasher2; Dishwasher=0.5*Dishwasher(:);

TotalLoad=HVAC+Lights+EV+Oven+Cooktop+WarmingDrawer+HomeElectronics+WasherDryer+Fridge+Dishwasher;

end
% End Competition Day 10 --------------------------------

Wbatt=14000*60;
TresholdL = 0;
TresholdH = Wbatt;

Blow=52;
Bhigh=57.6;
X=(Bhigh-Blow)/Wbatt;

