startdate='2020-12-03';
enddate='2021-01-09';
symbol='NIO,PLUG';
stockprediction=[];
url=['http://api.marketstack.com/v1/eod?access_key=f4237b94a05e71eab343e0983e2317d3&symbols=' symbol '&sort=ASC&date_from=' startdate '&date_to=' enddate];
newstockstocheck2=webread(url);
newstockstocheck=newstockstocheck2.data;
[R6,C6]=size(newstockstocheck);
j=1;
k=1;
n=1;
symbols=split(symbol,',');
for q =1:length(symbols)
    s=symbols(q);
    for i=1:R6
        if strcmp(newstockstocheck(i).symbol,s)
            stockprediction(n,k)=newstockstocheck(i).close;
            n=n+1;
        end
    end
    
    k=k+1;
    n=1;
end

           
    
    

