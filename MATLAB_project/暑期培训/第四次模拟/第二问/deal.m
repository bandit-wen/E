%% ��ȡ���ݣ�����7��һ�����ڣ�
% ��һ�������г���źͳ�������
% �ڶ��е��������ǳ���ʱ�䣬����ʱ�䣬��������
function data=deal()
ffid = fopen('t.txt','r');
i = 1;
while feof(ffid) == 0
    tline = fgetl(ffid);
    tf = isspace(tline); % �ո��ж�
    dtf = diff(tf); % ���
    dtf = [0 dtf]; % ���뵽����
    ind = find(dtf~=0); % �ҵ��ո���ʼλ��
    tind = ~tf; % ȡ������ֵ��Ϣ
    tind(ind) = 1; % ���ñ��
    tline = tline(tind); % ��������
    tdata{i,1} = tline;
    i = i+1;
end
ffid = fclose(ffid);
data=zeros(12649,5);
data=data-1;
for i=1:12649
    num=str2num(tdata{i});
    if size(num,2)==3
        data(i,2)=num(1);
        data(i,3)=num(2);
        data(i,5)=num(3);
    else
        data(i,1)=num(1);
        data(i,2)=num(2);
    end
end
[x,y]=find(data(:,1)~=-1);
for i=1:length(x)
    num=data(x(i),1);%���г����
    gonum=data(x(i),2);% ��������
    data(x(i)+1,1)=num;
    data(x(i)+1,4)=gonum;
end
for i=1:length(x)-1
    num=data(x(i),1);%���г����
    data(x(i)+1:x(i+1)-1,1)=num;
end
num=data(x(1000),1);
data(x(1000)+1:end,1)=num;
for i=1:length(x)-1
    data(x(i+1)-1:-1:x(i)+2,4)=data(x(i+1)-2:-1:x(i)+1,5);
end
for i=length(data(:,4)):-1:x(1000)+2
    data(i,4)=data(i-1,5);
end
index=find(data(:,5)==-1);
num1=length(find(data(index,2)==1));
num2=length(find(data(index,2)==2));
num3=length(find(data(index,2)==3));
num4=length(find(data(index,2)==4));
num5=length(find(data(index,2)==5));
num6=length(find(data(index,2)==6));
num7=length(find(data(index,2)==7));
num8=length(find(data(index,2)==8));
num9=length(find(data(index,2)==9));
num10=length(find(data(index,2)==10));
data(index,:)=[];
fprintf('%s%d\n','����1�ĳ�ʼ������Ŀ��',num1);
fprintf('%s%d\n','����2�ĳ�ʼ������Ŀ��',num2);
fprintf('%s%d\n','����3�ĳ�ʼ������Ŀ��',num3);
fprintf('%s%d\n','����4�ĳ�ʼ������Ŀ��',num4);
fprintf('%s%d\n','����5�ĳ�ʼ������Ŀ��',num5);
fprintf('%s%d\n','����6�ĳ�ʼ������Ŀ��',num6);
fprintf('%s%d\n','����7�ĳ�ʼ������Ŀ��',num7);
fprintf('%s%d\n','����8�ĳ�ʼ������Ŀ��',num8);
fprintf('%s%d\n','����9�ĳ�ʼ������Ŀ��',num9);
fprintf('%s%d\n','����10�ĳ�ʼ������Ŀ��',num10);