p=[];
[R3,C3]=size(X1); 
total=0;
g=1;
r=1;
n=1;
goodinvestmentdatainput=[];
goodinvestmentdataoutput=[];
riskyinvestdatainput=[];
riskyinvestdataoutput=[];
nopatterndatainput=[];
nopatterndataoutput=[];
testX=net(X1);
for j=1:C3
p=inputordercheck(:,j);
trend=testX(5,j)-X1(25,j);
total=0;
if trend>0   
for i=1:24
    sum=p(i+1)-max(p(1:i));
    if sum>0
       total=total+1;
    end
end
end
if trend<0   
for i=1:24
    sum=p(i+1)-min(p(1:i));
    if sum<0
       total=total+1;
    end
end
end
abstotal=abs(total);
if abstotal>12
 goodinvestmentdatainput(:,g)=X1(:,j);
 goodinvestmentdataoutput(:,g)=Y1(:,j);
   g=g+1;
elseif abstotal>=6
   riskyinvestdatainput(:,r)=X1(:,j);
   riskyinvestdataoutput(:,r)=Y1(:,j);
   r=r+1;
elseif abstotal<6
   nopatterndatainput(:,n)=X1(:,j);
   nopatterndataoutput(:,n)=Y1(:,j);
   n=n+1;
end
end
testgood = net(goodinvestmentdatainput);
perfgoodinvestment= mse(net,goodinvestmentdataoutput,testgood)
testrisky = net(riskyinvestdatainput);
perfriskyinvestment= mse(net,riskyinvestdataoutput,testrisky)
testnopattern = net(nopatterndatainput);
perfnopatterninvestment= mse(net,nopatterndataoutput,testnopattern)
