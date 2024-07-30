
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import csv



# def read_PV_Data(filename):
#     date = []
#     time = []
#     power = []
#     min = 0
#     with open(filename, newline='') as csvfile:
#         reader = csv.DictReader(csvfile)
#         for row in reader:
            
#             str = row['LocalTime']
#             min = int(str[9:11])*60 + int(str[12:14])
#             # print(min<)
#             if min>=440 and min<=1015:
#                 date.append(str[0:8])
#                 time.append(str[9:14])
#                 power.append(row['Power(MW)'])
#     return date, time, power


# def read_IRR_Data(filename):
#     date = []
#     est = []
#     Global_PSP = []
#     NIP = []
#     Diffuse_PSP = []
#     with open(filename, newline='') as csvfile:
#         reader = csv.DictReader(csvfile)
#         for row in reader:
#             date.append(row['DATE (MM/DD/YYYY)'])
#             est.append(row['EST'])
#             Global_PSP.append(row['Global PSP [W/m^2]'])
#             NIP.append(row['Direct NIP [W/m^2]'])
#             Diffuse_PSP.append(row['Diffuse PSP (sband) [W/m^2]'])
#     return date, est, Global_PSP, NIP, Diffuse_PSP



# date0, time, power = read_PV_Data("PV_data.csv")
# date1, est, Global_PSP, NIP, Diffuse_PSP = read_IRR_Data("irradiance_data.csv")



# print(len(time))
# print(len(power))
# print(date0[0], time[116], power[0])
# print(date1[0], est[115], Global_PSP[0], NIP[0], Diffuse_PSP[0])

# plt(time)




# df = pd.read_csv("PV_data.csv")
# df['LocalTime'] = df['LocalTime'].apply(unidecode.unidecode)  
# date_time = pd.to_datetime(df['LocalTime'], format='%m/%d/%Y %H:%M')


timeofday = np.array([i*5 for i in range(281)])
print(timeofday.shape)
print(timeofday)