[R15,C15]=size(inputordercheck);
for i=1:C15
X8 = inputordercheck(:,i);
[X5,PS4(i)]=mapminmax(transpose(X8));
YF = net(transpose(X5));
YT=mapminmax('reverse',transpose(YF),PS4(i));
YR(:,i)=transpose(YT);
end
plotfornet=plotregression(outputordercheck,YR)