function[Gt]=generateg(n)
a = rand(n);
Gt = (a+a')/2>.5;
end
