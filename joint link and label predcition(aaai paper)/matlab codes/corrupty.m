function [Yc] = corrupty(Yt)
b=size(Yt,2);
rn=randi([1 b],1,40);
Yr=Yt;
for i=1:40
    Yr(:,rn(i))=0;
end
Yc=Yr;
for i=1:4
    for j=1:25
    Yc(i,j)=0;
    end
end
nnz(Yc-Yr);
end