#include <iostream>
#pragma once

/*����ṹ��*/
struct Vex
{
	int x;
	int y;
	int pic;
};
/*�ߵĽṹ��*/
struct Edge
{
	int vex1;//�ߵĵ�һ������
	int vex2;//�ߵĵڶ�������
};
typedef struct Path
{
	int vexs[90];//����һ��·��
}* PathList;
class Graph
{
public:
	Vex V[90];//��������
	int adj[90][90];//�ڽӾ���
};