function [U,P,Dist,Cluster_Res,Obj_Fcn,iter]=fuzzycm2(Data,P0,plotflag,M,epsm)
% ģ�� C ��ֵ���� FCM: ��ָ����ʼ�������Ŀ�ʼ����
% [U,P,Dist,Cluster_Res,Obj_Fcn,iter] = fuzzycm2(Data,P0,plotflag,M,epsm)
% ����: Data,plotflag,M,epsm: �� fuzzycm.m
%       P0: ��ʼ��������
% ���: U,P,Dist,Cluster_Res,Obj_Fcn,iter: �� fuzzycm.m    
% See also: fuzzycm
if nargin<5
    epsm=1.0e-6; 
end
if nargin<4
    M=2;
end
if nargin<3
    plotflag=0;
end
[N,S] = size(Data); m = 2/(M-1); iter = 0;
C=size(P0,1);Dist(C,N)=0;U(C,N)=0;P(C,S)=0;
% FCM �ĵ����㷨
while true 
    % ����������
    iter=iter+1; 
    % �������»��־��� U
    for i=1:C
        for j=1:N
            Dist(i,j)=fuzzydist(P0(i,:),Data(j,:));
        end
    end         
    U=1./(Dist.^m.*(ones(C,1)*sum(Dist.^(-m))));      
    % ���¾������� P
    Um=U.^M;
    P=Um*Data./(ones(S,1)*sum(Um'))';   
    % Ŀ�꺯��ֵ: ���ڼ�Ȩƽ������
    if nargout>4 | plotflag
        Obj_Fcn(iter)=sum(sum(Um.*Dist.^2));
    end
    % FCM �㷨����ֹͣ����
    if norm(P-P0,Inf)<epsm
        break
    end
    P0=P;
end
% ������
if nargout > 3
    res = maxrowf(U);
    for c = 1:C
        v = find(res==c);
        Cluster_Res(c,1:length(v))=v;
    end
end
% ��ͼ
if plotflag
    fcmplot(Data,U,P,Obj_Fcn);
end
