%% �ǵ�ķ˹Ԥ������ϵͳ
function val=Adamus (f, h) 
%f��һ�׳�΢�ַ��̵��Ҷ˺���
%���磺f=@(x,y) y-2*x/y
%h�ǻ��ֲ���
%% �㷨ʵ��
low=input('�������Ա������ޣ�low=');
high=input('�������Ա������ޣ�high=');
first=input('�����뺯����ֵ:first=');
N=(high-low)/h;
val=zeros(N+1,1);
x=low:h:high;
val(1)=first;
for i=2:4
    K1=feval(f,x(i-1),val(i-1));
    K2=feval(f,x(i-1)+h/2,val(i-1)+K1*h/2);
    K3=feval(f,x(i-1)+h/2,val(i-1)+K2*h/2);
    K4=feval(f,x(i-1)+h,val(i-1)+h*K3);
    val(i)=val(i-1)+h*(K1+2*K2+2*K3+K4)/6;
end
for i=5:N+1    
    v1=feval(f,x(i-4),val(i-4));
    v2=feval(f,x(i-3),val(i-3));
    v3=feval(f,x(i-2),val(i-2));
    v4=feval(f,x(i-1),val(i-1));
    t=val(i-1)+h*(55*v4-59*v3+37*v2-9*v1)/24;
    temp=feval(f,x(i),t);
    val(i)=val(i-1)+h*(9*temp+19*v4-5*v3+v2)/24;
end
disp('���������£�')
val

