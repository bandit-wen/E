#include <iostream>
#include <string>
#include <fstream>
#include<iomanip>
#include "CGraph.h"
#include "CTourism.h"
using namespace std;


/*��ȡ�ļ���������������ͼ*/
void CTourism::CreateGraph()
{
	m_Graph.Init();
	ifstream fin("Vex.txt");
	Vex sVex;
	string line;
	if (!fin.is_open())  
	{ 
		cout << "�򿪶����ļ�ʧ�ܣ�";
	} 
	int count=0;
	int index=0;
	cout<<endl<<"/*******************������Ϣ����***********************/"<<endl;
	string num;//һ���ж��ټ�¼
	getline(fin,num);
	while (!fin.eof())  
	{  
		index++;
		getline(fin, line);//������ȡ�ļ�
		int size = line.length();
		//�õ����һ�����ֿ���������ȡ
		string vex1,vex2,vex3;
		if(count==0)
		{
			count++;
			vex1=line;
			sVex.num=atoi(vex1.c_str());
			cout<<"��"<<sVex.num<<"������";
		}
		else if(count==1)
		{
			count++;
			vex2=line;
			int len=vex2.length();
			strcpy(sVex.name,vex2.c_str());
			cout<<sVex.name<<"�������£�";
		}
		else if(count==2)
		{
			count=0;
			string desc=line;
			int len=desc.length();
			strcpy(sVex.desc,desc.c_str());
			cout<<sVex.desc<<endl;
			m_Graph.InsertVex(sVex);
		}
		if (index==3*atoi(num.c_str()))//indexÿ��ȡһ�ж�Ҫ��3����num����
		{break;}
	}
	cout<<"/*****************************************************/"<<endl<<endl;
	fin.close();
	ifstream fin2("Edge.txt");
	Edge edge;
	int edgenum=0;
	line="0";
	if (!fin2.is_open())  
	{ 
		cout << "�򿪱��ļ�ʧ�ܣ�";
	} 
	cout<<"/*******************·����Ϣ����***********************/"<<endl;
	while (!fin2.eof())  
	{  
		getline(fin2, line);//������ȡ�ļ�
		int size = line.length();
		//�õ����һ�����ֿ���������ȡ
		int count=0;
		string vex1,vex2,distance;
		for(int t=0;t<size;)
		{
			if(line[t]=='#')//�ж��ǿո�
			{
				count+=1;	
				t++;
			}
			else if(count==0)
			{
				while(line[t]!='#')
				{
					vex1+=line[t];
					t++;
				}
				edge.vex1=atoi(vex1.c_str());
				cout<<"����"<<edge.vex1<<"��";
			}
			else if(count==1)
			{
				while(line[t]!='#')
				{
					vex2+=line[t];
					t++;
				}
				edge.vex2=atoi(vex2.c_str());
				cout<<edge.vex2<<"�ľ�����";
			}
			else if(count==2)
			{
				while(t!=size)
				{
					distance+=line[t];
					t++;
				}
				edge.weight=atoi(distance.c_str());
				cout<<edge.weight<<endl;
			}
		}
		m_Graph.InsertEdge(edge);
	}
	cout<<"/***************************************************/"<<endl<<endl;
	fin2.close();
	cout<<"������������ͼ�ɹ���"<<endl<<endl;
}

/*��ѯָ��������Ϣ����ʾ�����ھ���ľ���*/
void CTourism::GetSpotInfo()
{
	Vex vex;
	int choice=0;
	cout<<endl<<"/*************************************************/"<<endl;
	cout<<std::left<<setw(20)<<"������"<<std::left<<setw(20)<<"��������"<<"��������"<<endl;
	for(int i=0;i<m_Graph.GetVexnum();i++)
	{
		vex=m_Graph.GetVex(i);
		cout<<std::left<<setw(20)<<vex.num<<std::left<<setw(20)<<vex.name<<vex.desc<<endl;
	}
	cout<<endl<<"/*************************************************/"<<endl<<endl;
	cout<<"��������Ҫ��ѯ�ľ�����"<<endl;
	cin>>choice;
	if(choice>=m_Graph.GetVexnum())
	{
		cout<<"��Ų���ȷ"<<endl;
		return;
	}
	Edge aEdge[100];
	int sum=m_Graph.FindEdge(choice,aEdge);
	cout<<endl<<"/*************************************************/"<<endl;
	cout<<"һ����"<<sum<<"�����ھ���"<<endl;
	cout<<std::left<<setw(20)<<"���ڵ�"<<std::left<<setw(20)<<"���ھ���"<<"����"<<endl;
	for(int i=0;i<sum;i++)
	{
		Edge edge=aEdge[i];
		cout<<std::left<<setw(20)<<m_Graph.GetVex(aEdge[i].vex2).name<<std::left<<setw(20)<<m_Graph.GetVex(aEdge[i].vex1).name<<aEdge[i].weight<<endl;
	}
	cout<<endl<<"/*************************************************/"<<endl<<endl;
}

/*��ѯ���ξ��㵼��·��*/
void CTourism::TravelPath()
{
	cout<<"/****************************************/"<<endl;
	cout<<"�����������ڵĵص㣺"<<endl;
	int choice;
	cin>>choice;
	if(choice>=m_Graph.GetVexnum())
	{cout<<"��Ŵ���"<<endl;}
	PathList List=new Path;
	PathList head=List;
	List->next=NULL;
	int num=20;
	while(num--)
	{
		List->vexs[num]=-1;
	}
	m_Graph.DFSTraverse(choice,List);
	for(head;head;head=head->next)
	{
		/*���п��н�����һ�����жϣ���Ȼ���һ���͵����ڶ���֮���п��ܲ�����ͨ*/
		if(m_Graph.m_aAdjMatrix[head->vexs[m_Graph.GetVexnum()-1]][head->vexs[m_Graph.GetVexnum()-2]]==0)
		{
			for(int j=0;j<m_Graph.GetVexnum();j++)
			{
				List->vexs[j]=-1;
			}
		}
		for (int i=0;head->vexs[i]>=0;i++)
		{
			Vex vex=m_Graph.GetVex(head->vexs[i]);
			if(head->vexs[i+1]>=0)
			{cout<<vex.name<<"->";}
			else
			{cout<<vex.name<<endl;}
		}
	}
	cout<<endl;
}

/*�����������������·��*/
void CTourism::FindShortPath()
{
	cout<<"/****************************************/"<<endl;
	cout<<"��������������ı�ţ�"<<endl;
	cout<<"��ʼ��"<<endl;
	int vex1,vex2;
	cin>>vex1;
	cout<<"Ŀ�ĵ�"<<endl;
	cin>>vex2;
	Edge aPath[100];
	m_Graph.FindShortPath(vex1,vex2,aPath);
	cout<<"���·��Ϊ��"<<endl;
	Vex vex=m_Graph.GetVex(vex1);
	cout<<vex.name;
	for (int i=0;aPath[i].weight>=0;i++)
	{
		vex=m_Graph.GetVex(aPath[i].vex2);
		cout<<"->"<<vex.name;
	}
	cout<<endl;
}

/*��ѯ�����·�滮ͼ*/
void CTourism::DesignPath()
{
	Edge aPath[20];
	m_Graph.FindMinTree(aPath);
	Vex vex1,vex2;
	int i=0;
	for(i=0;aPath[i].weight>=0;i++)
	{
		vex1=m_Graph.GetVex(aPath[i].vex1);
		vex2=m_Graph.GetVex(aPath[i].vex2);
		cout<<vex1.name<<"->"<<vex2.name<<"����"<<aPath[i].weight<<"�׵���"<<endl;
	}
}
