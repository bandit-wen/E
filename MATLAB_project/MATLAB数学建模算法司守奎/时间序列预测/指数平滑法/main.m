%% һ��ָ��ƽ����
yt=load('dianqi.txt');
n=length(yt);
alpha=[0.2 0.5 0.8];%��ͬ��alphaֵ���Ա�
m=length(alpha);
yhat(1,1:m)=(yt(1)+yt(2))/2;%ǰ�������ݵ�ƽ��ֵ��Ϊ��ʼֵ
for i=2:n
    yhat(i,:)=alpha*yt(i-1)+(1-alpha).*yhat(i-1,:);
end
error=sqrt(mean((repmat(yt,1,m)-yhat).^2));
yhat1998=alpha*yt(n)+(1-alpha).*yhat(n,:);


