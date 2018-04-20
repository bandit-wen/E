clf;
clear all;
%build the GUI
%define the plot button
plotbutton=uicontrol('style','pushbutton',...
'string','Run', ...
'fontsize',12, ...
'position',[100,400,50,20], ...
'callback', 'run=1;');
%define the stop button
erasebutton=uicontrol('style','pushbutton',...
'string','Stop', ...
'fontsize',12, ...
'position',[200,400,50,20], ...
'callback','freeze=1;');
%define the Quit button
quitbutton=uicontrol('style','pushbutton',...
'string','Quit', ...
'fontsize',12, ...
'position',[300,400,50,20], ...
'callback','stop=1;close;');
number = uicontrol('style','text', ...
'string','1', ...
'fontsize',12, ...
'position',[20,400,50,20]);
%CA setup
n=100; %���ݳ�ʼ��
z=zeros(1,n); %Ԫ������
z=roadstart(z,5); %��·״̬��ʼ����·��������ֲ�5��
cells=z;
vmax=3; %����ٶ�
v=speedstart(cells,vmax); %�ٶȳ�ʼ��
x=1; %��¼�ٶȺͳ���λ��
memor_cells=zeros(3600,n);
memor_v=zeros(3600,n);
imh=imshow(cells); %��ʼ��ͼ���ɫ�г�����ɫ��Ԫ��
set(imh, 'erasemode', 'none')
axis equal
axis tight
stop=0; %wait for a quit button push
run=0; %wait for a draw
freeze=0; %wait for a freeze�����ᣩ
while (stop==0)
      if(run==1)
          %�߽���������������ĩ�������ƽ�����ʹ�ÿ�������
          a=searchleadcar(cells);%��һ����1~100
          b=searchlastcar(cells);%�������
          [cells,v]=border_control(cells,a,b,v,vmax);%���º�Ľ�ͨ��
          i=searchleadcar(cells); %�����׳�λ��
          for j=1:i
 if i-j+1==n%���һ����
                  [z,v]=leadcarupdate(z,v);
                   continue;
               else 
                   %======================================���١����١��������
                   if cells(i-j+1)==0; %�жϵ�ǰλ���Ƿ�ǿ�
                   continue;
                   else v(i-j+1)=min(v(i-j+1)+1,vmax); %����
                        %=================================����
                        k=searchfrontcar((i-j+1),cells); %����ǰ���׸��ǿ�Ԫ��λ��
                        if k==0; %ȷ����ǰ��֮���Ԫ����
                           d=n-(i-j+1);
                        else d=k-(i-j+1)-1;
                        end
                        v(i-j+1)=min(v(i-j+1),d);
                        %==============================%����
                        %�������
                        v(i-j+1)=randslow(v(i-j+1));
                        new_v=v(i-j+1);                       
                       %======================================���١����١��������
                        %���³���λ��
                       z(i-j+1)=0;                    
                       z(i-j+1+new_v)=1;
                      %�����ٶ�
                      v(i-j+1)=0;
                      v(i-j+1+new_v)=new_v;
                   end
               end
          end
          cells=z;
          memor_cells(x,:)=cells; %��¼�ٶȺͳ���λ��
          memor_v(x,:)=v;
          x=x+1;
          set(imh,'cdata',cells) %����ͼ��
          %update the step number diaplay
          pause(0.2);
          stepnumber = 1 + str2num(get(number,'string'));
          set(number,'string',num2str(stepnumber))
      end
      if (freeze==1)
         run = 0;
         freeze = 0;
      end
      drawnow
end
