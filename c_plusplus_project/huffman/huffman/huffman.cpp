#include <iostream>
#include <stdio.h>
#include<string>
#include<fstream>
#include <sstream>  
#include <iomanip>
#include "compress.h"
#include "huffman.h"
using namespace std;


/*�ҵ���С�Ľڵ�*/
int min1st(HuffmanTree &HT,int size)
{
	int s1;
	int min=999;
	for(int j=1;j<=size;j++)
	{
		if(HT[j].parent==0)//�ҵ���һ��û��ʹ�ù��Ľڵ�
		{
			min=HT[j].weight;//����Сֵ����  
			break;  
		}
	}
	for(int p=1;p<=size;++p) 
	{
		if(HT[p].parent==0&&min>=HT[p].weight)//�����δ��ʹ�õĽڵ��ȨֵС��Ŀǰ����Сֵ
		{
			s1=p;  
			min=HT[p].weight;  
		}
	}
	return s1;
}

/*�ҵ��ڶ�С�Ľڵ�*/
int min2rd(HuffmanTree &HT,int s1,int i)
{
	int s2=0;
	int min=999;
	for(int j=1;j<=i;j++)
	{
		if(HT[j].parent==0&&min>=HT[j].weight)
			if(j==s1)//����s1�Ļ�
				continue;
			else
			{
				s2=j;
				min=HT[j].weight;
			}
	}
	return s2;
}

/*�ڴ���huffman���Ĺ������ҵ�������СȨֵ�Ľڵ㣬���ɷ�ƽ�����������ѡ��ʽ*/
void Select(HuffmanTree &HT,int i,int &s1,int &s2)
{
	s1=min1st(HT,i);
	s2=min2rd(HT,s1,i);
}

/*����ƽ�����������ѡ��ʽ*/
int selectBalance(HuffmanTree pHT, int size)
{
	int Value=65535;//��Сֵ
	int num=0;//Ԫ�����
	//�ҵ���СȨֵ��Ԫ�����
	for(int i=1;i<=size;i++)
	{
		if(pHT[i].parent==0&&pHT[i].weight<Value)
		{
			Value=pHT[i].weight;
			num=i;
		}
	}
	return num;
}


/*�������������Լ�����������*/
void HuffmanCoding(HuffmanTree &HT,HuffmanCode &HC,int *w,int n)//��Ҷ�ڵ㿪ʼ
{
	/*���洴����������*/
	/*HT�����˸����ڵ��Ȩ�أ����ڵ㣬���ӽڵ�*/
	ofstream fout("HufTree&'scode.txt");
	int s1,s2;
	int m;
	int i;
	HuffmanTree p;
	if(n<=1)//Ҷ�ڵ�С�ڵ���1��������
	{
		cout<<"Ҷ�ڵ����"<<endl;
		return;
	}
	m=2*n-1;//һ��
	HT=(HuffmanTree)malloc((m+1)*sizeof(HuffmanNode));//�ո�0�ŵ�Ԫ//HT��һ�����飬ÿ��Ԫ��ֻ��һ���ڵ����
	memset(HT,0,(m+1)*sizeof(HuffmanNode));//�����нڵ��ʼ��Ϊ0  
	for(int i=1;i<=n;i++)  
	{  
		HT[i].weight=*w++;//��ʼ�����ڵ�Ȩֵ
		//cout<<HT[i].weight<<endl;
	}  

	/*���·������ɵ��Ƿ�ƽ��Ĺ�������*/
	//for(i=n+1;i<=m;++i)
	//{
	//	Select(HT,i-1,s1,s2);//�ӸղŸ�ֵ�Ľڵ���ѡ����С����
	//	HT[s1].parent=i;
	//	HT[s2].parent=i;
	//	HT[i].lchild=s1;
	//	HT[i].rchild=s2;
	//	HT[i].weight=HT[s1].weight+HT[s2].weight;
	//}

	for(i=n+1;i<=m;i++)/*���·������ɵ���ƽ��Ĺ�������*/
	{
		int s1,s2;
		s1=selectBalance(HT,i-1);
		HT[s1].parent=i;
		s2=selectBalance(HT,i-1);
		HT[s2].parent=i;
		HT[i].lchild=s1;
		HT[i].rchild=s2;
		HT[i].weight=HT[s1].weight+HT[s2].weight;
	}

	for(i=1;i<=m;i++)
	{
		fout<<"��"<<i<<"���ڵ��˫��Ϊ��"<<HT[i].parent<<"  ����Ϊ��"<<HT[i].lchild<<"  �Һ���Ϊ��"<<HT[i].rchild<<"  Ȩ��Ϊ:"<<HT[i].weight<<endl;
	}
	/*����Ҷ�ӽڵ�Ĺ���������HC*/
	/*HC������Ǹ����ַ��ı���*/
	HC=(HuffmanCode)malloc((n+1)*sizeof(char *));
	char *cd;
	int j,c,q,start;
	cd=(char*)malloc(n*sizeof(char));
	cd[n-1]='\0';
	for(j=1;j<=n;j++)//HC��1��~��n��������
	{
		start=n-1; //cd��ÿ�δ�ĩβ��ʼ
		c=j;
		q=HT[j].parent;//p��n+1��2n-1
		while(q) //�ظ��׷������,ֱ��Ϊ0
		{
			start--;//������ǰ��ֵ
			if(HT[q].lchild==c)//��������ͬ,��0
				cd[start]='0';
			else //������1
				cd[start]='1';
			c=q;
			q=HT[q].parent;
		}
		HC[j]=(char *)malloc((n-start)*sizeof(char));
		strcpy(HC[j],&cd[start]);
		//ascll��ǰ32����һ�㣬���ִ�1��ʼ�����Լ�33
		fout<<(char)(' '+j-33)<<"�ı���Ϊ:"<<HC[j]<<endl;//�� ����32
		//cout<<(char)(' '+j-33)<<"�ı���Ϊ:"<<HC[j]<<endl;
	}
	free(cd);//�ͷ�cd�ڴ�
}

/*��intת��16�����ַ���*/  
string dec2hex(int i)
{  
	stringstream ioss; //�����ַ�����  
	string s_temp; //���ת�����ַ�  
	ioss << setiosflags(ios::uppercase) << hex << i; //��ʮ����(��д)��ʽ���  
	ioss >> s_temp;  
	return s_temp;  
}  
