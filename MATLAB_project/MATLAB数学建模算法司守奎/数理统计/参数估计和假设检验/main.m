%% ��һ�⣺�������ֵu�����Ŷ�Ϊ0.95����������
x0=[506 508 499 503 504 510 497 512 514 505 493 496 506 502 509 496];
x0=x0';
alpha=0.05;%���Ŷ�Ϊ0.95
mu=mean(x0);%mu��ƽ��ֵ
sig=std(x0);%sig�Ǳ�׼��
n=length(x0);
t=[mu-sig/sqrt(n)*tinv(1-alpha/2,n-1 ),mu+sig/sqrt(n)*tinv(1-alpha/2,n-1)];
%ͨ��������������������
[h,p,ci]=ttest(x0,mu,0.05);
%% �ڶ��⣺�������ֵu�����Ŷ�Ϊ0.95����������
x0=[1050 1100 1120 1250 1280];
alpha=0.05;%���Ŷ�Ϊ0.95
mu=mean(x0);%mu��ƽ��ֵ
sig=std(x0);%sig�Ǳ�׼��
n=length(x0);
t=[mu-sig/sqrt(n)*tinv(1-alpha/2,n-1 ),mu+sig/sqrt(n)*tinv(1-alpha/2,n-1)];
%ͨ��������������������
[h,p,ci]=ttest(x0,mu,0.05);
%% �����⣺�����������u�Ϳ��������Ŷ�Ϊ0.9����������
x0=[6.683 6.681 6.676 6.678 6.679 6.672];
x1=[6.661 6.661 6.667 6.667 6.664];
alpha=0.1;%���Ŷ�Ϊ0.9
mu1=mean(x0);%mu��ƽ��ֵ
mu2=mean(x1);
sig1=std(x0);%sig�Ǳ�׼��
sig2=std(x1);
n1=length(x0);
n2=length(x1);
%ͨ�����������u����������
[h1,p1,ci1]=ttest(x0,mu1,0.05);
[h2,p2,ci2]=ttest(x1,mu2,0.05);
%ͨ��vartest�󷽲����������
[h3,p3,ci3,st3]=vartest(x0,var(x0),'Alpha',0.1);
[h4,p4,ci4,st4]=vartest(x1,var(x1),'Alpha',0.1);
%�������ⶨֵ����ľ�ֵ������Ŷ�Ϊ0.9����������
[h,p,ci,st]=ttest2(x0,x1,'Alpha',0.1);