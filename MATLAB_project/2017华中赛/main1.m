%% ��һ��unnormalized
%�ȸ����ڽӾ��󻭳�����ͼ
g=[0 1 1 1 1 1;
     1 0 1 1 0 0;
     1 1 0 1 0 0;
     1 1 1 0 0 0;
     1 0 0 0 0 1;
     1 0 0 0 1 0];
 graph(g);
 %����
res=SpectralClustering(g,0,2);
l1=find(res==1);
l2=find(res==2);
fprintf('%s\n%d\n%d\n%d\n%s\n%d\n%d\n%d\n','��һ�ඥ���ǣ�',l1(1),l1(2),l1(3),'�ڶ��ඥ���ǣ�',l2(1),l2(2),l2(3));