#pragma once
#pragma once
#include "atltypes.h"
#include "LLKDlg.h"
#include "LLKLevelModel.h"

// LLKButton

class LLKButton : public CButton
{
	DECLARE_DYNAMIC(LLKButton)

public:
	LLKButton();
	virtual ~LLKButton();

protected:
	DECLARE_MESSAGE_MAP()
	public:
	int m_ID; //��ť�����ͣ�����ť��ͼƬ������
	CPoint m_location; //��ť��Ӧ��map�е�λ��
public:
	LLKButton(int type, CPoint point);
	Graph readj(Graph G);
	BOOL findPath(CPoint p1, CPoint p2);
	BOOL BFS(Graph G,int index1,int index2);
	static LLKButton* ms_firstBtn; //��¼����ѡ��Ҫ������������ť
	static LLKButton* ms_secondBtn; 
	static CPoint ms_ptCross1;  //�����յ��λ��
	static CPoint ms_ptCross2;
	static LLKLevelModel* parent;  //�����ڣ������ڣ���ָ��
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	BOOL FindLine(CPoint p1, CPoint p2); //Ѱ��·�����㷨
	BOOL FindOneConner(CPoint p1, CPoint p2);
	BOOL FindSide(CPoint p1, CPoint p2);
	BOOL FindTwoConner(CPoint p1, CPoint p2);

};


