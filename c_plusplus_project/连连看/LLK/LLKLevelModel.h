#pragma once
#include "afxwin.h"
#include "global.h"

#define MAXX 9 //����
#define MAXY 10 //����
// LLKLevelModel �Ի���

class LLKLevelModel : public CDialogEx
{
	DECLARE_DYNAMIC(LLKLevelModel)

public:
	LLKLevelModel(CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~LLKLevelModel();

// �Ի�������
	enum { IDD = IDD_DIALOG_LEVELMODEL };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

	DECLARE_MESSAGE_MAP()
private:
	CPtrArray m_btnGroup; //Button ��
public:
	int m_typeNum; //ͼƬ������
	int m_time; //ʣ��ʱ��
	int m_score; //��¼����
	int map[MAXX][MAXY]; //��ͼ����洢ͼƬ����
	static Graph G;
	void InitMap(int  map[][MAXY]);
	void ShowMap(Graph G);
	afx_msg void OnPaint();
	afx_msg void OnBnClickedButtonBegin();
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	BOOL IsWin(void);
	CPoint pt1; //��·��ʱ������β���
	CPoint pt2;
	CPoint pt3;
	CPoint pt4;
	afx_msg void OnBnClickedButtonRearray();
	afx_msg void OnBnClickedButtonTips();
	afx_msg void OnBnClickedButtonPause();
	afx_msg void OnBnClickedButtonHelp();
	CButton tool;
	virtual BOOL OnInitDialog();
	afx_msg void OnBnClickedButtonTool();
	afx_msg void OnBnClickedButtonSetting();
};
