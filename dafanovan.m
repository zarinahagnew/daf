close all;
clear p1;
counter = 0;
for loop = [50,100,200,500,1000]
    counter = counter + 1;
    newvar1 = allcontrolmsdelay == loop;
    newvar2 = allcontrolutterances(newvar1)';
    newvar21 = allcontrolpauses(newvar1)';
    
    newvar2(2,:) = 1;
    newvar21(2,:) = 1;
    
    newvar3 = allpatientmsdelay == loop;
    newvar4 = allpatientutterances(newvar3)';
    newvar41 = allpatientpauses(newvar3)';
    newvar4(2,:) = 2;
    newvar41(2,:) = 2;
    newvar5 = [newvar2 newvar4];
    newvar51 = [newvar21 newvar41];
    
    p1(1,counter)= anovan(newvar5(1,:),{newvar5(2,:)});
    p1(2,counter)= anovan(newvar51(1,:),{newvar51(2,:)});
end