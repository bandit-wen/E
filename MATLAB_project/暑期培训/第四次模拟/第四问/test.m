close
clear
clc
[num,txt,raw]=xlsread('sh.xlsx');
for i=1:30
    data(i*16-15:i*16,:)=num(i*19-18:i*19-3,:);
end
%% ��30������ݷֱ����
res=[];
for i=1:30
    res(i,:)=sum(data(i*16-15:i*16,:));
end
x=res(:,1);
y=res(:,2);
x=sort(x)';
x=x(:,1:29);
y=sort(y,'descend')';
y=y(:,2:30);
plot(x,y,'*');
%% ���1
a0=[-0.001649 83.71 -8.524e+05];%����ϲ���a��Ӧ�����ǳ�ʼ�²�ֵ
options=statset('Jacobian','on');
[a,r,J,~,msE]=nlinfit(x,y,@kyf3,a0,options);%���
[ypred,delta]=nlpredci(@kyf3,x,a,r,'Jacobian',J,'predopt','observation','simopt','on');%����Ԥ��ֵ��Ԥ������
figure(1)
subplot(2,1,1);
plot(x,y,'r*');hold on;
plot(x,ypred,'b--','LineWidth',1.5);
plot(x,ypred+delta,'b');
plot(x,ypred-delta,'b');
legend('����ֵ','����ֵ','Ԥ������');
subplot(2,1,2);
plot(x,y-ypred,'b.-');hold on;
stem(x,y-ypred,'g','Color','k')
legend('�в�');
%����в�
cancha=y-ypred;
%�в��ֵ
meancancha=mean(cancha);
%��������
MSE=sum(cancha.^2)/(length(cancha)-2);
%ssr
SSR=sum((ypred-mean(y)).^2);
%sse
SSE=sum(cancha.^2);
%r^2
R2=SSR/(SSR+SSE);
fprintf('%s%f\n%s%f\n%s%f\n%s%f\n%s%f\n','�в��ֵ�ǣ�',...
    meancancha,'���������ǣ�',MSE,'SSR�ǣ�',SSR,...
    'SSE�ǣ�',SSE,'R^2�ǣ�',R2);
%t����
[H,P,CI]=ttest2(y,ypred);
if H==0
    disp('������5%�����Ŷ��±�����');
else
    disp('������5%�����Ŷ��±��ܾ�');
end
%% ���2
a0=[1.953e+06 -7.859e-05 -4.036e+09 -0.0004401];%����ϲ���a��Ӧ�����ǳ�ʼ�²�ֵ
options=statset('Jacobian','on');
[a,r,J,~,msE]=nlinfit(x,y,@kyf4,a0,options);%���
[ypred,delta]=nlpredci(@kyf4,x,a,r,'Jacobian',J,'predopt','observation','simopt','on');%����Ԥ��ֵ��Ԥ������
figure(2)
subplot(2,1,1);
plot(x,y,'r*');hold on;
plot(x,ypred,'b--','LineWidth',1.5);
plot(x,ypred+delta,'b');
plot(x,ypred-delta,'b');
legend('����ֵ','����ֵ','Ԥ������');
subplot(2,1,2);
plot(x,y-ypred,'b.-');hold on;
stem(x,y-ypred,'g','Color','k')
legend('�в�');
%����в�
cancha=y-ypred;
%�в��ֵ
meancancha=mean(cancha);
%��������
MSE=sum(cancha.^2)/(length(cancha)-2);
%ssr
SSR=sum((ypred-mean(y)).^2);
%sse
SSE=sum(cancha.^2);
%r^2
R2=SSR/(SSR+SSE);
fprintf('%s%f\n%s%f\n%s%f\n%s%f\n%s%f\n','�в��ֵ�ǣ�',...
    meancancha,'���������ǣ�',MSE,'SSR�ǣ�',SSR,...
    'SSE�ǣ�',SSE,'R^2�ǣ�',R2);
%t����
[H,P,CI]=ttest2(y,ypred);
if H==0
    disp('������5%�����Ŷ��±�����');
else
    disp('������5%�����Ŷ��±��ܾ�');
end










