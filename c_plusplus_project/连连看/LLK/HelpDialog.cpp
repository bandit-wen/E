// HelpDialog.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "LLK.h"
#include "HelpDialog.h"
#include "afxdialogex.h"


// CHelpDialog �Ի���

IMPLEMENT_DYNAMIC(CHelpDialog, CDialogEx)

	CHelpDialog::CHelpDialog(CWnd* pParent /*=NULL*/)
	: CDialogEx(CHelpDialog::IDD, pParent)
{

}

CHelpDialog::~CHelpDialog()
{
}

void CHelpDialog::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_SCROLLBAR2, m_scroll);
}


BEGIN_MESSAGE_MAP(CHelpDialog, CDialogEx)
	ON_WM_VSCROLL()
	ON_WM_PAINT()
END_MESSAGE_MAP()


// CHelpDialog ��Ϣ�������


void CHelpDialog::OnVScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar)
{
	// TODO: �ڴ������Ϣ�����������/�����Ĭ��ֵ
	int pos = m_scroll.GetScrollPos();    // ��ȡˮƽ��������ǰλ��  

	switch (nSBCode)   
	{   
	case SB_LINEUP:   
		pos -= 1;   
		break;   
	case SB_LINEDOWN:   
		pos  += 1;   
		break;    
	case SB_PAGEUP:   
		pos -= 10;   
		break;   
	case SB_PAGEDOWN:   
		pos  += 10;   
		break;    
	case SB_TOP:   
		pos = 1;   
		break;   
	case SB_BOTTOM:   
		pos = 100;   
		break;     
	case SB_THUMBPOSITION:   
		pos = nPos;   
		break;    
	default:   
		SetDlgItemInt(IDC_SCROLLBAR2, pos);  
		return;   
	}   
	m_scroll.SetScrollPos(pos); 
	CDialogEx::OnVScroll(nSBCode, nPos, pScrollBar);

	int cx, cy;  
	CImage image;  
	CRect rect;  
	//����·������ͼƬ  
	image.Load(_T("res\\help.bmp"));  
	//��ȡͼƬ�Ŀ� �߶�  
	cx=image.GetWidth();  
	cy=image.GetHeight();  
	//��ȡPicture Control�ؼ��Ĵ�С  
	GetDlgItem(IDC_PICTURE)->GetWindowRect(&rect);  
	//���ͻ���ѡ�е��ؼ���ʾ�ľ���������  
	ScreenToClient(&rect);  
	//�����ƶ����ؼ���ʾ������  
	GetDlgItem(IDC_PICTURE)->MoveWindow(rect.left, rect.top, cx, cy, TRUE);  
	CWnd *pWnd=NULL;  
	pWnd=GetDlgItem(IDC_PICTURE);//��ȡ�ؼ����  
	pWnd->GetClientRect(&rect);//��ȡ���ָ��ؼ�����Ĵ�С  
	CDC *pDC=NULL;  
	pDC=pWnd->GetDC();//��ȡpicture��DC
    CDC memDC;//����һ���豸����
    memDC.CreateCompatibleDC(pDC);//�������ݵ��豸������
    CBitmap bmp;//����λͼ����
    bmp.LoadBitmap(IDB_BITMAP13);//����λͼ
    memDC.SelectObject(&bmp);//ѡ��λͼ����
    pDC->BitBlt(0,0,800,600,&memDC,1,pos,SRCCOPY);//����λͼ
}


BOOL CHelpDialog::OnInitDialog(void)
{
	CDialogEx::OnInitDialog();

	// TODO:  Add extra initialization here  
	m_scroll.SetScrollRange(1,200);   
	m_scroll.SetScrollPos(1);   
	return TRUE;
}


void CHelpDialog::OnPaint()
{
	CPaintDC dc(this); // device context for painting
	// TODO: �ڴ˴������Ϣ����������
	// ��Ϊ��ͼ��Ϣ���� CDialogEx::OnPaint()
	int cx, cy;  
	CImage image;  
	CRect rect;  
	//����·������ͼƬ  
	image.Load(_T("res\\help.bmp"));  
	//��ȡͼƬ�Ŀ� �߶�  
	cx=image.GetWidth();  
	cy=image.GetHeight();  
	//��ȡPicture Control�ؼ��Ĵ�С  
	GetDlgItem(IDC_PICTURE)->GetWindowRect(&rect);  
	//���ͻ���ѡ�е��ؼ���ʾ�ľ���������  
	ScreenToClient(&rect);  
	//�����ƶ����ؼ���ʾ������  
	GetDlgItem(IDC_PICTURE)->MoveWindow(rect.left, rect.top, cx, cy, TRUE);  
	CWnd *pWnd=NULL;  
	pWnd=GetDlgItem(IDC_PICTURE);//��ȡ�ؼ����  
	pWnd->GetClientRect(&rect);//��ȡ���ָ��ؼ�����Ĵ�С  
	CDC *pDc=NULL;  
	pDc=pWnd->GetDC();//��ȡpicture��DC  
	image.Draw(pDc->m_hDC, rect);//��ͼƬ���Ƶ�picture��ʾ��������  
	ReleaseDC(pDc);
}
