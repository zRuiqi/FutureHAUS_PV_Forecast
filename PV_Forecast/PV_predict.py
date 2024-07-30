
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import datetime
import csv
import sklearn
from sklearn.linear_model import LinearRegression
from sklearn.metrics import r2_score
from sklearn.metrics import mean_squared_error
from pvlib.forecast import GFS, NAM, NDFD, HRRR, RAP

def get_Realtime():
    start = pd.Timestamp(datetime.date.today(), tz='US/Eastern')
    end = start + pd.Timedelta(days=1)

    irrad_vars = ['ghi', 'dni', 'dhi']

    model = NDFD()
    lattitude, longitude = 37.2, -80.4
    data = model.get_processed_data(lattitude, longitude, start, end)
    return data[irrad_vars]

#
def scale_Data(data):
    # Min-Max Normalization
    df = data
    df_norm = (df-df.min())/(df.max()-df.min())
    # df_norm = pd.concat((df_norm, data.species), 1)
    return df_norm


def get_Predicted():
    df1 = pd.read_csv("training_data/PV_data_train2.csv")
    df1['LocalTime'] = pd.to_datetime(df1['LocalTime'], format='%m/%d/%y %H:%M')
    x = df1

    df2 = pd.read_csv("training_data/irradiance_data2.csv")
    df2['LocalTime'] = df2['DATE (MM/DD/YYYY)'] + '-' + df2['EST']
    df2['LocalTime'] = pd.to_datetime(df1['LocalTime'], format='%m/%d/%y-%H:%M')
    y = df2.drop("DATE (MM/DD/YYYY)", axis=1)


    realtime_df = get_Realtime()

    irrad_vars = ['GHI',  'DIP', 'DHI']

    df = {'LocalTime':df1['LocalTime'],  'Power(MW)':df1['Power(MW)'], 'GHI':df2['GHI'], 'DIP':df2['DIP'], 'DHI':df2['DHI']}
    data = pd.DataFrame(df)
    y = data['Power(MW)']
    x = data.drop(['Power(MW)','LocalTime'], axis=1)


    x_train, x_test, y_train, y_test = sklearn.model_selection.train_test_split(x, y, test_size = 0.2,shuffle=False)

    LR = LinearRegression()
    LR.fit(x_train,y_train)
    y_prediction =  LR.predict(x_test)
    y_prediction_real = LR.predict(realtime_df)
    # Min-Max Normalization
    # y_prediction_real = (y_prediction_real-y_prediction_real.min())/(y_prediction_real.max()-y_prediction_real.min())
    y_prediction_real = y_prediction_real-1.4
    


    score=r2_score(y_test,y_prediction)
    # print('r2: ',score)
    # print('mean sqrd_error: ',mean_squared_error(y_test,y_prediction))
    # print('root mean squared error: ',np.sqrt(mean_squared_error(y_test,y_prediction)))

    print(y_prediction_real)
    print(y_prediction_real.shape)
    length = len(y_prediction_real)
    timeofday = np.array([i*int(1400/length) for i in range(length)])
    print(timeofday)
    print(timeofday.shape)
    df_out = {'Time':timeofday, 'Power':y_prediction_real}
    data_out = pd.DataFrame(df_out)
    data_out.to_csv('predicted.csv')

    return realtime_df, y_prediction_real

realtime_df, y_prediction_real = get_Predicted()

# print(realtime_df, y_prediction_real)
# print(y_prediction_real.shape)

def graph_results(realtime_df, y_prediction_real):
    plt.figure(figsize = (24,6))
    plt.rcParams.update({'font.size': 20})
    plt.plot(y_prediction_real, linewidth=5, label= 'Predicted')
    plt.grid()

    plt.ylabel('Solar Energy in MWh', fontsize=24)
    plt.legend(fontsize=20)

    plt.figure(figsize = (24,6))

    plt.plot(realtime_df['ghi'], linewidth=4, label= 'ghi')
    plt.plot(realtime_df['dni'], linewidth=4, label= 'dni')
    plt.plot(realtime_df['dhi'], linewidth=4, label= 'dhi')
    plt.legend(fontsize=20)
    plt.grid()
    plt.show()

graph_results(realtime_df, y_prediction_real)