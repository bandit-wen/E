#include <iostream>
#include <stdio.h>
#include<string>
#include<fstream>
#include <sstream>  
#include <iomanip>
#include "compress.h"
#include "huffman.h"
using namespace std;
/*���˸�01����ת����һ���ַ�*/
char str2byte(string cd)
{
	char b=0x00;
	for(int i=1;i<9;i++)
	{
		b=b<<1;
		if(cd[i]=='1')
		{b=b|0x01;}
	}
	return b;
}

/*ѹ��������ʵ��*/
int encode(const char *name,const HuffmanCode &HC,char pbuffer[],const int Size,string filename)
{
	FILE *fp=fopen(name,"rb");//ֻ����ʽ
	pbuffer=(char*)malloc(Size*sizeof(char));
	if(!pbuffer)
	{
		cerr<<"���ٻ�����ʧ��"<<endl;
		return -1;
	}
	if (Size==0)
	{
		return -1;
	}
	//char cd[1000]={0};
	/*char *cd=(char*)malloc(Size*sizeof(char));*/
	string cd;
	int pos=0;
	int ch;
	while((ch=fgetc(fp))!=EOF)
	{
		//cout<<strlen(cd)<<endl;
		cd+=HC[ch+1];//HC���Ƶ�cd
	}
	fclose(fp);
	//��ʼѹ��
	int count=0;
	ofstream fout;
	string Comfile=filename=".huf";
	const char *target=Comfile.c_str();
	fout.open(target,std::ios::out|std::ios::app);
	for(int i=0;i<cd.size();i++)
	{
		char b=0x00;
		for(int j=0;j<8&&i<cd.length();j++,i++)
		{
			b=b<<1;
			if (cd.at(i)=='1')
				b=b|0x01;
		}
		i--;
		fout<<(char)b; // ���ַ�д���ļ�
		count++;
	}
	return count;
}

/*ѹ��ԭ�ļ�*/
int compress(const char *name)
{
	cout<<"��������ϣ��ѹ������ļ�����"<<endl;
	string filename;
	cin>>filename;
	
	FILE *fp=fopen(name,"rb");//ֻ����ʽ
	unsigned char ch=getc(fp);
	int w[256]={0};//����0
	int pSize=0;
	while(!feof(fp))
	{
		w[ch]++;
		pSize++;
		ch=fgetc(fp);
	}
	int aSize=pSize/8;
	cout<<"\n"<<endl;
	cout<<"/****************************************/"<<endl;
	cout<<"ԭ�ļ���СΪ��"<<aSize<<"�ֽ�"<<endl;
	cout<<"/****************************************/"<<endl;
	cout<<"\n"<<endl;
	/*cout<<"Byte	"<<"	weight"<<endl;
	for(int i=0;i<256;i++)
	{
	cout<<"0x"<<dec2hex(i)<<"		"<<w[i]<<endl;
	}*/
	fclose(fp);
	HuffmanTree HT;
	HuffmanCode HC;
	HuffmanCoding(HT,HC,w,256);

	/*��������õ��Ĺ����������ԭ�ļ����±�����ʵ��ѹ��*/
	int Size=0;
	for(int i=1;i<=256;i++)
	{
		Size+=w[i-1]*strlen(HC[i]);
	}
	int nSize=(Size%8)?Size/8+1:Size/8;//�ֽ���
	char pbuffer[10000];	
	//head shead;
	//Ҫ������������ŵ������Ȼ���������Ĵ���
	//����ԭ��Ӧ���ǽṹ�����ڴ��ֽڶ����ԭ��  ���BITMAPINFO�ṹ���ʱ����ܴ���Խ��
	int len=encode(name,HC,pbuffer,nSize,filename);
	cout<<"�����ļ��ɹ�"<<endl;
	cout<<"\n"<<endl;
	cout<<"/****************************************/"<<endl;
	cout<<"���ļ���С�ǣ�"<<len<<"�ֽ�"<<endl;
	float f=100*len/aSize;
	cout<<"ѹ�������ǣ�"<<f<<"%"<<endl;
	cout<<"/****************************************/"<<endl;
	return 0;
	//���к����ŵ�ʱ����ʾRun-Time Check Failure #2 - Stack around the variable 'shead' was corrupted.
}
