%run('inputsortorder.m');
%run('outputsortorder.m');
%run('NETBIGDATA.m');
%run('apiconnection.m');
g=1;
r=1;
n=1;
j=1;
p=[];
newstockshighrisk=[];
goodinvestment=[];
riskyinvestment=[];
nopatterninvestment=[];
[R3,C3]=size(stockprediction);
for j=1:C3
X3=transpose(stockprediction(:,j));
[stocktocheckt,PS2]=mapminmax(X3);
stocktocheck=transpose(stocktocheckt);
nextstocks1=net(stocktocheck);
nextstocks2=mapminmax('reverse', transpose(nextstocks1),PS2);
nextstocks=transpose(nextstocks2);
p=stockprediction(:,j); 
precent=((nextstocks(5)/p(25))*100-100);
if precent>0   
    total=0;
for i=1:24
    sum=p(i+1)-max(p(1:i));
    if sum>0
       total=total+1;
    end
end
end
if precent<0   
    total=0;
for i=1:24
    sum=p(i+1)-min(p(1:i));
    if sum<0
       total=total+1;
    end
end
end
abstotal=abs(total);
if abstotal>12
    goodinvestment(1:5,g)=nextstocks;
    goodinvestment(6,g)=precent;
    goodinvestment(7,g)=j;
    g=g+1;
elseif abstotal>=6
   riskyinvestment(1:5,r)=nextstocks;
   riskyinvestment(6,r)=precent;
   riskyinvestment(7,r)=j;
   r=r+1;
elseif abstotal<6
   nopatterninvestment(1:5,n)=nextstocks;
   nopatterninvestment(6,n)=precent;
   nopatterninvestment(7,n)=j;
   n=n+1;
end
end 
openvar('symbols')
openvar('stockprediction')
openvar('riskyinvestment')
openvar('goodinvestment')
openvar('nopatterninvestment')



   

    
    
    
    





