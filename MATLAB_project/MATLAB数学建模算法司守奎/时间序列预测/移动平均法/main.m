%% һ���ƶ�ƽ����
y=[533.8 574.6 606.9 649.8 705.1 772 816.4 892.7 963.9 1015.1 1102.7];
len=length(y);
n=[4,5];%�ֱ�Ƚ�4��5λ�ƶ�ƽ��������Ч��
for i=1:length(n)
    for j=1:len-n(i)+1
        yhat{i}(j)=sum(y(j:j+n(i)-1))/n(i);
    end
    y12(i)=yhat{i}(end);
    s(i)=sqrt(mean((y(n(i)+1:end)-yhat{i}(1:end-1)).^2));
end
y12,s
