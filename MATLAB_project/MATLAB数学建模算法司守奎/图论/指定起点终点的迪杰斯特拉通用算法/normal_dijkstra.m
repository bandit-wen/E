function [mydistance,mypath]=normal_dijkstra(a,sb,db);
% ���룺a���ڽӾ���a��i��j)��ָi��j֮��ľ��룬�����������
%���磺a =��65535          50       65535          40          25          10
%                   50       65535          15          20       65535          25
%                   65535          15       65535          10          20       65535
%                   40          20          10       65535          10          25
%                   25       65535          20          10       65535          55
%                   10          25       65535          25          55       65535��
% sb�����ı��, db���յ�ı��
% �����mydistance�����·�ľ���, mypath�����·��·��
n=size(a,1); visited(1:n) = 0;
distance(1:n) = inf; distance(sb) = 0; %��㵽���������ĳ�ʼ��
visited(sb)=1; u=sb;  %uΪ���µ�P��Ŷ���
parent(1:n) = 0; %ǰ������ĳ�ʼ��
for i = 1: n-1
     id=find(visited==0); %����δ��ŵĶ���
     for v = id           
         if  a(u, v) + distance(u) < distance(v)
             distance(v) = distance(u) + a(u, v);  %�޸ı��ֵ 
             parent(v) = u;                                    
         end            
     end
     temp=distance;
     temp(visited==1)=inf;  %�ѱ�ŵ�ľ��뻻������
     [t, u] = min(temp);  %�ұ��ֵ��С�Ķ��� 
     visited(u) = 1;       %����Ѿ���ŵĶ���
 end
mypath = [];
if parent(db) ~= 0   %�������·!
    t = db; mypath = [db];
    while t ~= sb
        p = parent(t);
        mypath = [p mypath];
        t = p;      
    end
end
mydistance = distance(db);
