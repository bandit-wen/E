%% 1��������ϷGUI
%Conway ��������Ϸ����
%�����ǣ�
%����Χ�� 8 �����ڵ�Ԫ��״̬���
% ����ܺ�Ϊ 2 �Ļ�������һʱ�̵�״̬���ı�
%����ܺ�Ϊ 3 ������һʱ�̵�״̬Ϊ 1
% ����״̬= 0
clc
clear all
%����������ť
plotbutton=uicontrol('style','pushbutton',...
    'string','Run', ...
    'fontsize',12, ...
    'position',[100,400,50,20], ...
    'callback', 'run=1;');
erasebutton=uicontrol('style','pushbutton',...
    'string','Stop', ...
    'fontsize',12, ...
    'position',[200,400,50,20], ...
    'callback','freeze=1;');
quitbutton=uicontrol('style','pushbutton',...
    'string','Quit', ...
    'fontsize',12, ...
    'position',[300,400,50,20], ...
    'callback','stop=1;close;');
number = uicontrol('style','text', ...
    'string','1', ...
    'fontsize',12, ...
    'position',[20,400,50,20]);
%Ԫ������
n=128;
z = zeros(n,n);
cells = z;
sum = z;
%��ʼ��һ����Ԫ��������
cells(n/2,.25*n:.75*n) = 1;
cells(.25*n:.75*n,n/2) = 1;
cells = (rand(n,n))<.5 ;
%����ͼƬ
%cat(3,cells,z,z)�������ǽ�����������������
%image(cat(3,cells,z,z))���׸�������3��
%����ζ�ź������������ֱ������RGBֵ
%��һ��ֵ��0�Ǻ�ɫ��255�ǰ�ɫ��
%RGB�С�255,0,0���Ǻ�ɫ���Դ����ơ�
%���磺a=[255 255;255 255],b=zeros(2)��
%image(cat(3,a,b,b))�Ǻ�ɫ��
%image(cat(3,b,a,b))����ɫ��
%image(cat(3,b,b,a))����ɫ��
%image(cat(3,a,a,b))�ǻ�ɫ��
imh = image(cat(3,cells,z,z));
set(imh, 'erasemode', 'none')
axis equal
axis tight
x = 2:n-1;
y = 2:n-1;
stop= 0; 
run = 0; 
freeze = 0; 
while (stop==0)
    if (run==1)
        %��Χ���ŵ���������
        sum(x,y) = cells(x,y-1) + cells(x,y+1) + ...
            cells(x-1, y) + cells(x+1,y) + ...
            cells(x-1,y-1) + cells(x-1,y+1) + ...
            cells(3:n,y-1) + cells(x+1,y+1);
        %Ԫ������
        cells = (sum==3) | (sum==2 & cells);
        %����ͼƬ
        set(imh, 'cdata', cat(3,cells,z,z) )
        %���µ����˼���
        stepnumber = 1 + str2num(get(number,'string'));
        set(number,'string',num2str(stepnumber))
    end
    
    if (freeze==1)
        run = 0;
        freeze = 0;
    end
    pause(0.02)
end

%% 2����������
%�����ǣ�
% ����Χ�� 8 ���ڵ�Ԫ���Լ������״̬���
% ����ܺ�< 4 ��= 5 ����һʱ�̵�״̬= 0
% ����״̬= 1
clc
clear all
%����������ť
plotbutton=uicontrol('style','pushbutton',...
    'string','Run', ...
    'fontsize',12, ...
    'position',[100,400,50,20], ...
    'callback', 'run=1;');
erasebutton=uicontrol('style','pushbutton',...
    'string','Stop', ...
    'fontsize',12, ...
    'position',[200,400,50,20], ...
    'callback','freeze=1;');
quitbutton=uicontrol('style','pushbutton',...
    'string','Quit', ...
    'fontsize',12, ...
    'position',[300,400,50,20], ...
    'callback','stop=1;close;');
number = uicontrol('style','text', ...
    'string','1', ...
    'fontsize',12, ...
    'position',[20,400,50,20]);
n=128;
z = zeros(n,n);
cells = z;
sum = z;
%��ʼ��һ����Ԫ��������
% cells(n/2,.25*n:.75*n) = 1;
% cells(.25*n:.75*n,n/2) = 1;
cells = (rand(n,n))<.5 ;
%����ͼƬ
imh=image(cat(3,cells,z,z));
set(imh,'erasemode','none');
axis equal
axis tight
x = 2:n-1;
y = 2:n-1;
stop= 0; 
run = 0;
freeze=0;
%����ʵ��
while stop==0
    if run==1
        sum(x,y)=cells(x,y)+cells(x-1,y)+cells(x-1,y-1)+...
            cells(x-1,y+1)+cells(x,y-1)+cells(x,y+1)+...
            cells(x+1,y+1)+cells(x+1,y)+cells(x+1,y-1);
        cells=~((sum<4)|(sum==5));
        set(imh,'cdata',cat(3,cells,z,z));
        stepnumber = 1 + str2num(get(number,'string'));
        set(number,'string',num2str(stepnumber))
    end
    if freeze==1
        run = 0;
        freeze = 0;
    end
    pause(0.05);
end

%% 3 ��������Ⱥ
%����
%����Χ���ڵ� 8 �ھ���ͣ�Ԫ��ֻ������״̬��0 �� 1 ����Ԫ��Ҳ��һ����
%����״̬��������ν'��¼' ����¼����֮ǰ�Ƿ��з���״̬���ھӡ�
% �� 0 �� 1 ֮�����һ������� r ��
% ����ܺ�> 0 ������һ���ھӣ����� r >��ֵ������Ԫ����δ�й�һ���ھӣ�
%��Ԫ��= 1 ��
% ����ܺ�> 0 ������"��¼"�ı�־����¼��ЩԪ����һ��������ھӡ�
% Percolation Cluster
clf
clear all
%��ֵ
threshold = .63;
%����ͼƬ��figure�е����½ǵ�λ�úͳ����Լ���ɫ
ax = axes('units','pixels','position',[1 1 560 420],'color','k');
%����ͼƬ�е���ʼ����
text('units', 'pixels', 'position', [100,280,0],...
'string','BioNB','color','w','fontname','helvetica','fontsize',100)
text('units', 'pixels', 'position', [180,150,0],...
'string','441','color','w','fontname','helvetica','fontsize',100)
% ��ȡ�����������ݵ�ͼ��
initial = getframe(gca);
[a,b,c]=size(initial.cdata);
z=zeros(a,b);
cells = double(initial.cdata(:,:,1)==255);
visit = z ;
sum = z;
%����ͼƬ
imh=image(cat(3,cells,z,z));
set(imh, 'erasemode', 'none')
%��Ϸ����
for i=1:100
sum(2:a-1,2:b-1) = cells(2:a-1,1:b-2) + cells(2:a-1,3:b) + ...
cells(1:a-2, 2:b-1) + cells(3:a,2:b-1) + ...
cells(1:a-2,1:b-2) + cells(1:a-2,3:b) + ...
cells(3:a,1:b-2) + cells(3:a,3:b);
pick = rand(a,b);
cells = cells | ((sum>=1) & (pick>=threshold) & (visit==0)) ;
visit = (sum>=1) ;
set(imh, 'cdata', cat(3,cells,cells,z) )
drawnow
end

%% 4 .�������ʣ� BZ reaction or heart��
% ����
% Ԫ���� 10 ����ͬ��״̬��״̬ 0 �����ߡ�1-5 Ϊ��Ծ״̬����6-9 Ϊ�Ǽ���Ծ
% ״̬��
% ����ÿһ�����ڻ�Ծ��״̬��Ԫ�����ڵ� 8 ��Ԫ����
% ����ʹ��ڻ���� 3 ��������������Ծ���ھӣ� ������һʱ�̸�Ԫ��= 1 ��
% ����Ҫ�������룬1 �� 9 ��״̬���γ��֡������ʱ��״̬= 1 ��ô��һʱ��
% ״̬= 2 �������ʱ��״̬= 2 ��Ȼ����һʱ��״̬= 3 ������������״̬
% �������ƣ�ֱ���� 9 ��״̬�����״̬= 9 ��Ȼ����һ״̬= 0 ����Ԫ����
% ����Ϣ״̬��
%CA driver
%excitable media
clf; clear all
n=128;
z=zeros(n,n);
cells=z;
cells = (rand(n,n))<.1 ;
%cells(n/2,n*.25:n*.75) = 1;
%cells(n*.25:n*.75,n/2) = 1;
sum=z;
imh = image(cat(3,cells,z,z));
set(imh, 'erasemode', 'none')
axis equal
axis tight
x = [2:n-1]; y = [2:n-1];
t = 6; % center value=6; 7 makes fast pattern; 5 analiating waves
t1 = 3; % center value=3
for i=1:1200
sum(x,y) = ((cells(x,y-1)>0)&(cells(x,y-1)<t)) + ((cells(x,y+1)>0)&(cells(x,y+1)<t)) + ...
((cells(x-1, y)>0)&(cells(x-1, y)<t)) + ((cells(x+1,y)>0)&(cells(x+1,y)<t)) + ...
((cells(x-1,y-1)>0)&(cells(x-1,y-1)<t)) + ((cells(x-1,y+1)>0)&(cells(x-1,y+1)<t)) + ...
((cells(x+1,y-1)>0)&(cells(x+1,y-1)<t)) + ((cells(x+1,y+1)>0)&(cells(x+1,y+1)<t));
cells = ((cells==0) & (sum>=t1)) + 2*(cells==1) + 3*(cells==2) + ...
4*(cells==3) + 5*(cells==4) + 6*(cells==5) + 7*(cells==6) +...
8*(cells==7) + 9*(cells==8) + 0*(cells==9);
set(imh, 'cdata', cat(3,z,cells/10,z) )
drawnow
end

%% 5 .ɭ�ֻ���
% ����
%  Ԫ���� 3 ����ͬ��״̬��״̬Ϊ 0 �ǿ�λ��״̬= 1 ��ȼ���ŵ���ľ��״̬
% = 2 ����ľ��
%  ��� 4 ���ھ�����һ����һ�����ϵ���ȼ���ŵĲ�����������ľ��״̬Ϊ
% 2 �� ����ô��Ԫ����һʱ�̵�״̬��ȼ�գ�״̬Ϊ 1 �� ��
%  ɭ��Ԫ����״̬Ϊ 2 ����һ���͸��ʣ����� 0.000005 ����ʼ�գ���Ϊ���磩��
%  һ��ȼ���ŵ�Ԫ����״̬Ϊ 1 ������һʱʱ�̱�ɿ�λ�ģ�״̬Ϊ 0 �� ��
%  ��Ԫ����һ���͸��ʣ����� 0.01 ����Ϊɭ����ģ��������
%  ���ھ���߽����ӵĿ��ǣ������߽翪ʼ�Ż𣬻��ƽ��������ӣ��ұ߽�
% ͬ��ͬ�������ڶ����͵ײ���
clear
clc
clear all
%��ͼ��С
n=10;
%��������еĸ���
Plightning =0.000005;
%�յ����������ĸ���
Pgrowth = 0.01;
z=zeros(n,n);
o=ones(n,n);
veg=z;
sum=z;
%������ά�ľ��󣬲�������Ӧ��ͼ��
imh = image(cat(3,z,veg*0.02,z));
%����ͼƬ�Ĳ���ģʽΪ������
set(imh, 'erasemode', 'none')
axis equal
axis tight
for i=1:3000
%�����������ĸ��ھӺ�
    sum = (veg(1:n,[n 1:n-1])==1) + (veg(1:n,[2:n 1])==1) + ...
        (veg([n 1:n-1], 1:n)==1) + (veg([2:n 1],1:n)==1) ;
%���ݹ������ɭ�־���: ��= ��- �Ż����+ ��������
    veg = ...
        2*(veg==2) - ((veg==2) & (sum>0 | (rand(n,n)<Plightning))) + ...
        2*((veg==0) & rand(n,n)<Pgrowth) ;    
    set(imh, 'cdata', cat(3,(veg==1),(veg==2),z) )
    pause(0.02)
end

%% 6 .���嶯��ѧ
% ����
%  �˹������ HPP-�������
%  ÿ��Ԫ���� 2 ��״̬��״̬= 0 �ǿյģ�״̬= 1 �������ӡ�
%  ���κ�һ��ʱ�䲽�������������Ǹոս��� 2x2 ������顣����ͨ��������
% ������ĵ���Խǵ������У��������κ�ʱ�䲽����ÿһ��Ԫ�����Ԫ����
% �Ƕ�Ԫ�����������ݡ�������ʾ�������ʾ������Ԫ���ṹ����һ��ʱ�䲽
% ����Ϊ�ұߵĽṹ�����������ֲ�ͬ��������������е�Ԫ������ѭ��ͬ��
% ת������
% 0 0      0 0                    1 0      0 0
% 0 0 ->  0 0                    0 0  -> 0 1
% 
% 1 0     1 0                     1 0     0 1           
% 0 1 -> 0 1                     1 0 -> 0 1
% 
% 1 1     0 1                     1 1     1 1
% 1 0 -> 1 1                     1 1 -> 1 1
% Ϊ��ʵ��������ײ���̣���֤�����������غ㣩�������������ڶԽ����ϵ�
% ���ӣ������໥ײ����ƫת 90 �ȡ���һ��ʱ�䲽����ʹ���һ���Խ�ת��
% ��һ���Խǡ��������ʱ����ת���ĸ�Ԫ����ʵ��������̡�����������
% �Ա�ʾΪ��
% 1 0      0 1
% 0 1 -> 1 0
% ? ����ײ��ǽ��ʱ���򵥵�ʹ���뿪��״̬���䡣�������������
%CA driver
%HPP-gas
clear all
clf
nx=52; %must be divisible by 4
ny=100;
z=zeros(nx,ny);
o=ones(nx,ny);
sand = z ;
sandNew = z;
gnd = z ;
diag1 = z;
diag2 = z;
and12 = z;
or12 = z;
sums = z;
orsum = z;
gnd(1:nx,ny-3)=1 ; % right ground line
gnd(1:nx,3)=1 ; % left ground line
gnd(nx/4:nx/2-2,ny/2)=1; %the hole line
gnd(nx/2+2:nx,ny/2)=1; %the hole line
gnd(nx/4, 1:ny) = 1; %top line
gnd(3*nx/4, 1:ny) = 1 ;%bottom line
%fill the left side
r = rand(nx,ny);
sand(nx/4+1:3*nx/4-1, 4:ny/2-1) = r(nx/4+1:3*nx/4-1, 4:ny/2-1)<0.3;
%sand(nx/4+1:3*nx/4-1, ny*.75:ny-4) = r(nx/4+1:3*nx/4-1, ny*.75:ny-4)<0.75;
%sand(nx/2,ny/2) = 1;
%sand(nx/2+1,ny/2+1) = 1;
imh = image(cat(3,z,sand,gnd));
set(imh, 'erasemode', 'none')
axis equal
axis tight
for i=1:1000
p=mod(i,2); %margolis neighborhood
%upper left cell update
xind = [1+p:2:nx-2+p];
yind = [1+p:2:ny-2+p];
%See if exactly one diagonal is ones
%only (at most) one of the following can be true!
diag1(xind,yind) = (sand(xind,yind)==1) & (sand(xind+1,yind+1)==1) & ...
(sand(xind+1,yind)==0) & (sand(xind,yind+1)==0);
diag2(xind,yind) = (sand(xind+1,yind)==1) & (sand(xind,yind+1)==1) & ...
(sand(xind,yind)==0) & (sand(xind+1,yind+1)==0);
%The diagonals both not occupied by two particles
and12(xind,yind) = (diag1(xind,yind)==0) & (diag2(xind,yind)==0);
%One diagonal is occupied by two particles
or12(xind,yind) = diag1(xind,yind) | diag2(xind,yind);
%for every gas particle see if it near the boundary
sums(xind,yind) = gnd(xind,yind) | gnd(xind+1,yind) | ...
gnd(xind,yind+1) | gnd(xind+1,yind+1) ;
% cell layout:
% x,y x+1,y
% x,y+1 x+1,y+1
%If (no walls) and (diagonals are both not occupied)
%then there is no collision, so move opposite cell to current cell
%If (no walls) and (only one diagonal is occupied)
%then there is a collision so move ccw cell to the current cell
%If (a wall)
%then don't change the cell (causes a reflection)
sandNew(xind,yind) = ...
(and12(xind,yind) & ~sums(xind,yind) & sand(xind+1,yind+1)) + ...
(or12(xind,yind) & ~sums(xind,yind) & sand(xind,yind+1)) + ...
(sums(xind,yind) & sand(xind,yind));
sandNew(xind+1,yind) = ...
(and12(xind,yind) & ~sums(xind,yind) & sand(xind,yind+1)) + ...
(or12(xind,yind) & ~sums(xind,yind) & sand(xind,yind))+ ...
(sums(xind,yind) & sand(xind+1,yind));
 sandNew(xind,yind+1) = ...
(and12(xind,yind) & ~sums(xind,yind) & sand(xind+1,yind)) + ...
(or12(xind,yind) & ~sums(xind,yind) & sand(xind+1,yind+1))+ ...
(sums(xind,yind) & sand(xind,yind+1));
sandNew(xind+1,yind+1) = ...
(and12(xind,yind) & ~sums(xind,yind) & sand(xind,yind)) + ...
(or12(xind,yind) & ~sums(xind,yind) & sand(xind+1,yind))+ ...
(sums(xind,yind) & sand(xind+1,yind+1));
sand = sandNew;
set(imh, 'cdata', cat(3,z,sand,gnd) )
drawnow
end

%% 8.��ɢ���ƾۼ�
% ���ϵͳ��ģ��ճ�Կ����ľۼ����γɷ��νṹ���ʵ���һ���������� 6 �е�
% HPP-����������˶� ����ͬ����������һЩ���ܶȣ�������������Һ����Χ
% ���ٶ��ǵ����ġ�Ч����ÿһ��������ÿ��ʱ�䲽��������ķ������˶�������
% ֮��ÿһ��ʱ�䲽����һ����ײ�Ĺ��̡����������������ȷ������һ���̶�
% �����������κ���ɢ���Ӵ������ͻᱻ��ճס������Ϊһ�������ƶ��ģ���ճ��
% ������
% ����
% ? ʹ�� Margolus ���ھӡ���ÿһ��ʱ�䲽���ȸ��ʵ�˳ʱ�����ʱ����ת 4
% ��Ԫ������תʹ�ٶ��������
% ? ���ƶ�������˸�������ھ���һ����һ������Ԫ���ǹ̶���ճ�Կ�����
% ����ʱ�̸�Ԫ���������ᣬ����ʹ֮��ճ�ԡ�
%diffusion + dla
clear all
clf
nx=200; %must be divisible by 4
ny=200;
z=zeros(nx,ny);
o=ones(nx,ny);
sand = z ;
sandNew = z;
sum = z;
gnd = z;
gnd(nx/2,ny/2) = 1 ;
sand = rand(nx,ny)<.1;
imh = image(cat(3,z,sand,gnd));
set(imh, 'erasemode', 'none')
axis equal
axis tight
for i=1:10000
p=mod(i,2); %margolis neighborhood
 %upper left cell update
xind = [1+p:2:nx-2+p];
yind = [1+p:2:ny-2+p];
%random velocity choice
vary = rand(nx,ny)<.5 ;
vary1 = 1-vary;
%diffusion rule -- margolus neighborhood
%rotate the 4 cells to randomize velocity
sandNew(xind,yind) = ...
vary(xind,yind).*sand(xind+1,yind) + ... %cw
vary1(xind,yind).*sand(xind,yind+1) ; %ccw
sandNew(xind+1,yind) = ...
vary(xind,yind).*sand(xind+1,yind+1) + ...
vary1(xind,yind).*sand(xind,yind) ;
sandNew(xind,yind+1) = ...
vary(xind,yind).*sand(xind,yind) + ...
vary1(xind,yind).*sand(xind+1,yind+1) ;
sandNew(xind+1,yind+1) = ...
vary(xind,yind).*sand(xind,yind+1) + ...
vary1(xind,yind).*sand(xind+1,yind) ;
sand = sandNew;
%for every sand grain see if it near the fixed, sticky cluster
sum(2:nx-1,2:ny-1) = gnd(2:nx-1,1:ny-2) + gnd(2:nx-1,3:ny) + ...
gnd(1:nx-2, 2:ny-1) + gnd(3:nx,2:ny-1) + ...
gnd(1:nx-2,1:ny-2) + gnd(1:nx-2,3:ny) + ...
gnd(3:nx,1:ny-2) + gnd(3:nx,3:ny);
%add to the cluster
gnd = ((sum>0) & (sand==1)) | gnd ;
%and eliminate the moving particle
sand(find(gnd==1)) = 0;
set(imh, 'cdata', cat(3,gnd,gnd,(sand==1)) );
drawnow
end

%% 9 .ɰ�ѹ���
% һ��ɳ�ӵĺ���棬����ʹ�� Margolus ���ھӷ��棬���˶�����ͬ��
% ����
% ? Ԫ���� 2 ��״̬��״̬= 0 �ǿյģ�״̬= 1 ����ɳ�ӡ�
% ? ���κ�ʱ�䲽����һ�����ӣ������� 2x2 �������ŵײ��˶��������˶�����
% ��ʾ��ǽ�ں͵ײ�����ֹ���Ӽ����˶���
% ? Ϊ���ø��˶���������ԣ����ಹ��˵һ�������ʱ��������״̬������
% Ԫ������ת��ֱ�����еĶ�������ɡ�
% 0 0 -> 0 0                                  1 0 -> 0 0
% 0 0     0 0                                  0 0     1 0
% 
% 0 1 -> 0 0                                  1 0 -> 0 0
% 0 0     0 1                                  1 0     1 1
% 
% 0 1 -> 0 0                                  1 0 -> 0 0
% 0 1     1 1                                  0 1     1 1
% 
% 0 1 -> 0 0                                  1 1 -> 1 0
% 1 0     1 1                                  1 0     1 1
% 
% 1 1 -> 0 1
% 0 1     1 1
%sand pile
clear all
clf
nx=52; %must be divisible by 4
ny=100;
Pbridge = .05;
z=zeros(nx,ny);
o=ones(nx,ny);
sand = z ;
sandNew = z;
gnd = z ;
gnd(1:nx,ny-3)=1 ; % the ground line
gnd(nx/4:nx/2+4,ny-15)=1; %the hole line
gnd(nx/2+6:nx,ny-15)=1; %the hole line
gnd(nx/4, ny-15:ny) = 1; %side line
gnd(3*nx/4, 1:ny) = 1 ;
imh = image(cat(3,z',sand',gnd'));
set(imh, 'erasemode', 'none')
axis equal
axis tight
for i=1:1000
p=mod(i,2); %margolis neighborhood
sand(nx/2,ny/2) = 1; %add a grain at the top
%upper left cell update
xind = [1+p:2:nx-2+p];
yind = [1+p:2:ny-2+p];
vary = rand(nx,ny)<.95 ;
vary1 = 1-vary;
sandNew(xind,yind) = ...
gnd(xind,yind).*sand(xind,yind) + ...
(1-gnd(xind,yind)).*sand(xind,yind).*sand(xind,yind+1) .* ...
(sand(xind+1,yind+1)+(1-sand(xind+1,yind+1)).*sand(xind+1,yind));
 sandNew(xind+1,yind) = ...
gnd(xind+1,yind).*sand(xind+1,yind) + ...
(1-gnd(xind+1,yind)).*sand(xind+1,yind).*sand(xind+1,yind+1) .* ...
(sand(xind,yind+1)+(1-sand(xind,yind+1)).*sand(xind,yind));
sandNew(xind,yind+1) = ...
sand(xind,yind+1) + ...
(1-sand(xind,yind+1)) .* ...
( sand(xind,yind).*(1-gnd(xind,yind)) + ...
(1-sand(xind,yind)).*sand(xind+1,yind).*(1-gnd(xind+1,yind)).*sand(xind+1,yind+1));
sandNew(xind+1,yind+1) = ...
sand(xind+1,yind+1) + ...
(1-sand(xind+1,yind+1)) .* ...
( sand(xind+1,yind).*(1-gnd(xind+1,yind)) + ...
(1-sand(xind+1,yind)).*sand(xind,yind).*(1-gnd(xind,yind)).*sand(xind,yind+1));
%scramble the sites to make it look better
temp1 = sandNew(xind,yind+1).*vary(xind,yind+1) + ...
sandNew(xind+1,yind+1).*vary1(xind,yind+1);
temp2 = sandNew(xind+1,yind+1).*vary(xind,yind+1) + ...
sandNew(xind,yind+1).*vary1(xind,yind+1);
sandNew(xind,yind+1) = temp1;
sandNew(xind+1,yind+1) = temp2;
sand = sandNew;
set(imh, 'cdata', cat(3,z',sand',gnd') )
drawnow
end

%% 10����άԪ���Զ���С��Ϸ
%imagesc(a)��ɫ�Ⱦ���a��0->256�������
% �����Ȱ��м����Ϊ1��ÿһʱ��ÿһ�����
%��Χ�˸����Ϊż�������Ϊ0��Ϊ�������Ϊ 1
% ��ɫ����
Map = [1 1 1; 0 0 0];
colormap(Map);
% ���������С
S = 121;
L = zeros(S);
% ���м�һ��������Ϊ 1 ��ΪԪ������
M = (S+1)/2;
L(M, M) =1;
Temp = L;
% imagesc(L);

% �������
Layer = (S-1)/2 + 1;

for t=2:Layer
    for x=M-t+1:M+t-1
        if x==M-t+1 || x==M+t-1
            for y=M-t+1:M+t-1
                SUM = 0;
                for m=-1:1
                    for n=-1:1
                        if x+m>0 && x+m<=S && y+n>0 && y+n<=S
                            SUM = SUM + L(x+m, y+n);
                        end
                    end
                end
                SUM = SUM - L(x, y);
                Temp(x, y) = mod(SUM, 2);
            end
        else
            y = M-t+1;
            SUM = 0;
            for m=-1:1
                for n=-1:1
                    if x+m>0 && x+m<=S && y+n>0 && y+n<=S
                        SUM = SUM + L(x+m, y+n);
                    end
                end
            end
            SUM = SUM - L(x, y);
            Temp(x, y) = mod(SUM, 2);
            
            y = M+t-1;
            SUM = 0;
            for m=-1:1
                for n=-1:1
                    if x+m>0 && x+m<=S && y+n>0 && y+n<=S
                        SUM = SUM + L(x+m, y+n);
                    end
                end
            end
            SUM = SUM - L(x, y);
            Temp(x, y) = mod(SUM, 2);
        end
    end
    L = Temp;
    imagesc(L);
    % �ٶȿ���
    pause(0.05);
end