%% ȫ��˫�೵�����
% x=[24   54   19   22];120�೵
% 0-120                   5                 80                    24
% 120-606               9                 70                    54
% 606-720               6                 80                    19
% 720-874               7                 75                    22
%% һ�����õ�ʱ�̱�
%����ʱ�̱�
time=[0:5:120 129:9:606 612:6:720 727:7:874];
%��¼����˳��
array=[1:16 zeros(1,104)];
index=16;
for i=17:32
    if time(i)-time(i-16)>=80;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=33:80
    if time(i)-time(i-16)>=70;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=81:99
    if time(i)-time(i-16)>=80;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=100:120
    if time(i)-time(i-16)>=75;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
%% ���������������Сʱ����
for i=37:48
    if time(i)-time(i-32)>480
        disp('ʱ�䳬����Сʱ');
    end
end
for i=49:52
    if time(i)-time(i-48)>480
        disp('ʱ�䳬����Сʱ');
    end
end
% ����
for i=105:112
    if time(i)-time(i-48)>480
        disp('ʱ�䳬����Сʱ');
    end
end
for i=113:115
    if time(i)-time(i-48)>480
        disp(array(i));
        disp('ʱ�䳬����Сʱ');
    end
end
for i=116:120
    if time(i)-time(i-64)>480
        disp(array(i));
        disp('ʱ�䳬����Сʱ');
    end
end
%% ����
array(116:120)=array(116:120)+5;
%% ��������
fprintf('\n%s\n\n','/*********************����֮��********************/');
for i=113:115
    if time(i)-time(i-48)>480
        disp(array(i));
        disp('ʱ�䳬����Сʱ');
    else
        fprintf('%d%s\n',array(i),'û������');
    end
end
for i=100:104
if time(i)-time(i-48)>480
    disp(array(i));
    disp('ʱ�䳬����Сʱ');
else
    fprintf('%d%s\n',array(i),'û������');
end
end
for i=116:120
    if time(i)-time(i-59)>480
        disp(array(i));
        disp('ʱ�䳬����Сʱ');
    else
        fprintf('%d%s\n',array(i),'û������');
    end
end
for i=110:112
    if time(i)-time(i-48)>480
        disp('ʱ�䳬����Сʱ');
    else
        fprintf('%d%s\n',array(i),'û������');
    end
end
%% ����ÿ��������������ʱ������۲���
shangwu=zeros(1,16);
shangwu(1:3)=time(49:51)-time(1:3);
shangwu(4:16)=time(36:48)-time(4:16);
xiawu=zeros(1,16);
xiawu(1:3)=time(113:115)-time(65:67);
xiawu(4:8)=time(100:104)-time(52:56);
xiawu(9:13)=time(116:120)-time(57:61);
xiawu(14:16)=time(110:112)-time(62:64);
res=shangwu-xiawu;
res=res.^2;
res=sqrt(sum(res)/16);