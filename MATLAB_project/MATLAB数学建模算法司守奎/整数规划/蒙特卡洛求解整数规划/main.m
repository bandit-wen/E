%% ���ؿ������ max z=x1^2+x2^2+3x3^2+4x4^2+2x5^2-8x1-2x2-3x3-x4-2x5
%   0<=xi<=99
%   x1+x2+x3+x4+x5<=400
%   x1+2x2+2x3+x4+6x5<=800
%   2x1+x2+6x3<=200
%   x3+x4+5x5<=200

rand('state',sum(clock));%��ʼ�������������
p0=0;
tic
for i=1:1:10^6
    fprintf('%s%u%s\n','��',i,'��');
    x=randi([0,99],1,5);%����һ�����е�0��99���������
    [f,g]=mengte(x);
    if all(g<0)
        if p0<f
            x0=x;
            p0=f;%��¼�½ϴ�Ľ�
        end
    end
end
x0
p0
toc