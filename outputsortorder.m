n=1;
j=1;
load('DATABASE.mat','outputnotorder');
[R2,C2]=size(outputnotorder);
while n<=C2
    for i=26:1:R2
         
       if outputnotorder(i+4,n) == 0
             n=n+1;
           break
       end
           outputordercheck(1,j)=outputnotorder(i,n);
           outputordercheck(2,j)=outputnotorder(i+1,n);
           outputordercheck(3,j)=outputnotorder(i+2,n);
           outputordercheck(4,j)=outputnotorder(i+3,n);
           outputordercheck(5,j)=outputnotorder(i+4,n);
           Y2=transpose(outputordercheck(:,j));
           Y5=mapminmax('apply',Y2,PS(j));
           Y1(:,j)=transpose(Y5);
           j=j+1;
    end
   
   
end