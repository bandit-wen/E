#pragma once
#include "atltypes.h"
#include "LLKanDlg.h"

// CLLKanButton

class CLLKanButton : public CButton
{
	DECLARE_DYNAMIC(CLLKanButton)

public:
	CLLKanButton();
	virtual ~CLLKanButton();

protected:
	DECLARE_MESSAGE_MAP()
public:
	int m_ID; //��ť�����ͣ�����ť��ͼƬ������
	CPoint m_location; //��ť��Ӧ��map�е�λ��
public:
	CLLKanButton(int type, CPoint point);

	static CLLKanButton* ms_firstBtn; //��¼����ѡ��Ҫ������������ť
	static CLLKanButton* ms_secondBtn; 
	static CPoint ms_ptCross1;  //�����յ��λ��
	static CPoint ms_ptCross2;
	static CLLKanDlg* parent;  //�����ڣ������ڣ���ָ��
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	BOOL FindLine(CPoint p1, CPoint p2); //Ѱ��·�����㷨
	BOOL FindOneConner(CPoint p1, CPoint p2);
	BOOL FindSide(CPoint p1, CPoint p2);
	BOOL FindTwoConner(CPoint p1, CPoint p2);
};


