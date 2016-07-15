%label matrix Y and graph matrix G
n=100;
k=10;
Gt=generateg(n);
G=corruptg(Gt);
Yt=generatey(k,n);
Y=corrupty(Yt);
alp = 0.2;
bta = 0.2;
p = 0.2;%corruption level
% k=size(Y,2);% no of labels
% n=size(G,1);%no of nodes
%setting H
H=zeros(k,k);
for i=1:k
    for j=1:k
        
        H(i,j) = (Y(i,:)*Y(j,:)')/(norm(Y(i,:))*norm(Y(j,:)));
    end
end
%setting Gdash
Gd = [G Y'; Y H];
%calculating graph lalpacian
D=zeros(n,n);
for i=1:n
    for j=1:n
        if i==j
            D(i,j)=sum(G(i,:));
        else
            D(i,j)=0;
        end
    end
end
L=D-G;
Q=(((1-p)^2)*(Gd*Gd'))+(p*(1-p)*(diag(diag(Gd*Gd'))));
%randomly initializing Ycap and W
Ycap=randi([0 1],size(Y));
W=randi([0 1],size(Gd));
P=(1-p)*(W*(Gd*Gd'));
Z1=inv((alp*Gd(:,1:n)*Gd(:,1:n)')/4 + bta*Q);
Z2=inv((alp*Gd(:,(n+1):end)*Gd(:,(n+1):end)')/4 + bta*Q);
Z3=L+alp*eye(n);
flag=0;
Zi=0;
count=1;
while(flag==0)
    %update rules
    count
    W((n+1):end,:)= (0.5*alp*(Ycap-Gd(:,(n+1):end)'*W(1:n,:)')*Gd(:,1:n)'+bta*P((n+1):end,:))*Z1;
    W(1:n,:)= (0.5*alp*(Ycap'-Gd(:,1:n)'*W((n+1):end,:)')*Gd(:,(n+1):end)'+bta*P(1:n,:))*Z2;
    Ycap=0.5*alp*((W((n+1):end,:)*Gd(:,1:n))+(Gd(:,(n+1):end)'*W(1:n,:)'))*Z3;
    %objective function
    Z= trace(Ycap*L*Ycap')+norm((Ycap-((W((n+1):end,:)*Gd(:,1:n)+Gd(:,(n+1):end)'*W(1:n,:)')/2)),'fro')^2+bta*(trace((W*Q*W')-2*(1-p)*(W*(Gd*Gd'))));
    if(abs(Z-Zi)<2)
        flag=1;
    end
    Zi=Z;
    count=count+1;
end
Gcap=0.5*((W(1:n,:)*Gd(:,1:n))+(Gd(:,1:n)'*W(1:n,:)'));

    






        
