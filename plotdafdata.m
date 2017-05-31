%% daf data already pulled from pulldafdata.m and stored here: 
clear all
cd /Users/zagnew/Cereb_data/stuffforpaper/daf

load dafdata_pauses.mat
load dafdata_utterances.mat

%% plot this
figure
subplot(121)
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Utterances', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
plot(dafdata.patient_utterance_mean,'Color',[0.1 0.1 0.4],'LineWidth',2)                   %patients upper bound
hold on
plot(dafdata.patient_utterance_mean+dafdata.control_utterance_sem,'Color',[0.1 0.1 0.4],'LineWidth',0.5)                   %patients lower bound
plot(dafdata.patient_utterance_mean-dafdata.control_utterance_sem,'Color',[0.1 0.1 0.4],'LineWidth',0.5)                   %patients lower bound
plot(dafdata.control_utterance_mean,'Color',[0.8 0 0.2],'LineWidth',2)                   %patients upper bound
plot(dafdata.control_utterance_mean+dafdata.control_utterance_sem,'Color',[0.8 0 0.2],'LineWidth',0.5)                   %patients lower bound
plot(dafdata.control_utterance_mean-dafdata.control_utterance_sem,'Color',[0.8 0 0.2],'LineWidth',0.5)                   %patients lower bound
goodplot
axis([1 6 -0.1 0.7])
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/daf_data_line_utteranecs.pdf');


subplot(122)
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Pauses', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
plot(dafdata.patient_pause_mean,'Color',[0.1 0.1 0.4],'LineWidth',2)                   %patients upper bound
hold on
plot(dafdata.patient_pause_mean+dafdata.control_pause_sem,'Color',[0.1 0.1 0.4],'LineWidth',0.5)                   %patients lower bound
plot(dafdata.patient_pause_mean-dafdata.control_pause_sem,'Color',[0.1 0.1 0.4],'LineWidth',0.5)                   %patients lower bound
plot(dafdata.control_pause_mean,'Color',[0.8 0 0.2],'LineWidth',2)                   %patients upper bound
plot(dafdata.control_pause_mean+dafdata.control_pause_sem,'Color',[0.8 0 0.2],'LineWidth',0.5)                   %patients lower bound
plot(dafdata.control_pause_mean-dafdata.control_pause_sem,'Color',[0.8 0 0.2],'LineWidth',0.5)                   %patients lower bound
goodplot
axis([1 6 -0.1 0.7])

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/daf_data_line_pause.pdf');


%% Overlay two transparent lines
figure
subplot(121)
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Utterances', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')

x=1:size(dafdata.patient_utterance_mean,2);
shadedErrorBar(x,dafdata.patient_utterance_mean, dafdata.patient_utterance_sem,{'-','LineWidth', 1.5,'color',[0.1 0.1 0.4]});
hold on
shadedErrorBar(x,dafdata.control_utterance_mean, dafdata.control_utterance_sem,{'-','LineWidth', 1.5,'color',[0.8 0 0.2]});
axis([1 6 -0.1 0.7])
goodplot_wide

subplot(122)
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Utterances', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')

x=1:size(dafdata.patient_utterance_mean,2);
shadedErrorBar(x,dafdata.control_pause_mean, dafdata.control_pause_sem,{'-','LineWidth', 1.5,'color',[0.8 0 0.2]});
hold on
shadedErrorBar(x,dafdata.patient_pause_mean, dafdata.patient_pause_sem,{'-','LineWidth', 1.5, 'color',[0.1 0.1 0.4]});
goodplot_wide
axis([1 6 -0.1 0.7])

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/daf_data_line_pause.pdf');







% figure
% subplot(211)
% whitebg('white')
% annotation('textbox', [0 0.9 1 0.1], ...
%     'String', 'pauses', ...
%     'EdgeColor', 'none', ...
%     'HorizontalAlignment', 'center')
% y_pitch2=[dafdata.control_pause_mean(2:6) ; dafdata.patient_pause_mean(2:6)];
% errY2 = [dafdata.control_pause_sem(2:6) ; dafdata.patient_pause_sem(2:6)];
% 
% h = barwitherr(errY2, y_pitch2);% Plot with errorbars
% set(gca,'XTickLabel',{'Controls','Patients'})
% ylabel('pauses')
% set(h(1),'FaceColor',masked_colour,'EdgeColor', masked_colour ,'LineWidth',1.5);
% set(h(2),'FaceColor',flat_gs,'EdgeColor', flat_gs ,'LineWidth',1.5);
% set(h(3),'FaceColor',standardgrey,'EdgeColor', standardgrey ,'LineWidth',1.5);
% set(h(4),'FaceColor',down_gs,'EdgeColor', down_gs ,'LineWidth',1.5);
% set(h(5),'FaceColor',bigdown_gs,'EdgeColor', bigdown_gs ,'LineWidth',1.5);
% goodplot
% axis([0 3 -0.2 0.6])
% legend('50ms', '100ms', '200ms', '500ms', '1000ms','Location','NorthEastOutside')
% 
% subplot(212)
% whitebg('white')
% y_pitch2utterance=[dafdata.control_utterance_mean(2:6) ; dafdata.patient_utterance_mean(2:6)];
% errY2utterance = [dafdata.control_utterance_sem(2:6) ; dafdata.patient_utterance_sem(2:6)];
% 
% h = barwitherr(errY2utterance, y_pitch2utterance);
% set(gca,'XTickLabel',{'Controls','Patients'})
% ylabel('pauses')
% set(h(1),'FaceColor',masked_colour,'EdgeColor', masked_colour ,'LineWidth',1.5);
% set(h(2),'FaceColor',flat_gs,'EdgeColor', flat_gs ,'LineWidth',1.5);
% set(h(3),'FaceColor',standardgrey,'EdgeColor', standardgrey ,'LineWidth',1.5);
% set(h(4),'FaceColor',down_gs,'EdgeColor', down_gs ,'LineWidth',1.5);
% set(h(5),'FaceColor',bigdown_gs,'EdgeColor', bigdown_gs ,'LineWidth',1.5);
% goodplot
% axis([0 3 -0.2 0.6])
% legend('50ms', '100ms', '200ms', '500ms', '1000ms','Location','NorthEastOutside')
% print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/daf_data.pdf');


%% anova1
anovandata_daf_utt=[dafdata.control_utterance_mean(2:5) dafdata.patient_utterance_mean(2:5)];       
anovandata_daf_pause=[dafdata.control_pause_mean(2:5) dafdata.patient_pause_mean(2:5)];       

[p,tbl] = anova1(anovandata_daf_utt,group,'off')
dafstats.utter.Fstat = tbl{2,5}
dafstats.utter.pvalue = tbl{2,6}

[p,tbl] = anova1(anovandata_daf_pause,group,'off')
dafstats.pause.Fstat = tbl{2,5}
dafstats.pause.pvalue = tbl{2,6}

%% anovan

anovandata_daf_utt=[dafdata.control_utterance_mean(2:5) dafdata.patient_utterance_mean(2:5)];       
anovandata_daf_pause=[dafdata.control_pause_mean(2:5) dafdata.patient_pause_mean(2:5)];       

group=[1 1 1 1 2 2 2 2];
condition=[1 2 3 4 1 2 3 4];

dafdataanova.utterances.group1=[group];
dafdataanova.utterances.group2=[condition];
dafdataanova.pauses.group1=[group];
dafdataanova.pauses.group2=[condition];

% utterances anova
% 'model',3,'varnames',{'group','condition'})
[dafdataanova.utterances.p_full,dafdataanova.utterances.table,dafdataanova.utterances.stats,dafdataanova.utterances.terms] = ...
    anovan(anovandata_daf_utt,{dafdataanova.utterances.group1 dafdataanova.utterances.group2},'model','full','varnames',{'group','condition'})

% [dafdataanova.utterances.p_full,dafdataanova.utterances.table,dafdataanova.utterances.stats,dafdataanova.utterances.terms] = ...
%     anovan(anovandata_daf_pause,{dafdataanova.utterances.group1 dafdataanova.utterances.group2},'model',2,'varnames',{'group','condition'})
% 
% [dafdataanova.utterances.p_full,dafdataanova.utterances.table,dafdataanova.utterances.stats,dafdataanova.utterances.terms] = ...
%     anovan(anovandata_daf_pause,{dafdataanova.utterances.group1 dafdataanova.utterances.group2},'model',1,'varnames',{'group','condition'})
% 
% [dafdataanova.utterances.p_full,dafdataanova.utterances.table,dafdataanova.utterances.stats,dafdataanova.utterances.terms] = ...
%     anovan(anovandata_daf_pause,{dafdataanova.utterances.group1 dafdataanova.utterances.group2},'model',3,'varnames',{'group','condition'})

% [dafdataanova.utterances.linear.p_full,dafdataanova.utterances.linear.table,dafdataanova.utterances.linear.stats,dafdataanova.utterances.linear.terms] = ...
%      anovan(anovandata_daf_pause,{dafdataanova.linear.group1 dafdataanova.interaction.group},'model','linear','varnames',{'group','condition'})
% or 'model',2,
[dafdataanova.pauses.p_full,dafdataanova.pauses.table,dafdataanova.pauses.stats,dafdataanova.pauses.terms] = ...
    anovan(anovandata_daf_pause,{dafdataanova.pauses.group1 dafdataanova.pauses.group2},'model','full','varnames',{'group','condition'})


% [dafdataanova.interaction.interaction,dafdataanova.interaction.table,dafdataanova.interaction.stats,dafdataanova.interaction.terms] = ...
%     anovan(anovandata_daf_pause,{dafdataanova.interaction.group1 dafdataanova.interaction.group2},'model','interaction','varnames',{'group','condition'})


% pause
% % or 'model',1,
 [dafdataanova.pauses.linear,dafdataanova.pauses.table,dafdataanova.pauses.stats,dafdataanova.pauses.terms] = ...
     anovan(anovandata_daf_pause,{dafdataanova.pauses.group1 dafdataanova.pauses.group},'model','linear','varnames',{'group','condition'})

% or 'model',2,
[dafdataanova.pauses.p_full,dafdataanova.pauses.table,dafdataanova.pauses.stats,dafdataanova.pauses.terms] = ...
    anovan(anovandata_daf_pause,{dafdataanova.pauses.group1 dafdataanova.pauses.group2},'model','full','varnames',{'group','condition'})


[dafdataanova.pauses.interaction,dafdataanova.pauses.table,dafdataanova.pauses.stats,dafdataanova.pauses.terms] = ...
    anovan(anovandata_daf_pause,{dafdataanova.pauses.group1 dafdataanova.pauses.group2},'model','interaction','varnames',{'group','condition'})



% or 'model',3,
% [dafdataanova.pauses.p_full,dafdataanova.pauses.table,dafdataanova.pauses.stats,dafdataanova.pauses.terms] = ...
%     anovan(anovandata_daf_utt,{dafdataanova.group1 dafdataanova.group2},'model','random','varnames',{'group','condition'}) 
% [dafdataanova.pauses.p_full,dafdataanova.pauses.table,dafdataanova.pauses.stats,dafdataanova.pauses.terms] = ...
%     anovan(anovandata_daf_utt,{dafdataanova.group1 dafdataanova.group2},'model',3,'varnames',{'group','condition'})


save /Users/zagnew/Cereb_data/data_final_run/GroupData/stats/dafdataanova dafdataanova

[dafdataanova_full.p_full,dafdataanova.table,dafdataanova_full.stats,dafdataanova_full.terms] = anovan(anovandata_daf_utt,{dafdataanova.group1 dafdataanova.group2}, 'full')

display 'second anova is the full model'




%% for R
% anovandata_daf_utt
% anovandata_daf_pause

