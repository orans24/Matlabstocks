X=X1;
T=Y1;
p=[];
[R3,C3]=size(X1); 
net = fitnet(25);
[net,tr] = trainscg(net,X,T);
run('NETREGRATION.m');
run('mseerors.m');

