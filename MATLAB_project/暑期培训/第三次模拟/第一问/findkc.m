function [res,kucun,maxe]=findkc(e,p)
res=zeros(30,1);
res=e*p';%30*8,30��30����棬8�ǰ˸�����
res=res(1:10,:);
maxe=max(res);
kucun=zeros(1,8);
for i=1:8
    kucun(i)=find(res(:,i)==maxe(i))-1;
end