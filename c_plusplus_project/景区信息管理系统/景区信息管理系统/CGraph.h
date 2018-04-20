#include <iostream>
#ifndef CGRAPH_H
#define CGRAPH_H

/*����ṹ��*/
struct Vex
{
	int num;//������
	char name[20];//��������
	char desc[1024];//��������
};

/*�ߵĽṹ��*/
struct Edge
{
	int vex1;//�ߵĵ�һ������
	int vex2;//�ߵĵڶ�������
	int weight;//Ȩֵ
};

/*��������������·��*/
typedef struct Path
{
	int vexs[20];//����һ��·��
	Path *next;//ָ����һ��·��
}* PathList;

/*��Ķ���*/
class CGraph
{
private:
	
	Vex m_aVexs[20];//��������
	int m_nVexNum;//�������
	/*���������������*/
	void DFS(int nVex,bool aVisited[],int &nIndex,PathList &List);
public:
	int m_aAdjMatrix[20][20];//�ڽӾ���
	/*��ʼ��ͼ*/
	void Init();

	/*��������ӵ���������*/
	bool InsertVex(Vex sVex);

	/*���߱��浽�ڽӾ���*/
	bool InsertEdge(Edge sEdge);

	/*��ѯָ��������Ϣ*/
	Vex GetVex(int nVex);

	/*��ѯ��ָ�����������ı�*/
	int FindEdge(int nVex,Edge aEdge[]);

	/*��ȡ��ǰ������*/
	int GetVexnum();

	/*��ñ����Ľ��*/
	void DFSTraverse(int nVex,PathList &List);

	/*�������������·��*/
	int FindShortPath(int nVexStart,int nVexEnd,Edge aPath[]);

	/*������С������*/;
	int FindMinTree(Edge aPath[]);
};

#endif