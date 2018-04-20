function MST=normal_kruskal(G)
%GΪ�ڽӾ��󣬸�ʽ��֮ǰ��ȫ��һ��
%MST������ǶԳƵ���С�����������ֻ��һ��ͺ�
%a =[Inf    50    60   Inf   Inf   Inf   Inf
%       50   Inf   Inf    65    40   Inf   Inf
%       60   Inf   Inf    52   Inf   Inf    45
%       Inf    65    52   Inf    50    30    42
%       Inf    40   Inf    50   Inf    70   Inf
%       Inf   Inf   Inf    30    70   Inf   Inf
%       Inf   Inf    45    42   Inf   Inf   Inf]
n=length(G);
T=zeros(n); %��С�������ļ�Ȩ�ڽӾ��� 
GG=G;
   for i=1:n 
      for j=1:n
         if G(i,j)==inf  GG(i,j)=0; 
         end
      end
   end
m=((nnz(GG))/2);  %ͼ�ı��ߵ���Ŀ
j=0; %��С�������ı��ߵ���Ŀ
%��Ҫ����
for i=1:m %��ѡ����ߵ���Ŀ
   if j<(n-1) %�㷨����ֹ������ |E|=|V|-1.
%����0: ��ѡ��Ȩֵ��С�ı� G(a,b)
      min=inf; a=0; b=0;     
      for k=1:n
         for l=(k+1):n
            if G(k,l)<=min  min=G(k,l); a=k; b=l; end 
         end
      end
%����0 ����
%����1
%T=T+e(a,b)
      T(a,b)=G(a,b); T(b,a)=G(a,b); 
%����Ƿ��л��ĳ��� 
      f=0; %û�л��ĳ���
      P=zeros(2,m);  y=0; 
      for i=1:n
         for v=(i+1):n
            if T(i,v)~=0    y=y+1; P(1,y)=i; P(2,y)=v;  
            end
         end
      end
      for y=1:m
         if P(1,y)<P(2,y)
            for l=(y+1):m
               if P(1,l)==P(2,y)  P(1,l)=P(1,y);
               elseif P(2,l)==P(2,y)  P(2,l)=P(1,y);
               end
            end
            P(2,y)=P(1,y); 
         elseif P(2,y)<P(1,y)
            for l=(y+1):m
               if P(1,l)==P(1,y)  P(1,l)=P(2,y);
               elseif P(2,l)==P(1,y)  P(2,l)=P(2,y);
               end
            end
            P(1,y)=P(2,y);
         elseif (P(1,y)+P(2,y))~=0   f=1; %����һ����
            break 
         end
      end
      if f==1   T(a,b)=0; T(b,a)=0; %ת�� ����2
      else j=j+1; %ת�� ����3
      end
      G(a,b)=inf;
   else %�������|E|=|V|-1����
      MST=T;
      disp('���ͼ����С�������ļ�Ȩ�ڽӾ�����:') 
      break
     end  
   end
if j<(n-1) %�������|E|<|V|-1����
   disp('���ͼû����С������.')  
end
