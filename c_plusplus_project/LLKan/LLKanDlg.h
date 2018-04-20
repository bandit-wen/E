
// LLKanDlg.h : header file
//

#pragma once
#include "atltypes.h"

#define MAXX 9 //����
#define MAXY 14 //����


// CLLKanDlg dialog
class CLLKanDlg : public CDialogEx
{
// Construction
public:
	CLLKanDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	enum { IDD = IDD_LLKAN_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support

// Implementation
protected:
	HICON m_hIcon; //ͼ����

	// Generated message map functions
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
private:
	
	
	CPtrArray m_btnGroup; //Button ��
public:
	int m_typeNum; //ͼƬ������
	int m_time; //ʣ��ʱ��
	int map[MAXX][MAXY]; //��ͼ����洢ͼƬ����
	void InitMap(int  map[][MAXY]);
	void ShowMap(int  map[][MAXY]);
	afx_msg void OnPaint();
private:
	
public:
	afx_msg void OnBnClickedStart();
	afx_msg HBRUSH OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor);

//	afx_msg void OnStnClickedLine();
	afx_msg void OnStnClickedLine();
	afx_msg void OnBnClickedOk();
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	CPoint pt1; //��·��ʱ������β���
	CPoint pt2;
	CPoint pt3;
	CPoint pt4;
	afx_msg void OnBnClickedCancel();
	BOOL IsWin(void);
	afx_msg void OnBnSwap();
	afx_msg void OnBnTips();
	int m_score; //��¼����
	afx_msg void OnBnRecord();
};
