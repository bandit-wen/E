%% һ�ײ��ָ��ƽ����
yt=load('ranliao.txt');
n=length(yt);
alpha=0.4;
dyt=diff(yt);%��ǰ��һ�ײ��
dyt=[0;dyt];
dyhat(2)=dyt(2);
for i=2:n
    dyhat(i+1)=alpha*dyt(i)+(1-alpha)*dyhat(i);
end
for i=1:n
    yhat(i+1)=alpha*dyhat(i+1)+yt(i);
end

