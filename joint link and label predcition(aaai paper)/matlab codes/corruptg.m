function[Gc] = corruptg(Gt)
a=size(Gt,1);
rn=randi([1 a],1,15);
Gc=Gt;
for i=1:size(rn,1)
    for j=1:35
         Gc(rn(i),j)=0;
         Gc(i,rn(i))=0;
    end
end
nnz(Gc-Gt);
end
