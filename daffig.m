%% create daf figure for cerebellar paper
% clear all
% close all 
% hfig = openfig('/Users/zagnew/Cereb_data/stuffforpaper/daf/figures/pauses.fig');

clear all
close all 
set_params_pitchtracking;

hfig = openfig('/Users/zagnew/Cereb_data/stuffforpaper/daf/figures/pauses_meandata');

y=get(findobj(get(gca,'Children'),'type','line'),'ydata');
x=get(findobj(get(gca,'Children'),'type','line'),'xdata');
meandata_1=get(findobj(get(gca,'Children'),'type','line'), 'ydata');
meandata_2=get(findobj(get(gca,'Children'),'type','line'), 'xdata');
Data=[x' y'];

daf_data.patients_pauses=meandata_1{1,:};
daf_data.controls_pauses=meandata_1{3,:};

cd /Users/zagnew/Cereb_data/daf_data
save daf_data daf_data

%% pauses sem
close all
hfig = openfig('/Users/zagnew/Cereb_data/stuffforpaper/daf/figures/pauses_sem_data.fig');
y=get(findobj(get(gca,'Children'),'type','line'),'ydata');
x=get(findobj(get(gca,'Children'),'type','line'),'xdata');
stddata_1=get(findobj(get(gca,'Children'),'type','line'), 'ydata');
stddata_2=get(findobj(get(gca,'Children'),'type','line'), 'xdata');
Data=[x' y'];

daf_data.controls_pauses_sem=stddata_1{4,:}-stddata_1{3,:};
daf_data.patients_pauses_sem=stddata_1{2,:}-stddata_1{1,:};

controls_top=stddata_1{4,:};
controls_bottom= stddata_1{3,:};
patients_top=stddata_1{2,:};
patients_bottom=stddata_1{1,:};

%% utterances
%hfig = openfig('/Users/zagnew/Cereb_data/stuffforpaper/daf/figures/utterances.fig');
hfig = openfig('/Users/zagnew/Cereb_data/stuffforpaper/daf/figures/utterances_meandata');
y=get(findobj(get(gca,'Children'),'type','line'),'ydata');
x=get(findobj(get(gca,'Children'),'type','line'),'xdata');
meandata_utterance_1=get(findobj(get(gca,'Children'),'type','line'), 'ydata');
meandata_utterance_2=get(findobj(get(gca,'Children'),'type','line'), 'xdata');
Data=[x' y'];

daf_data.patients_utterances=meandata_utterance_1{1,:};
daf_data.controls_utterances=meandata_utterance_1{2,:};
close all
 
%% utternances sem

close
hfig = openfig('/Users/zagnew/Cereb_data/stuffforpaper/daf/figures/utterances_sem_data.fig');
y=get(findobj(get(gca,'Children'),'type','line'),'ydata');
x=get(findobj(get(gca,'Children'),'type','line'),'xdata');
stddata_utterance_1=get(findobj(get(gca,'Children'),'type','line'), 'ydata');
stddata_utterance_2=get(findobj(get(gca,'Children'),'type','line'), 'xdata');
Data=[x' y'];

controls_top=stddata_utterance_1{4,:};
controls_bottom=stddata_utterance_1{3,:};
patients_top=stddata_utterance_1{1,:};
patients_bottom=stddata_utterance_1{2,:};
daf_data.controls_utterances_sem=controls_top-controls_bottom;
daf_data.patients_utterances_sem=patients_top-patients_bottom;

save daf_data daf_data

%plot that
figure
y_pauses=[daf_data.controls_pauses;daf_data.patients_pauses];          
errY2 =[daf_data.controls_pauses_sem;daf_data.patients_pauses_sem];
      
h = barwitherr(errY2, y_pauses);% Plot with errorbars
goodplot
set(h(1),'FaceColor',up_gs,'EdgeColor', up_gs ,'LineWidth',1.2);
set(h(2),'FaceColor',bigup_gs,'EdgeColor', bigup_gs ,'LineWidth',1.2);
set(h(3),'FaceColor',flat_gs,'EdgeColor', flat_gs ,'LineWidth',1.2);
set(h(4),'FaceColor',[0.6 0.6 0.6],'EdgeColor', [0.6 0.6 0.6] ,'LineWidth',1.2);
set(h(5),'FaceColor',down_gs,'EdgeColor', down_gs ,'LineWidth',1.2);
set(h(6),'FaceColor',bigdown_gs,'EdgeColor', bigdown_gs ,'LineWidth',1.2);

set(gca,'XTickLabel',{'Controls','Patients'})
%legend('0ms','50ms','100ms', '200ms','500ms', '1000ms');
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/Pauses_bar_final.pdf');

% plot utterances
figure
y_utterances=[daf_data.controls_utterances;daf_data.patients_utterances];          
errY2 =[daf_data.controls_utterances_sem;daf_data.patients_utterances_sem];
      
h = barwitherr(errY2, y_utterances);% Plot with errorbars
goodplot
set(h(1),'FaceColor',up_gs,'EdgeColor', up_gs ,'LineWidth',1.2);
set(h(2),'FaceColor',bigup_gs,'EdgeColor', bigup_gs ,'LineWidth',1.2);
set(h(3),'FaceColor',flat_gs,'EdgeColor', flat_gs ,'LineWidth',1.2);
set(h(4),'FaceColor',[0.6 0.6 0.6],'EdgeColor', [0.6 0.6 0.6] ,'LineWidth',1.2);
set(h(5),'FaceColor',down_gs,'EdgeColor', down_gs ,'LineWidth',1.2);
set(h(6),'FaceColor',bigdown_gs,'EdgeColor', bigdown_gs ,'LineWidth',1.2);

set(gca,'XTickLabel',{'Controls','Patients'})
legend('0ms','50ms','100ms', '200ms','500ms', '1000ms');
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/Utterances_bar_final.pdf');








