
// LLKDlg.h : ͷ�ļ�
//

#pragma once


// CLLKDlg �Ի���
class CLLKDlg : public CDialogEx
{
// ����
public:
	CLLKDlg(CWnd* pParent = NULL);	// ��׼���캯��
// �Ի�������
	enum { IDD = IDD_LLK_DIALOG };
	static int relaxFlag;
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV ֧��


// ʵ��
protected:
	HICON m_hIcon;

	// ���ɵ���Ϣӳ�亯��
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedButtonLevel();
	afx_msg void OnBnClickedButtonBasic();
	afx_msg void OnBnClickedButtonRelax();
	afx_msg void OnBnClickedButtonRank();
	afx_msg void OnBnClickedButtonSetting();
	afx_msg void OnBnClickedButtonHelp();
};
