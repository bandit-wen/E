function [maxflow,flowmatrix,cut]=maxflow(G,s,t);
%G���ڽӾ��󣬲���������0��ʾ
%s�����
%t���յ�
cm=sparse(G);
[maxflow,flowmatrix,cut]=graphmaxflow(cm,s,t);