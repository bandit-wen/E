#include <iostream>
#ifndef CTOURISM_H
#define CTOURISM_H

class CTourism
{
private:
	CGraph m_Graph;
public:
	/*��ȡ�ļ���������������ͼ*/
	void CreateGraph();

	/*��ѯָ��������Ϣ����ʾ�����ھ���ľ���*/
	void GetSpotInfo();

	/*��ѯ���ξ��㵼��·��*/
	void TravelPath();

	/*�����������������·��*/
	void FindShortPath();

	/*��ѯ�����·�滮ͼ*/
	void DesignPath();
};

#endif