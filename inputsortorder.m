j=1;
k=1;
n=1;
load('DATABASE.mat','inputnotorder');
[R1,C1]=size(inputnotorder);
while n<=C1
    for i=1:R1
        if inputnotorder(i+24,n) == 0
                n=n+1;

           break
        end
        inputordercheck(j:j+24,k)=inputnotorder(i:i+24,n); 
           X2=transpose(inputordercheck(:,k));
           [X5,PS(k)]=mapminmax(X2);
            X1(:,k)=transpose(X5);
            k=k+1;
           j=1;
           
    end
    
    
end


               
            
        
        
    
        
      
   
    