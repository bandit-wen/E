% ����ͼG�� ��С�������� �߱�
function MST = normal_prim(G)
N = length(G); % ͼG�Ķ�����
MST = []; % ��¼MST�ı߱� [��� �յ� Ȩֵ]
k = 0;
vis = zeros(1, N); 
vis(1) = 1; 
while k < N-1
    minw = inf;
    u = 0; v = 0;
     
    % ��һ����С��
    for i = 1 : N
        for j = 1 : N
            if vis(i) == 1 && vis(j) == 0
                if G(i, j) < minw
                    minw = G(i, j);
                    u = i; v = j;
                end 
            end
        end 
    end 
    % ����������
    vis(v)  = 1;
    k = k+1;
    MST(k, :) = [u v minw];
end
