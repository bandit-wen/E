function e=e()
e=zeros(30,22);%��ʮ�п�棬20������
for i=0:size(e,1)-1%i�ǿ��
    for j=0:size(e,2)-1%j������
        if i>=j
            e(i+1,j+1)=j*700-(i-j)*100;
        else
            e(i+1,j+1)=i*700;
        end
    end
end



