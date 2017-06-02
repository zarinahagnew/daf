%% group data 
cd /Users/zagnew/Cereb_data/stuffforpaper/daf

z_colours;
load allcontrolgoodstuff.mat
load allpatientgoodstuff.mat

% these contain all the individual trials for each subject.  

% allpatientpauses: [120x16 double]
% allpatientutterances: [120x16 double]
% allpatientmsdelay: [120x16 double],  
% so the structure has three fields with the names shown.

% Thus allpatientgoodstuff.allpatientpauses is an array 
% 120 trials x 16 patients, with the mean interutterance pause,
% relative to 0ms DAF, for each trial that each subject did, 

% whereas allpatientgoodstuff.allpatientutterances is an array 
% 120 trials x 16 patients, with the mean utterance duration, 
% relative to 0ms DAF, for each trial that each subject did. 

% Finally allpatientgoodstuff.allpatientmsdelay
% is an array 120 trials x 16 patients, 
% with the auditory feedback delay experienced on each trial 
% that each subject did.

% So if you wanted the indexes of the trials where subject 5 experienced 200ms DAF
% you'd say subj5daf200trials = find(allpatientgoodstuff.allpatientmsdelay(:,5) == 200);, 
% and then if you wanted the mean interutterance pause produced by subject 5 under 200ms DAF,
% you'd say subj5daf200meanpause = mean(allpatientgoodstuff.allpatientpauses(subj5daf200trials,5));, 
% and you could also feed this data to anovan() if you wanted statistics.


for isubj=1:16
sub_cond(isubj,:)=allpatientgoodstuff.allpatientmsdelay(:,isubj)'
end

%%patients
for ipat=1:16

pat_50{ipat,:} = find(allpatientgoodstuff.allpatientmsdelay(:,ipat) == 50)';
pat_50meanpause(ipat)= nanmean(allpatientgoodstuff.allpatientpauses(pat_50{ipat,:}))';

pat_100{ipat,:} = find(allpatientgoodstuff.allpatientmsdelay(:,ipat) == 100)';
pat_100meanpause(ipat)= nanmean(allpatientgoodstuff.allpatientpauses(pat_100{ipat,:}))';
      
pat_200{ipat,:} = find(allpatientgoodstuff.allpatientmsdelay(:,ipat) == 200)';
pat_200meanpause(ipat)= nanmean(allpatientgoodstuff.allpatientpauses(pat_200{ipat,:}))';

pat_500{ipat,:} = find(allpatientgoodstuff.allpatientmsdelay(:,ipat) == 500)';
pat_500meanpause(ipat)= nanmean(allpatientgoodstuff.allpatientpauses(pat_500{ipat,:}))'
      
pat_1000{ipat,:} = find(allpatientgoodstuff.allpatientmsdelay(:,ipat) == 1000)';
pat_1000meanpause(ipat)= nanmean(allpatientgoodstuff.allpatientpauses(pat_1000{ipat,:}))';

pat_50_utt{ipat,:} = find(allpatientgoodstuff.allpatientmsdelay(:,ipat) == 50)';
pat_50meanutterance(ipat)= nanmean(allpatientgoodstuff.allpatientutterances(pat_50_utt{ipat,:}))';

pat_100_utt{ipat,:} = find(allpatientgoodstuff.allpatientmsdelay(:,ipat) == 100)';
pat_100meanutterance(ipat)= nanmean(allpatientgoodstuff.allpatientutterances(pat_100_utt{ipat,:}))';
      
pat_200_utt{ipat,:} = find(allpatientgoodstuff.allpatientmsdelay(:,ipat) == 200)';
pat_200meanutterance(ipat)= nanmean(allpatientgoodstuff.allpatientutterances(pat_200_utt{ipat,:}))';

pat_500_utt{ipat,:} = find(allpatientgoodstuff.allpatientmsdelay(:,ipat) == 500)';
pat_500meanutterance(ipat)= nanmean(allpatientgoodstuff.allpatientutterances(pat_500_utt{ipat,:}))';
      
pat_1000_utt{ipat,:} = find(allpatientgoodstuff.allpatientmsdelay(:,ipat) == 1000)';
pat_1000meanutterance(ipat)= nanmean(allpatientgoodstuff.allpatientutterances(pat_1000_utt{ipat,:}))';

end


%% controls
for isubj=1:10
control_50{isubj,:} = find(allcontrolgoodstuff.allcontrolmsdelay(:,isubj) == 50)';
control_50meanpause(isubj)= nanmean(allcontrolgoodstuff.allcontrolpauses(control_50{isubj,:}))';

control_100{isubj,:} = find(allcontrolgoodstuff.allcontrolmsdelay(:,isubj) == 100)';
control_100meanpause(isubj)= nanmean(allcontrolgoodstuff.allcontrolpauses(control_100{isubj,:}))';
      
control_200{isubj,:} = find(allcontrolgoodstuff.allcontrolmsdelay(:,isubj) == 200)';
control_200meanpause(isubj)= nanmean(allcontrolgoodstuff.allcontrolpauses(control_200{isubj,:}))';

control_500{isubj,:} = find(allcontrolgoodstuff.allcontrolmsdelay(:,isubj) == 500)';
control_500meanpause(isubj)= nanmean(allcontrolgoodstuff.allcontrolpauses(control_500{isubj,:}))'
      
control_1000{isubj,:} = find(allcontrolgoodstuff.allcontrolmsdelay(:,isubj) == 1000)';
control_1000meanpause(isubj)= nanmean(allcontrolgoodstuff.allcontrolpauses(control_1000{isubj,:}))';

control_50_utt{isubj,:} = find(allcontrolgoodstuff.allcontrolmsdelay(:,isubj) == 50)';
control_50meanutterance(isubj)= nanmean(allcontrolgoodstuff.allcontrolutterances(control_50_utt{isubj,:}))';

control_100_utt{isubj,:} = find(allcontrolgoodstuff.allcontrolmsdelay(:,isubj) == 100)';
control_100meanutterance(isubj)= nanmean(allcontrolgoodstuff.allcontrolutterances(control_100_utt{isubj,:}))';
      
control_200_utt{isubj,:} = find(allcontrolgoodstuff.allcontrolmsdelay(:,isubj) == 200)';
control_200meanutterance(isubj)= nanmean(allcontrolgoodstuff.allcontrolutterances(control_200_utt{isubj,:}))';

control_500_utt{isubj,:} = find(allcontrolgoodstuff.allcontrolmsdelay(:,isubj) == 500)';
control_500meanutterance(isubj)= nanmean(allcontrolgoodstuff.allcontrolutterances(control_500_utt{isubj,:}))';
      
control_1000_utt{isubj,:} = find(allcontrolgoodstuff.allcontrolmsdelay(:,isubj) == 1000)';
control_1000meanutterance(isubj)= nanmean(allcontrolgoodstuff.allcontrolutterances(control_1000_utt{isubj,:}))';

end 

%% plots

figure
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'daf pauses', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
y_pitch2=[nanmean(pat_50meanpause) nanmean(pat_100meanpause) nanmean(pat_200meanpause) nanmean(pat_500meanpause) nanmean(pat_1000meanpause) ; ...
    nanmean(control_50meanpause) nanmean(control_100meanpause) nanmean(control_200meanpause) nanmean(control_500meanpause) nanmean(control_1000meanpause) ];
errY2 = [nanstd(pat_50meanpause) nanstd(pat_100meanpause) nanstd(pat_200meanpause) nanstd(pat_500meanpause) nanstd(pat_1000meanpause) ; ...
    nanstd(control_50meanpause) nanstd(control_100meanpause) nanstd(control_200meanpause) nanstd(control_500meanpause) nanstd(control_1000meanpause) ];

h = barwitherr(errY2, y_pitch2);% Plot with errorbars

set(gca,'XTickLabel',{'Patients','Controls'})
ylabel('DAF pause length')
set(h(1),'FaceColor',clear_colour,'EdgeColor', clear_colour ,'LineWidth',1.5);
set(h(2),'FaceColor',masked_colour,'EdgeColor', masked_colour ,'LineWidth',1.5);
set(h(3),'FaceColor',standardgrey,'EdgeColor', standardgrey ,'LineWidth',1.5);
set(h(4),'FaceColor',down_gs,'EdgeColor', down_gs ,'LineWidth',1.5);
set(h(5),'FaceColor',palegrey,'EdgeColor', palegrey ,'LineWidth',1.5);
goodplot

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/stuffforpaper/daf/figures/daf_pauses.pdf');


% utterances
figure
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'daf utterances', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
y_pitch2=[nanmean(pat_50meanutterance) nanmean(pat_100meanutterance) nanmean(pat_200meanutterance) nanmean(pat_500meanutterance) nanmean(pat_1000meanutterance) ; ...
    nanmean(control_50meanutterance) nanmean(control_100meanutterance) nanmean(control_200meanutterance) nanmean(control_500meanutterance) nanmean(control_1000meanutterance) ];
errY2 = [nanstd(pat_50meanutterance) nanstd(pat_100meanutterance) nanstd(pat_200meanutterance) nanstd(pat_500meanutterance) nanstd(pat_1000meanutterance) ; ...
    nanstd(control_50meanutterance) nanstd(control_100meanutterance) nanstd(control_200meanutterance) nanstd(control_500meanutterance) nanstd(control_1000meanutterance) ];

h = barwitherr(errY2, y_pitch2);% Plot with errorbars

set(gca,'XTickLabel',{'Patients','Controls'})
ylabel('DAF utterance length')
set(h(1),'FaceColor',clear_colour,'EdgeColor', clear_colour ,'LineWidth',1.5);
set(h(2),'FaceColor',masked_colour,'EdgeColor', masked_colour ,'LineWidth',1.5);
set(h(3),'FaceColor',standardgrey,'EdgeColor', standardgrey ,'LineWidth',1.5);
set(h(4),'FaceColor',down_gs,'EdgeColor', down_gs ,'LineWidth',1.5);
set(h(5),'FaceColor',palegrey,'EdgeColor', palegrey ,'LineWidth',1.5);
goodplot
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/stuffforpaper/daf/figures/daf_utterances.pdf');




%% anova
daf_anova_data_pause= [pat_50meanpause pat_100meanpause pat_200meanpause pat_500meanpause pat_1000meanpause control_50meanpause control_100meanpause control_200meanpause control_500meanpause control_1000meanpause];
daf_anova_data_utternace= [pat_50meanutterance pat_100meanutterance pat_200meanutterance pat_500meanutterance pat_1000meanutterance control_50meanutterance control_100meanutterance control_200meanutterance control_500meanutterance control_1000meanutterance];
group=[ones(1, 80) (ones(1, 50)*2)]
condition=[ones(1, 16) (ones(1, 16)*2) (ones(1, 16)*3) (ones(1, 16)*4) (ones(1, 16)*5) ones(1, 10) (ones(1, 10)*2) (ones(1, 10)*3) (ones(1, 10)*4) (ones(1, 10)*5)]

group1=[group];
group2=[condition];

[p,tbl,stats] = anovan(daf_anova_data_pause,{group1 group2 },'model','interaction', 'varnames',{'group','condition',})
[p,tbl,stats] = anovan(daf_anova_data_utterance,{group1 group2 },'model','interaction', 'varnames',{'group','condition',})


subj5daf200trials = find(allpatientgoodstuff.allpatientmsdelay(:,5) == 200)
subj5daf200meanpause = nanmean(allpatientgoodstuff.allpatientpauses(subj5daf200trials,5))



