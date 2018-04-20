%% ɢ��ͼ
close
clear
clc
x=[1000 1500 2000 2500 3000 3500 4000 4500 5000];
y=[17000 15960 14940 13120 12150 11200 10017 9875 9796];
a0=[1.069e+04 306.8 2738 4.869e+18 9.995e+05 1.708e+05];%����ϲ���a��Ӧ�����ǳ�ʼ�²�ֵ
options=statset('Jacobian','on');
[a,r,J,~,msE]=nlinfit(x,y,@kyf,a0,options);%���
[ypred,delta]=nlpredci(@kyf,x,a,r,'Jacobian',J,'predopt','observation','simopt','on');%����Ԥ��ֵ��Ԥ������
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
x=[1000 1500 2000 2500 3000 3500 4000 4500 5000];
y=[17000 15960 14940 13120 12150 11200 10017 9875 9796];
a0=[100 1000 1];%����ϲ���a��Ӧ�����ǳ�ʼ�²�ֵ
options=statset('Jacobian','on');
[a,r,J,~,msE]=nlinfit(x,y,@kyf1,a0,options);%���
[ypred,delta]=nlpredci(@kyf1,x,a,r,'Jacobian',J,'predopt','observation','simopt','on');%����Ԥ��ֵ��Ԥ������
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
%% ���3
x=[1000 1500 2000 2500 3000 3500 4000 4500 5000];
y=[17000 15960 14940 13120 12150 11200 10017 9875 9796];
a0=[-9.7007e-18 1.8638e-13 -1.4479e-09 5.9333e-06 -0.0134 13.0285 1.2720e+04];%����ϲ���a��Ӧ�����ǳ�ʼ�²�ֵ
options=statset('Jacobian','on');
[a,r,J,~,msE]=nlinfit(x,y,@kyf2,a0,options);%���
[ypred,delta]=nlpredci(@kyf2,x,a,r,'Jacobian',J,'predopt','observation','simopt','on');%����Ԥ��ֵ��Ԥ������
figure(3)
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



