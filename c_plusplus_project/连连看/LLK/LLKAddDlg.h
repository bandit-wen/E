#pragma once


// LLKAddDlg �Ի���

class LLKAddDlg : public CDialogEx
{
	DECLARE_DYNAMIC(LLKAddDlg)

public:
	LLKAddDlg(CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~LLKAddDlg();

// �Ի�������
	enum { IDD = IDD_LLKADDDLG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedOk();
	CString m_name;
	int m_score;
	int m_level;
	virtual BOOL OnInitDialog();
};
