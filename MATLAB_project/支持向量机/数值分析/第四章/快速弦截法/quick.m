%% �����ҽط�
function root=quick(f)
%f�Ƿ��̱���f=@(x)x*exp(x)-1
a=input('���̵ĵ�һ����ʼ��a��');
b=input('���̵ĵڶ�����ʼ��b��');
e=input('���̵ĸ��ľ����ǣ�e=');
f1=feval(f,a);
f2=feval(f,b);
if(f1==0)
    root=a;
end
if(f2==0)
    root=b;
end
if(f1*f2>0)
    disp('���˵㺯��ֵ�˻�����0!');
    return;
else
    error=100;
    root=b;
    r2=a;                         %������ʼֵ
    while(error>e)
        r1 = r2;
        r2 = root;
        f1=feval(f,r1);
        f2=feval(f,r2);
        if(f1==0)
            root=r1;
        else
            if(f2==0)
                root = r2;
            else
                root=r2-(r2-r1)*f2/(f2-f1);          
            end
        end
        error=abs(root-r2);
    end
end
fprintf('%s%f\n','���̵ĸ��ǣ�',root);