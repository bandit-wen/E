#include <iostream>
#include "compress.h"
#include "huffman.h"
using namespace std;
/*������*/
int main()
{	
	cout<<"/*****************������ѹ��ͼƬ*********************/"<<endl;
	cout<<"�������ļ�����"<<endl;
	/*
	misty.bmp
	forest.bmp
	���㸴��
	*/
	char name[256];	
	cin>>name;
	cout<<endl;
	compress(name);
	cout<<"\n"<<endl;
	cout<<"ѹ�����"<<endl<<endl;
	system("pause");
	return 0;	
}