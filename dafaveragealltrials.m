% vars needed: nameFolds allpatientutterances allpatientpauses
% allpatientmsdelay
clear all; close all;
d = dir;
isub = [d(:).isdir]; %# returns logical vector
nameFolds = {d(isub).name}';
nameFolds(ismember(nameFolds,{'.','..'})) = [];

allpatientpauses = zeros(120,4);
allpatientutterances = zeros(120,4);
allpatientmsdelay = zeros(120,4);
[row column] = size(nameFolds);
for loopintime = 1:row
    if loopintime == 5
        continue;
    end
    curdir = nameFolds{loopintime,1};
    cd(curdir);
    disp(sprintf('entering directory: %s',curdir));
    load goodstuff;
    disp('loaded goodstuff');
    for loop = 1:length(goodstuff.voiceprobs)
        voiceprobs(loop,:) = goodstuff.voiceprobs(1,loop).voiceprobs;
        msdelay(1,loop) = goodstuff.voiceprobs(1,loop).msdelay;
        saystrings{1,loop} = goodstuff.voiceprobs(1,loop).saystring;
        %     if voiceprobs(loop,8) == 8
        %         ggprestuff(1:3,loop) = 0;
        %     else
        ggprestuff(1,loop) = goodstuff.durpauses(1,loop);
        ggprestuff(2,loop) = goodstuff.durutterances(1,loop);
        ggprestuff(3,loop) = goodstuff.voiceprobs(1,loop).msdelay;
        %end
    end
    %ggprestuff( :, ~any(ggprestuff,1) ) = [];
    matcheddelay = find(msdelay == 0);
    for loop1 = 1:length(msdelay)
        cursaystring = saystrings{1,loop1};
        matchedstr = strmatch(cursaystring,saystrings)';
        desiredindice = intersect(matchedstr,matcheddelay);
        if length(desiredindice) >= 2
            error('Found more than one instance where there is a sentence with 0 delay');
        end
        if isempty(desiredindice)
            error('Did not find any 0 delay for this sentence. Note: Have not taken out the bad trials yet.');
        end
        ggprestuff(4:5,loop1) = ggprestuff(1:2,desiredindice);
    end
    normedstuff = ggprestuff(1,:) - ggprestuff(4,:);
    normedstuff(2,:) = ggprestuff(2,:) - ggprestuff(5,:);
    normedstuff(3,:) = msdelay;
    
    badtrials = find(voiceprobs(:,8) == 8);
    if ~isempty(badtrials)
        normedstuff( :, badtrials ) = [];
    end
    
    ggstuff = normedstuff;
    goodstuff.normedggstuff = ggstuff;
    save goodstuff goodstuff
    disp('saved goodstuff');
    % accumulate each ggstuff into a new variable and then clear everything
    % except essential stuff. plot will plot down a column for both
    % variables. so need to transpose it.
    if length(ggstuff) ~=120
        ggstuff(:,end+1:120) = NaN;
    end
    
    allpatientpauses(:,loopintime) = ggstuff(1,:)';
    allpatientutterances(:,loopintime) = ggstuff(2,:)';
    allpatientmsdelay(:,loopintime) = ggstuff(3,:)';
    
    clearvars -except allpatientpauses allpatientutterances allpatientmsdelay nameFolds
    cd ..
end

allpatientgoodstuff.allpatientpauses = allpatientpauses;
allpatientgoodstuff.allpatientutterances = allpatientutterances;
allpatientgoodstuff.allpatientmsdelay = allpatientmsdelay;
save allpatientgoodstuff allpatientgoodstuff
%%
countit = 0;
for loopit = [0,50 100,200,500,1000]
    countit = countit + 1;
    mszero = allpatientmsdelay == loopit;
    avgdutt(1,countit) = mean(allpatientutterances(mszero));
    avgdutt(2,countit) = loopit;
    avgdpau(1,countit) = mean(allpatientpauses(mszero));
    avgdpau(2,countit) = loopit;
    mszero(:) = 0;
end
%plotting!!
close all;
uttfigins = figure;
uttplot = plot(allpatientmsdelay,allpatientutterances,'bs');
hold on;
plot(avgdutt(2,:),avgdutt(1,:),'-ro','LineWidth',3);
hold off;
ylabel('Duration of Utterances (s)');
xlabel('Delay (ms)');
title('All sentences (Patients)');

paufigins = figure;
pauplot = plot(allpatientmsdelay,allpatientpauses,'bs');
hold on;
plot(avgdpau(2,:),avgdpau(1,:),'-ro','LineWidth',3);
hold off;
ylabel('Duration of Pauses (s)');
xlabel('Delay (ms)');
title('All sentences (Patients)');

%saving figures and pics of figures.
hgsave(uttfigins,'normedavgdpatientsutt');
saveas(uttfigins,'normedavgdpatientsutt.png','png');
hgsave(paufigins,'normedavgdpatientpau');
saveas(paufigins,'normedavgdpatientpau.png','png');