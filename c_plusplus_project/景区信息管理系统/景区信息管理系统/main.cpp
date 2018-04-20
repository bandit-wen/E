#include <iostream>
#include <fstream>
#include "CGraph.h"
#include "CTourism.h"
using namespace std;
void menu()
{
	cout<<"/*****************��ӭ���뾰����Ϣ����ϵͳ***************/"<<endl;
	cout<<"1:������������ͼ"<<endl;
	cout<<"2:��ѯ������Ϣ"<<endl;
	cout<<"3:���ξ��㵼��"<<endl;
	cout<<"4:�������·��"<<endl;
	cout<<"5:�����·�滮"<<endl;
	cout<<"0:�˳�"<<endl;
	cout<<"��������ϣ�����еĲ���:"<<endl;
}
int main()
{
	CTourism ctourism;
	while(1)
	{
		menu();
		int choice;
		cin>>choice;
		switch(choice)
		{
		case 1:
			ctourism.CreateGraph();
			break;
		case 2:
			ctourism.GetSpotInfo();
			break;
		case 3:
			ctourism.TravelPath();
			break;
		case 4:
			ctourism.FindShortPath();
			break;
		case 5:
			ctourism.DesignPath();
			break;
		case 0:
			return 0;
		default:
			cout<<"������ı�Ų���ȷ!"<<endl;
			break;
		}
	}
	return 0;
}