// LLKSetting.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "LLK.h"
#include "LLKSetting.h"
#include "afxdialogex.h"


// LLKSetting �Ի���

IMPLEMENT_DYNAMIC(LLKSetting, CDialogEx)

int LLKSetting::main=1;
int LLKSetting::music=1;
LLKSetting::LLKSetting(CWnd* pParent /*=NULL*/)
	: CDialogEx(LLKSetting::IDD, pParent)
{

}

LLKSetting::~LLKSetting()
{
}

void LLKSetting::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(LLKSetting, CDialogEx)
	ON_BN_CLICKED(IDC_RADIO1, &LLKSetting::OnBnClickedRadio1)
	ON_BN_CLICKED(IDC_RADIO2, &LLKSetting::OnBnClickedRadio2)
	ON_BN_CLICKED(IDC_RADIO3, &LLKSetting::OnBnClickedRadio3)
	ON_BN_CLICKED(IDC_RADIO4, &LLKSetting::OnBnClickedRadio4)
	ON_BN_CLICKED(IDOK, &LLKSetting::OnBnClickedOk)
END_MESSAGE_MAP()


// LLKSetting ��Ϣ�������


void LLKSetting::OnBnClickedRadio1()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	LLKSetting::main=1;
}


void LLKSetting::OnBnClickedRadio2()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	LLKSetting::main=2;
}


void LLKSetting::OnBnClickedRadio3()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	LLKSetting::music=1;
}


void LLKSetting::OnBnClickedRadio4()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	LLKSetting::music=2;
}


void LLKSetting::OnBnClickedOk()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	CDialogEx::OnOK();
}


BOOL LLKSetting::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  �ڴ���Ӷ���ĳ�ʼ��
	if(LLKSetting::main==1)
	{
		CButton* radio=(CButton*)GetDlgItem(IDC_RADIO1);
		radio->SetCheck(1);
	}
	else
	{
		CButton* radio=(CButton*)GetDlgItem(IDC_RADIO2);
		radio->SetCheck(1);
	}
	
	if(LLKSetting::music==1)
	{
		CButton* radio=(CButton*)GetDlgItem(IDC_RADIO3);
		radio->SetCheck(1);
	}
	else
	{
		CButton* radio=(CButton*)GetDlgItem(IDC_RADIO4);
		radio->SetCheck(1);
	}
	return TRUE;  // return TRUE unless you set the focus to a control
	// �쳣: OCX ����ҳӦ���� FALSE
}
