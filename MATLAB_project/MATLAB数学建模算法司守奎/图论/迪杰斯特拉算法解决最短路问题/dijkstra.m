clc,clear
%% dijkstra������·����(����ӵ�һ�����㵽���ඥ��)
%����Ȩͼ
%�ڽӾ����ʼ��
a=zeros(6); 
a(1,2)=50;a(1,4)=40;a(1,5)=25;a(1,6)=10;
a(2,3)=15;a(2,4)=20;a(2,6)=25;
a(3,4)=10;a(3,5)=20;
a(4,5)=10;a(4,6)=25;
a(5,6)=55;
a=a+a';
index=find(a==0);
a(index)=65535;
%% �㷨����
%��ʼ����������
pb=zeros(1,length(a));%�����Ƿ���ʹ��õ�ı�־
pb(1)=1;
index1=zeros(1,length(a));%���涥���˳��
index1(1)=1;
index2=zeros(1,length(a));%���涥������
for i=1:length(a)
    d(i)=a(1,i);%���涥��һ�����ඥ������·��
end
temp=1;% ���µĵõ�minֵ�ĵ�
%ѭ������
while (length(find(pb==0)))~=0
    %�ҵ����е�δ���ʹ��õ㣬�������ǵ���Сֵ
    index=find(pb==0);
    pindex=find(pb==1);
    for i=1:length(pindex)
        d(index)=min(d(index),d(pindex(i))+a(pindex(i),index));
    end
    %�����ж����ͬʱ�ﵽ��Сֵ��ֻ����ǰ�������Ϊ���ʹ���
    %������һ��������·��˳��index1��
    temp=find(d(index)==min(d(index)));
    pb(index(temp(1)))=1;
    index1=[index1,index(1)];
end
index=find(d==65535);
d(index)=inf;
d




