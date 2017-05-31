close all; close all hidden;

allpatientutterances = allpatientgoodstuff.allpatientutterances;
allpatientpauses = allpatientgoodstuff.allpatientpauses;
allpatientmsdelay = allpatientgoodstuff.allpatientmsdelay;

allcontrolutterances = allcontrolgoodstuff.allcontrolutterances;
allcontrolpauses = allcontrolgoodstuff.allcontrolpauses;
allcontrolmsdelay = allcontrolgoodstuff.allcontrolmsdelay;
newvar1 = allcontrolmsdelay(:);
newvar2 = allcontrolutterances(:);
newvar3 = allcontrolpauses(:);

newvar4 = allpatientutterances(:);
newvar5 = allpatientpauses(:);
newvar6 = allpatientmsdelay(:);

newvar7 = [newvar2 newvar3 newvar1];
newvar7(:,4) = 1;
newvar8 = [newvar4 newvar5 newvar6];
newvar8(:,4) = 2;

newvar9 = vertcat(newvar7,newvar8);

[pnew,table,stats,terms] = anovan(newvar9(:,1),{newvar9(:,3) newvar9(:,4)},'model',2,'varnames',{'MsDelay';'SubjType'});
[c,m,h,gnames] = multcompare(stats);
% 
% [gnames num2cell(c)]