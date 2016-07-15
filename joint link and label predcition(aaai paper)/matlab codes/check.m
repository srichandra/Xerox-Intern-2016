function [flag]= check(Yt)
    flag=0;
    for i=1:size(Yt,2)
    if sum(Yt(:,i))==0
        flag=1;
    end
    end
end