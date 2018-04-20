// LLKAddDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "LLK.h"
#include "LLKLevelModel.h"
#include "LLKAddDlg.h"
#include "afxdialogex.h"


// LLKAddDlg �Ի���

IMPLEMENT_DYNAMIC(LLKAddDlg, CDialogEx)

LLKAddDlg::LLKAddDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(LLKAddDlg::IDD, pParent)
{
	m_name = _T("");
	m_score = 0;
	m_level = 0;
}

LLKAddDlg::~LLKAddDlg()
{
}

void LLKAddDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Text(pDX, IDC_EDIT1, m_name);
	DDX_Text(pDX, IDC_EDIT2, m_score);
	DDX_Text(pDX, IDC_EDIT3, m_level);
}


BEGIN_MESSAGE_MAP(LLKAddDlg, CDialogEx)
	ON_BN_CLICKED(IDOK, &LLKAddDlg::OnBnClickedOk)
END_MESSAGE_MAP()


// LLKAddDlg ��Ϣ�������


void LLKAddDlg::OnBnClickedOk()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	CDialogEx::OnOK();
	UpdateData(TRUE);

	if(m_name != _T(""))
	{
		CStdioFile mFile; 
		CFileException mExcept;
		if(!mFile.Open(_T("record.txt"),CFile::modeWrite,&mExcept))
			mFile.Open(_T("record.txt"),CFile::modeCreate|CFile::modeWrite,&mExcept);
		CString str;
		mFile.SeekToEnd();
		//����¼д���ļ��������
		str.Format(_T("%s\n"),m_name);
		mFile.WriteString(str);
		str.Format(_T("%d\n"),m_score);
		mFile.WriteString(str);
		str.Format(_T("%d\n"), m_level);
		mFile.WriteString(str);
		CDialog::OnOK();
	}
	else 
		AfxMessageBox(_T("����������!"));
	//CDialogEx::OnOK();
}


BOOL LLKAddDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();
	
	// TODO:  Add extra initialization here
	//ͨ�ظ�����ָ��parent����ȡ���� �� �ؿ�����m_typeNum-1��
	LLKLevelModel *parent = (LLKLevelModel *)GetParent();
	m_level = parent->m_typeNum-1;
	m_score = parent->m_score;
	UpdateData(FALSE);
	return TRUE;  // return TRUE unless you set the focus to a control
	// EXCEPTION: OCX Property Pages should return FALSE
}


