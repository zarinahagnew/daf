y=randn(30,80); 
x=1:size(y,2);
shadedErrorBar(x,mean(y,1),std(y),'g');
shadedErrorBar(x,y,{@median,@std},{'r-o','markerfacecolor','r'});    
shadedErrorBar([],y,{@median,@std},{'r-o','markerfacecolor','r'});    

Overlay two transparent lines
y=randn(30,80)*10; x=(1:size(y,2))-40;
shadedErrorBar(x,y,{@mean,@std},'-r',1); 
hold on
y=ones(30,1)*x; y=y+0.06*y.^2+randn(size(y))*10;
shadedErrorBar(x,y,{@mean,@std},'-b',1); 
hold off

