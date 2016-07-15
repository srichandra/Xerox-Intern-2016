b=xlsread('new1.xlsx');
y=zeros(1,1000);
for i=1:size(b,1)
    for j=1:size(b(i))
        if b(i,j)<1000
            y(b(i,j))=i;
        end
    end
end
