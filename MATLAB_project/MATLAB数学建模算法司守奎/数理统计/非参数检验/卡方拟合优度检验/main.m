%% 100ҳ���鼮ӡˢ���󼰴��������Ӧ��ҳ�����£�
%�ܷ���Ϊ�������Ӳ��ɷֲ�
n=100;
f=0:7;
num=[36 40 19 2 0 2 1 0];
lamda=dot(f,num)/100;
pi=poisspdf(f,lamda);
[h,p,st]=chi2gof(f,'ctrs',f,'frequency',num,'expected',n*pi,'nparams',1);
%st.O�Ǹ����ܶȣ�st.E��n*pi
col3=st.E/sum(st.O);
col4=st.E;
col5=st.O.^2/col4;
sumcol5=sum(col5);
k2=chi2inv(0.95,st.df);
%% �ڶ��⣺�ܷ���Ϊ��������ָ���ֲ�
edges=[0:100:300];%ԭʼ���ݵı߽�
bins=[50 150 250 inf];%ԭʼ���ݵ�����
num=[121 78 43 58];%�۲�Ƶ��
pd=makedist('exp',200);
[h,p,st]=chi2gof(bins,'Edges',edges,'cdf',pd,'Frequency',num);
pi=st.E/sum(st.O);
col4=st.E;
col5=st.O.^2/col4;
sumcol5=sum(col5);
k2=chi2inv(0.95,st.df);
%% �����⣺�ܷ���Ϊ��alpha=0.1����̬�ֲ�N(60,15^2)
alpha=0.1;
edges=[-inf 20:10:100 inf];
bins=[25:10:95];
num=[5 15 30 51 60 23 10 6];
pd=@(x)normcdf(x,60,15);
[h,p,st]=chi2gof(bins,'cdf',pd,'Edges',edges,'Frequency',num);
pi=st.E/sum(st.O);
col4=st.E;
col5=st.O.^2./col4;
sumcol5=sum(col5);
k2=chi2inv(1-alpha,st.df);










