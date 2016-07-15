function [Yt] = generatey(k,n)
    Yt=randi([0 1],k,n);%Ytrue
    a=check(Yt);
    if a==1
        generatey(k,n)
    end
end