#pragma once


// LLKSetting �Ի���

class LLKSetting : public CDialogEx
{
	DECLARE_DYNAMIC(LLKSetting)

public:
	LLKSetting(CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~LLKSetting();

// �Ի�������
	enum { IDD = IDD_LLKSETTING };
	static int main;
	static int music;
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnBnClickedRadio1();
	afx_msg void OnBnClickedRadio2();
	afx_msg void OnBnClickedRadio3();
	afx_msg void OnBnClickedRadio4();
	afx_msg void OnBnClickedOk();
	virtual BOOL OnInitDialog();
};
