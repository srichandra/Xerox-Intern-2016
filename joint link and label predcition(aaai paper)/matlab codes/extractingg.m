a=dlmread('com-lj.ungraph.txt','\t',4,0);
G=zeros(1000,1000);
for i=1:100000
    if a(i,2)<1000
        G((a(i,1)+1),(a(i,2)+1))=1;
        G((a(i,2)+1),(a(i,1)+1))=1;
    end
end
