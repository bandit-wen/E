#include <iostream>
#include <fstream>
#include <string>
#include "CGraph.h"
#include "CTourism.h"
using namespace std;


/*��ʼ��ͼ*/
void CGraph::Init()
{
	memset(m_aAdjMatrix,0,400*sizeof(int));
	memset(m_aVexs,0,20*sizeof(Vex));
	m_nVexNum=0;
};

/*��������ӵ���������*/
bool CGraph::InsertVex(Vex sVex)
{
	if(m_nVexNum==20)
	{
		cout<<"��������"<<endl;
		return false;
	}
	m_aVexs[m_nVexNum++]=sVex;
	return true;
};

/*���߱��浽�ڽӾ���*/
bool CGraph::InsertEdge(Edge sEdge)
{
	if(sEdge.vex1<0||sEdge.vex1>=20||sEdge.vex2<0||sEdge.vex2>=20)
	{
		return false;
	}
	m_aAdjMatrix[sEdge.vex1][sEdge.vex2]=sEdge.weight;
	m_aAdjMatrix[sEdge.vex2][sEdge.vex1]=sEdge.weight;
	return true;
};

/*��ѯָ��������Ϣ*/
Vex CGraph::GetVex(int nVex)
{
	return m_aVexs[nVex];
}

/*��ѯ��ָ�����������ı�*/
int CGraph::FindEdge(int nVex,Edge aEdge[])
{
	int k=0;
	for(int i=0;i<m_nVexNum;i++)
	{
		if(m_aAdjMatrix[i][nVex]!=0)
		{
			aEdge[k].vex1=i;
			aEdge[k].vex2=nVex;
			aEdge[k].weight=m_aAdjMatrix[i][nVex];
			k++;
		}
	}
	return k;
}

/*��ȡ��ǰ������*/
int CGraph::GetVexnum()
{
	return m_nVexNum;
}

/*��ñ����Ľ��*/
void CGraph::DFSTraverse(int nVex,PathList &List)
{
	int nIndex=0;
	bool aVisited[20]={false};
	DFS(nVex,aVisited,nIndex,List);
}

/*���������������*/
//�˺������ϵ�˵���������޸�
void CGraph::DFS(int nVex,bool aVisited[],int &nIndex,PathList &List)
{
	/*��һ�δ������⣬���������һ����ͨ�������꣬�˳�ѭ����
	����һ����ͨ����ͨ��û�з��ʹ��ĵ�����У�����*/
	/*�籾�����е�2��Ĳ�ѯ*/
	/*aVisited[nVex]=true;
	List->vexs[nIndex++]=nVex;
	Edge aEdge[20];
	int k=FindEdge(nVex,aEdge);
	for(int i=0;i<k;i++)
	{
	int j=aEdge[i].vex1;
	if(m_aAdjMatrix[j][nVex]!=0&&!aVisited[j])
	{
	DFS(j,aVisited,nIndex,List);
	}
	}*/

	/*��һ·���޸���ɰ�*/
	//aVisited[nVex]=true;
	//List->vexs[nIndex++]=nVex;
	//Edge aEdge[20];
	//int k=FindEdge(nVex,aEdge);
	//int i;
	//for(i=0;i<k;i++)
	//{
	//	int j=aEdge[i].vex1;
	//	if(m_aAdjMatrix[j][nVex]!=0&&!aVisited[j])
	//	{
	//		DFS(j,aVisited,nIndex,List);
	//	}
	//}
	//int p=0;
	//for (int j=0;List->vexs[j]!=-1;j++)
	//{
	//	p++;//��������Ϊֹ���еĶ�����
	//}
	//if(p!=m_nVexNum)
	//{
	//	List->vexs[--nIndex]=-1;//���ղ����е��߳�ȥ
	//	aVisited[nVex]=0;//���ղŷ��ʹ�������Ϊû�з��ʹ�
	//}

	int p=0;
	aVisited[nVex]=true;
	List->vexs[nIndex++]=nVex;
	for(int i=0;i<m_nVexNum;i++)
	{
		if(aVisited[i])
			p++;
	}
	if(p==m_nVexNum)//ȫ�����ʹ���
	{
		List->next=new Path;
		for(int i=0;i<p;i++)
		{
			List->next->vexs[i]=List->vexs[i];//��һ��������·�������ع���̽
		}
		List=List->next;
		List->next=NULL;
	}
	else
	{
		for(int i=0;i<m_nVexNum;i++)
		{
			if(m_aAdjMatrix[i][nVex]!=0&&!aVisited[i])
			{
				DFS(i,aVisited,nIndex,List);
				aVisited[i]=false;
				nIndex--;
			}
		}
	}
}

/*�������������·��*/
/*��ѡ������ʼ�������ĵ�������ģ�Ȼ��ȷ����������������·����Ȼ��Ժ���һ��
�����ĵ㣬����ԭʼֵ��͵ıȽϣ����£�Ȼ�����ҳ�������������ʼ������ĵ㣬��ʼ
ѭ��*/
int CGraph::FindShortPath(int nVexStart,int nVexEnd,Edge aPath[])
{
	int v=0;
	int nShortPath[20][20];//�������·�����е��±�����յ㣬�������Ҳ���-1����;����  
	int nShortDistance[20];//������ʼ�㵽���е����̾���   
	bool aVisited[20];
	for(v=0;v<m_nVexNum;v++)
	{
		aVisited[v]=false; 
		if(m_aAdjMatrix[nVexStart][v]!=0)      
			nShortDistance[v]=m_aAdjMatrix[nVexStart][v];
		else           
			nShortDistance[v]=65535;//��·
		nShortPath[v][0]=nVexStart;
		for(int j=1;j<m_nVexNum;j++)
		{
			nShortPath[v][j]=-1;  
		}
	}   
	aVisited[nVexStart]=true; 
	int min;  
	for(int i=1;i<m_nVexNum;i++)
	{
		min=65535;
		bool IS=false;     
		for(int j=0;j<m_nVexNum;j++) 
		{    
			if(aVisited[j]==false)   
			{
				if(nShortDistance[j]<min)
				{
					v=j;     
					min=nShortDistance[j];  
					IS=true;  
				}
			}
		}  
		if(IS==false)
		{
			break; 
		}
		aVisited[v]=true;  
		nShortPath[v][i]=v;
		for(int w=0;w<m_nVexNum;w++)
		{       
			if(aVisited[w]==false&&(min+m_aAdjMatrix[v][w]<nShortDistance[w])&&m_aAdjMatrix[v][w]!=0)   
			{         
				nShortDistance[w]=min+m_aAdjMatrix[v][w];
				for(int i=0;i<m_nVexNum;i++)   
				{      
					nShortPath[w][i]=nShortPath[v][i];
				}
			}
		}
	}
	int nIndex=0;
	int nVex1=nVexStart;   
	for(int i=1;i<m_nVexNum;i++) 
	{
		if(nShortPath[nVexEnd][i]!=-1) 
		{
			aPath[nIndex].vex1=nVex1;
			aPath[nIndex].vex2=nShortPath[nVexEnd][i]; 
			aPath[nIndex].weight=m_aAdjMatrix[aPath[nIndex].vex1][aPath[nIndex].vex2];
			nVex1=nShortPath[nVexEnd][i]; 
			nIndex++;
		}
	}
	return nIndex;
}

/*������С������*/
/*0�����ʣ����ҳ���0����ĵ㣬Ȼ��õ㱻���ʣ�Ȼ����ҳ�������������ĵ㣬Ȼ��õ�
�����ʣ����ҳ���������������ĵ㣬�Դ�����*/
int CGraph::FindMinTree(Edge aPath[])
{
	bool aVisited[20];
	for(int i=0;i<20;i++)
	{
		aVisited[i]=false;
	}
	aVisited[0]=true;//0������뵽������  
	int min;
	int nVex1,nVex2;
	for(int k=0;k<m_nVexNum-1;k++)//��С������һ����·����
	{
		min=65535;
		for(int i=0;i<m_nVexNum;i++)
		{
			if(aVisited[i])    
			{
				for(int j=0;j<m_nVexNum;j++)
				{
					if(!aVisited[j])  
					{
						if((m_aAdjMatrix[i][j]<min)&&(m_aAdjMatrix[i][j]!=0))  
						{
							nVex1=i;  
							nVex2=j;
							min=m_aAdjMatrix[i][j];//�ҳ���̵ı�       
						}
					}
				}
			}
		}     
		//������̱ߵ���������   
		aPath[k].vex1=nVex1;
		aPath[k].vex2=nVex2;
		aPath[k].weight=m_aAdjMatrix[nVex1][nVex2];     //������������뵽����
		aVisited[nVex1]=true; 
		aVisited[nVex2]=true;
	}
	return 0;
}


