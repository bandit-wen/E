#pragma once


// LLKRecordDlg �Ի���

class LLKRecordDlg : public CDialogEx
{
	DECLARE_DYNAMIC(LLKRecordDlg)

public:
	LLKRecordDlg(CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~LLKRecordDlg();

// �Ի�������
	enum { IDD = IDD_LLKRECORDDLG };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��
	DECLARE_MESSAGE_MAP()
public:
	virtual BOOL OnInitDialog();
	CListCtrl m_list;
	afx_msg void OnItemchangedList(NMHDR *pNMHDR, LRESULT *pResult);
	void ReadRecord(void);
	afx_msg void OnBnClickedCancel();
	afx_msg void OnBnClickedClean();
};
