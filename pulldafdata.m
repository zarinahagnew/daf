close all
clear all
set_params_pitchtracking;
set(0,'DefaultFigureWindowStyle','docked');
uiopen('/Users/zagnew/Cereb_data/stuffforpaper/daf/figures/utterances.fig',1)

D_utt=get(gca,'Children'); %get the handle of the line object
XData_utt=get(D_utt,'XData'); %get the x data
YData_utt=get(D_utt,'YData'); %get the y data
Data_utt=[XData_utt' YData_utt']; %join the x and y data on one array nx2

% pat_colour
% hc_colour

figure
title('utterances')
plot(YData_utt{1},'Color',[0.1 0.1 0.4],'LineWidth',0.5)                   %patients upper bound
hold on
plot(YData_utt{2},'Color',[0.1 0.1 0.4],'LineWidth',0.5)                   %patients lower bound
plot(YData_utt{3},'Color',[0.8 0 0.2])                                     %controls mean data
plot(YData_utt{4},'Color',[0.8 0 0.2])                                     %controls upper bound
plot(YData_utt{5},'Color',[0.1 0.1 0.4],'LineWidth',2)                     % patients mean data
plot(YData_utt{6},'Color',[0.8 0 0.2],'LineWidth',2)                       %controls lower bound
goodplot

figure
plot(YData_utt{1}, 'b')
hold on
plot(YData_utt{2},'m')
plot(YData_utt{3},'y')
plot(YData_utt{4},'g')
plot(YData_utt{5},'r')
plot(YData_utt{6},'k')
goodplot


%patients (top lines)
dafdata.patient_utterance_mean=YData_utt{5};
dafdata.patient_utterance_sem=YData_utt{1}-YData_utt{5};
dafdata.control_utterance_mean=YData_utt{6};
dafdata.control_utterance_sem=YData_utt{4}-YData_utt{6};

save dafdata_utterances dafdata 
close all

%% pauses
%uiopen('/Users/zagnew/Cereb_data/stuffforpaper/daf/normedavgdpau.fig',1)
uiopen('/Users/zagnew/Cereb_data/stuffforpaper/daf/figures/pauses.fig',1)

D_pause=get(gca,'Children'); %get the handle of the line object
pauseXData=get(D_pause,'XData'); %get the x data
pauseYData=get(D_pause,'YData'); %get the y data
Datapause=[pauseXData' pauseYData']; %join the x and y data on one array nx2

uiopen('/Users/zagnew/Cereb_data/stuffforpaper/daf/figures/pauses_meandata.fig',1)
D_pause2=get(gca,'Children'); %get the handle of the line object
pauseXData2=get(D_pause2,'XData'); %get the x data
pauseYData2=get(D_pause2,'YData'); %get the y data
Datapause2=[pauseXData2' pauseYData2']; %join the x and y data on one array nx2
close all

figure
plot(pauseYData{1},'b')
hold on
plot(pauseYData{2},'m')
plot(pauseYData{3},'y')
plot(pauseYData{4},'g')
plot(pauseYData{5},'r')
plot(pauseYData2{3},'k')

dafdata.control_pause_mean=pauseYData2{3};
dafdata.control_pause_sem=pauseYData{5}-pauseYData2{3};

dafdata.patient_pause_mean=pauseYData{2};
dafdata.patient_pause_sem=pauseYData{3}-pauseYData{2};


%% save this
cd /Users/zagnew/Cereb_data/stuffforpaper/daf
save dafdata_pauses dafdata
