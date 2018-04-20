// LLKLevelModel.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "LLK.h"
#include "LLKDlg.h"
#include "LLKLevelModel.h"
#include "LLKButton.h"
#include "LLKAddDlg.h"
#include "LLKSetting.h"
#include "HelpDialog.h"
#include "afxdialogex.h"
#include "global.h"
#include <windows.h>
#include <mmsystem.h>

#define IDC_BLOCK 10000
int sig=0;
int stop_time=0;
Graph LLKLevelModel::G;
// LLKLevelModel �Ի���

IMPLEMENT_DYNAMIC(LLKLevelModel, CDialogEx)

	LLKLevelModel::LLKLevelModel(CWnd* pParent /*=NULL*/)
	: CDialogEx(LLKLevelModel::IDD, pParent)
{

}

LLKLevelModel::~LLKLevelModel()
{
}

void LLKLevelModel::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_BUTTON_TOOL, tool);
}


BEGIN_MESSAGE_MAP(LLKLevelModel, CDialogEx)
	ON_BN_CLICKED(IDC_BUTTON_BEGIN, &LLKLevelModel::OnBnClickedButtonBegin)
	ON_WM_PAINT()
	ON_WM_TIMER()
	ON_BN_CLICKED(IDC_BUTTON_REARRAY, &LLKLevelModel::OnBnClickedButtonRearray)
	ON_BN_CLICKED(IDC_BUTTON_TIPS, &LLKLevelModel::OnBnClickedButtonTips)
	ON_BN_CLICKED(IDC_BUTTON_PAUSE, &LLKLevelModel::OnBnClickedButtonPause)
	ON_BN_CLICKED(IDC_BUTTON_HELP, &LLKLevelModel::OnBnClickedButtonHelp)
	ON_BN_CLICKED(IDC_BUTTON_TOOL, &LLKLevelModel::OnBnClickedButtonTool)
	ON_BN_CLICKED(IDC_BUTTON_SETTING, &LLKLevelModel::OnBnClickedButtonSetting)
END_MESSAGE_MAP()


// LLKLevelModel ��Ϣ�������


void LLKLevelModel::OnPaint()
{
	CPaintDC dc3(this);
	CWindowDC dc(this);
	CPen lPen(PS_SOLID, 2, RGB(255,255,255));
	//����������ɫ
	dc.SelectObject(&lPen);
	//ѡ�񻭱�
	CFont font;
	CString str;
	if(CLLKDlg::relaxFlag==0)
	{

		str.Format(_T("ʣ��ʱ��: %3d ��"),m_time);
		//m_time �д洢ʣ��ʱ����Ϣ
		font.CreatePointFont(100,_T("����"));
		//��������
		dc.SelectObject(&font);
		dc.SetTextColor(RGB(255,255,255));
		dc.SetBkColor(TRANSPARENT);
		dc.TextOut(40,100,str); //��ʾʱ��
	}
	//������ģʽ����ʾ����
	if(CLLKDlg::relaxFlag==1)
	{
		CWindowDC dc4(this);
		CPen lPen1(PS_SOLID, 2, RGB(255,255,255));
		//����������ɫ
		dc4.SelectObject(&lPen1);
		//ѡ�񻭱�
		CFont font1;
		CString str1;
		str1.Format(_T("����: %3d "),m_score);
		//m_time �д洢ʣ��ʱ����Ϣ
		font1.CreatePointFont(100,_T("����"));
		//��������
		dc4.SelectObject(&font1);
		dc4.SetTextColor(RGB(255,255,255));
		dc4.SetBkColor(TRANSPARENT);
		dc4.TextOut(657,483,str1); 
	}

	//��ʾ�ؿ�
	font.DeleteObject();
	font.CreatePointFont(200,_T("����"));
	dc.SelectObject(&font);
	dc.SetBkColor(TRANSPARENT);
	str.Format(_T("�ؿ���%d"),m_typeNum -1);
	dc.SetTextColor(RGB(255,255,255));
	dc.TextOut(320,90,str);

	CWindowDC dc2(this);
	CPen pen(PS_SOLID, 5, RGB(255,255,255));
	dc2.SelectObject(pen);
	//dc2.SetROP2(R2_NOT);//ȡ��ɫ
	//����·��
	if (LLKButton::ms_firstBtn != NULL && LLKButton::ms_secondBtn != NULL)
	{
		//���ü�ʱ����0.2������·������
		SetTimer(2,100,NULL);
		pt1.x = LLKButton::ms_firstBtn->m_location.y * 50 + 125;
		pt1.y = LLKButton::ms_firstBtn->m_location.x * 50 + 150;
		pt2.x = LLKButton::ms_secondBtn->m_location.y * 50 + 125;
		pt2.y = LLKButton::ms_secondBtn->m_location.x * 50 + 150;
		pt3.x = LLKButton::ms_ptCross1.y * 50 + 125;
		pt3.y = LLKButton::ms_ptCross1.x * 50 + 150;
		pt4.x = LLKButton::ms_ptCross2.y * 50 + 125;
		pt4.y = LLKButton::ms_ptCross2.x * 50 + 150;

		//�޹յ�
		if (LLKButton::ms_ptCross1.x == -1)
		{
			dc2.MoveTo(pt1);
			dc2.LineTo(pt2);
		}
		//һ���յ�
		else if (LLKButton::ms_ptCross2.x == -1)
		{
			dc2.MoveTo(pt1);
			dc2.LineTo(pt3);
			dc2.MoveTo(pt3);
			dc2.LineTo(pt2);
		}
		//�����յ�
		else
		{
			dc2.MoveTo(pt1);
			dc2.LineTo(pt3);
			dc2.MoveTo(pt3);
			dc2.LineTo(pt4);
			dc2.MoveTo(pt4);
			dc2.LineTo(pt2);
		}
	}
}

//��ʼ����ͼ
void LLKLevelModel::InitMap(int  map[][MAXY])
{
	int i,j;
	int x,y;
	int type;
	int index=0;
	//���������
	srand((unsigned int)time(NULL));
	//mapֵ��ʾͼƬ���ͣ�0��ʾû��ͼƬ
	for(i=0;i<MAXX;i++)
	{
		for(j=0;j<MAXY;j++)
		{
			map[i][j]=0;
			G.V[index].x=i;
			G.V[index].y=j;
			G.V[index++].pic=0;
		}
	} 
	for(int i=0;i<90;i++)
	{
		for(int j=0;j<90;j++)
		{
			G.adj[i][j]=0;
		}
	}
	//map�������ճ�����������ͼƬ,��graph.V�д�Ŷ�����Ϣ
	for(i=1;i<MAXX-1;i++)
	{
		for(j=1;j<MAXY-1;j++)
		{
			int index=0;
			if(map[i][j] != 0)
				continue;
			else
			{
				//��֤��ͼƬ�ɶԳ���
				type=rand() % m_typeNum;//ͼƬ����
				map[i][j]=type+1;
				for(int aa=0;aa<90;aa++,index++)
				{
					if((G.V[index].x==i)&&(G.V[index].y==j))
					{
						G.V[index].pic=type+1;
					}
				}
				do
				{
					x = rand()%(MAXX-2)+1;
					y = rand()%(MAXY-2)+1;
				}
				while(map[x][y]);
				map[x][y]=type+1;
				int index=0;
				for(int aa=0;aa<90;aa++,index++)
				{
					if((G.V[index].x==x)&&(G.V[index].y==y))
					{
						G.V[index].pic=type+1;
					}
				}
			}
		}
	}
	//�����ڽӾ���ֻ������������ͬһ��ͼƬ��ֵ��Ϊ1
	for(i=0;i<90;i++)
	{
		for(j=0;j<90;j++)
		{
			if((G.V[i].x==G.V[j].x)&&(G.V[i].y==G.V[j].y+1||G.V[i].y==G.V[j].y-1))
			{
				if(G.V[i].pic==0||G.V[j].pic==0)
				{
					G.adj[i][j]=G.adj[j][i]=1;
				}
				else if(G.V[i].pic==G.V[j].pic)
				{
					G.adj[i][j]=G.adj[j][i]=1;
				}
			}
			else if((G.V[i].y==G.V[j].y)&&(G.V[i].x==G.V[j].x+1||G.V[i].x==G.V[j].x-1))
			{
				if(G.V[i].pic==0||G.V[j].pic==0)
				{
					G.adj[i][j]=G.adj[j][i]=1;
				}
				else if(G.V[i].pic==G.V[j].pic)
				{
					G.adj[i][j]=G.adj[j][i]=1;
				}
			}
		}
	} 
}

//����map���찴ť
void LLKLevelModel::ShowMap(Graph G)
{
	int i, j;
	CPoint p;
	CString str = _T("");
	//���ԭ�а�ť
	for(i=0; i<m_btnGroup.GetSize(); i++)
		delete (LLKButton *)m_btnGroup.GetAt(i);
	m_btnGroup.RemoveAll();
	//����°�ť
	for(i=1; i<=MAXX-2; i++)
		for(j=1; j<=MAXY-2; j++)
		{
			p.x = i;
			p.y = j;
			for(int aa=0;aa<90;aa++)
			{
				if((G.V[aa].x==i)&&(G.V[aa].y==j))
				{
					//����ť����m_btnGroupָ��������
					m_btnGroup.Add(new LLKButton(G.V[aa].pic, p));
				}
			}	
		}
		//��ʾ��ť
		for(i=0; i<(MAXX-2)*(MAXY-2); i++)
		{
			LLKButton *btn = (LLKButton *)m_btnGroup.GetAt(i);
			//���찴ť�Ĵ�С��λ��
			btn->Create(str, WS_CHILD|BS_BITMAP|WS_VISIBLE,
				CRect(150+(i%(MAXY-2))*50, 150+(i/(MAXY-2))*50,
				200 +(i%(MAXY -2))*50, 200 +(i/(MAXY -2))*50), this,
				IDC_BLOCK+i);

			if(btn->m_ID)//���Ϊ0����ʾ
			{
				//�����þ���·��
				if(LLKSetting::main==1)
				{
					str.Format(_T("res\\%d.bmp"), btn->m_ID);
					HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
					//����ͼƬ
					if(m_fkBmp == NULL)
						if (MessageBox (_T(" ȱ �� ͼ Ƭ �� Դ! "), _T(" �� ��"),MB_ICONERROR|MB_OK) == IDOK)
						{
							CDialog::OnCancel();
							return;
						}
						btn->SetBitmap(m_fkBmp);
						btn->ShowWindow(SW_SHOW);
				}
				else
				{
					str.Format(_T("res\\%d.bmp"), btn->m_ID+100);
					HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
					//����ͼƬ
					if(m_fkBmp == NULL)
						if (MessageBox (_T(" ȱ �� ͼ Ƭ �� Դ! "), _T(" �� ��"),MB_ICONERROR|MB_OK) == IDOK)
						{
							CDialog::OnCancel();
							return;
						}
						btn->SetBitmap(m_fkBmp);
						btn->ShowWindow(SW_SHOW);
				}

			}
			else
				btn->ShowWindow(SW_HIDE);

		}
}

void LLKLevelModel::OnBnClickedButtonBegin()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	if(CLLKDlg::relaxFlag==0)
	{m_time = 30;}
	else if(CLLKDlg::relaxFlag==1||CLLKDlg::relaxFlag==2)
	{m_time = 65535;}
	m_typeNum = 2;
	m_score = 0;
	//���ü�ʱ����ÿһ���ӷ���һ���ź�
	SetTimer(1,1000,NULL);
	InitMap(map);
	ShowMap(G);
}

//�յ�ʱ���źź����Ӧ����
void LLKLevelModel::OnTimer(UINT_PTR nIDEvent)
{
	// TODO: Add your message handler code here and/or call default

	//nIDEventΪ2��ʱ���źţ�������·���ź�
	if (nIDEvent == 2)
	{
		{
			CWindowDC dc2(this);
			//�ñ���ɫ��·���ٻ�һ��
			CPen pen(PS_SOLID, 5,RGB(205,205,155));
			dc2.SelectObject(pen);
			//dc2.SetROP2(R2_NOT);
			//�޹յ�
			if (LLKButton::ms_ptCross1.x == -1)
			{

				dc2.MoveTo(pt1);
				dc2.LineTo(pt2);
				SetTimer(2,100,NULL);
			}
			//һ���յ�
			else if (LLKButton::ms_ptCross2.x == -1)
			{
				dc2.MoveTo(pt1);
				dc2.LineTo(pt3);
				dc2.MoveTo(pt3);
				dc2.LineTo(pt2);
			}
			//�����յ�
			else
			{

				dc2.MoveTo(pt1);
				dc2.LineTo(pt3);
				dc2.MoveTo(pt3);
				dc2.LineTo(pt4);
				dc2.MoveTo(pt4);
				dc2.LineTo(pt2);
			}
		}
		CDialogEx::OnTimer(nIDEvent);
		//�رոü�ʱ��
		KillTimer(2);
	}

	//nIDEventΪ1��ʱ���źţ����ı�ʣ��ʱ����ź�
	else
	{
		m_time--;
		//�����ػ�����
		this->OnPaint();
		//�ж��Ƿ�ͨ����
		IsWin();	
	}
}

//�Ƿ�ͨ����
BOOL LLKLevelModel::IsWin(void)
{
	//ʱ�������û�й���
	if (m_time == 0)
	{
		KillTimer(1);
		MessageBox(_T("Game Over !"),_T("ʱ�����"));
		m_time = 30;
		//�������İ�ť
		for(int i=0; i<m_btnGroup.GetSize(); i++)
			delete (LLKButton *)m_btnGroup.GetAt(i);
		m_btnGroup.RemoveAll();
		//��¼����
		LLKAddDlg addData;
		addData.DoModal();
		return FALSE;
	}

	/*for (int i = 0; i < MAXX; i++)
		for (int j = 0; j < MAXY; j++)
		{
			if(map[i][j] != 0)
				return FALSE;
		}*/
	for(int i=0;i<90;i++)
	{
		if(G.V[i].pic!=0)
			return FALSE;
	}
		//���غ�ֹͣ��ʱ
		KillTimer(1);
		//���ȫ��ͨ��
		//if (m_typeNum == 9)
		if(m_typeNum==2)
		{
			MessageBox(_T("��ϲ�㣬�Ѿ�ȫ��ͨ��"),_T("ʤ��"));
			m_score += m_typeNum * 100 + m_time;
			for(int i=0; i<m_btnGroup.GetSize(); i++)
				delete (LLKButton *)m_btnGroup.GetAt(i);
			m_btnGroup.RemoveAll();
			this->ShowWindow(SW_HIDE);
			LLKAddDlg addData;
			addData.DoModal();
			this->ShowWindow(SW_SHOW);
			return TRUE;
		}
		//��δȫ��ͨ��
		else
		{
			MessageBox(_T("������һ��"),_T("ʤ��"));
			m_score += m_typeNum * 100 + m_time;
			//����һ�غ�m_typeNum��1��ʹ�Ѷ�����
			m_typeNum++;
			//�������ü�ʱ������ʼ����ͼ
			SetTimer(1,1000,NULL);
			InitMap(map);
			ShowMap(G);
			m_time = 30;
			return FALSE;
		}

}


void LLKLevelModel::OnBnClickedButtonRearray()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	//û�а�ťʱ���޷�����
	if (m_btnGroup.GetSize() == 0)
	{
		MessageBox(_T("û�������ŵİ�ť��"),_T("����"));
		return;
	}
	//����map��������0λ�õ�ֵ��������������ť
	srand((unsigned)time(NULL));
	int x1,y1,x2,y2,temp,index1=0,index2=0;
	//����100��
	for (int i = 0; i < 100; ++i)
	{
		x1 = rand() % (MAXX-2) + 1;
		y1 = rand() % (MAXY-2) + 1;
		/*while(map[x1][y1] == 0)
		{
		x1 = rand() % (MAXX-2) + 1;
		y1 = rand() % (MAXY-2) + 1;
		}*/
flag1:
		for(int index=0;index<90;index++)
		{
			if(G.V[index].x==x1&&G.V[index].y==y1)
			{
				while(G.V[index].pic==0)
				{
					x1 = rand() % (MAXX-2) + 1;
					y1 = rand() % (MAXY-2) + 1;
					goto flag1;
				} 
				index1=index;
			}
		}
		x2 = rand() % (MAXX-2) + 1;
		y2 = rand() % (MAXY-2) + 1;
		/*while(map[x2][y2] == 0)
		{
			x2 = rand() % (MAXX-2) + 1;
			y2 = rand() % (MAXY-2) + 1;
		}*/
flag2:
		for(int index=0;index<90;index++)
		{
			if(G.V[index].x==x2&&G.V[index].y==y2)
			{
				while(G.V[index].pic==0)
				{
					x2 = rand() % (MAXX-2) + 1;
					y2 = rand() % (MAXY-2) + 1;
					goto flag2;
				}
				index2=index;
			}
		}
		/*temp = map[x1][y1];
		map[x1][y1] = map[x2][y2];
		map[x2][y2] = temp;*/
		temp=G.V[index1].pic;
		G.V[index1].pic=G.V[index1].pic;
		G.V[index2].pic=temp;
	}

	//�����µ�map�ػ���ť
	ShowMap(G);
}


void LLKLevelModel::OnBnClickedButtonTips()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	m_score-=10;
	LLKButton *pBtn1;
	LLKButton *pBtn2;
	CString str;
	//��ֱ�ӵİ취��������ָ��������а�ť
	for (int i = 0; i < m_btnGroup.GetSize(); ++i)
	{
		for (int j = i+1; j < m_btnGroup.GetSize(); ++j)
		{
			pBtn1 = (LLKButton*)m_btnGroup.GetAt(i);
			pBtn2 = (LLKButton*)m_btnGroup.GetAt(j);
			if (pBtn1->m_ID != 0 && pBtn1->m_ID == pBtn2->m_ID)
			{
				if( pBtn1->findPath(pBtn1->m_location, pBtn2->m_location))
				{
					//�ҵ���ť�󣬱�ʶ����
					if(LLKSetting::main==1)
					{
						str.Format(_T("res\\%d.bmp"), (pBtn1->m_ID)+10);
						HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
						pBtn1->SetBitmap(m_fkBmp);
						pBtn1->ShowWindow(SW_SHOW);

						str.Format(_T("res\\%d.bmp"), (pBtn2->m_ID)+10);
						m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
						pBtn2->SetBitmap(m_fkBmp);
						pBtn2->ShowWindow(SW_SHOW);
					}
					if(LLKSetting::main==2)
					{
						str.Format(_T("res\\%d.bmp"), (pBtn1->m_ID)+110);
						HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
						pBtn1->SetBitmap(m_fkBmp);
						pBtn1->ShowWindow(SW_SHOW);

						str.Format(_T("res\\%d.bmp"), (pBtn2->m_ID)+110);
						m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
						pBtn2->SetBitmap(m_fkBmp);
						pBtn2->ShowWindow(SW_SHOW);
					}
					return;
				}
			}
		}
	}
	MessageBox(_T("û�п������ӵ�ͼƬ��"),_T("����"));
}


void LLKLevelModel::OnBnClickedButtonPause()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	sig++;
	if(sig%2!=0)
	{
		stop_time=m_time;
		KillTimer(1);
		SetDlgItemText(IDC_BUTTON_PAUSE,_T("������Ϸ"));
		//�����������ݲ��ܶ�
		GetDlgItem(IDC_BUTTON_PAUSE)->EnableWindow(TRUE);
		GetDlgItem(IDC_BUTTON_SETTING)->EnableWindow(FALSE);
		GetDlgItem(IDC_BUTTON_HELP)->EnableWindow(FALSE);
		GetDlgItem(IDC_BUTTON_REARRAY)->EnableWindow(FALSE);
		GetDlgItem(IDC_BUTTON_TIPS)->EnableWindow(FALSE);
		GetDlgItem(IDC_BUTTON_BEGIN)->EnableWindow(FALSE);
		for(int i=0;i<56;i++)
		{
			GetDlgItem(IDC_BLOCK+i)->EnableWindow(FALSE);
		}
	}
	else
	{
		SetTimer(1,1000,NULL);
		m_time = stop_time;
		SetDlgItemText(IDC_BUTTON_PAUSE,_T("��ͣ��Ϸ"));
		GetDlgItem(IDC_BUTTON_SETTING)->EnableWindow(TRUE);
		GetDlgItem(IDC_BUTTON_HELP)->EnableWindow(TRUE);
		GetDlgItem(IDC_BUTTON_REARRAY)->EnableWindow(TRUE);
		GetDlgItem(IDC_BUTTON_TIPS)->EnableWindow(TRUE);
		GetDlgItem(IDC_BUTTON_BEGIN)->EnableWindow(TRUE);
		for(int i=0;i<56;i++)
		{
			GetDlgItem(IDC_BLOCK+i)->EnableWindow(TRUE);
		}
	}

}


void LLKLevelModel::OnBnClickedButtonHelp()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	stop_time=m_time;
	KillTimer(1);
	CHelpDialog help;
	help.DoModal();
	while(IsWindow(help))
	{}
	SetTimer(1,1000,NULL);
	m_time = stop_time;
}


BOOL LLKLevelModel::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// TODO:  �ڴ���Ӷ���ĳ�ʼ��
	if(CLLKDlg::relaxFlag==1)
	{
		tool.ShowWindow(TRUE);
	}
	return TRUE;  // return TRUE unless you set the focus to a control
	// �쳣: OCX ����ҳӦ���� FALSE
}


void LLKLevelModel::OnBnClickedButtonTool()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	if(m_score>=10)
	{
		m_score-=20;
		LLKButton *pBtn1;
		LLKButton *pBtn2;
		CString str;
		//��ֱ�ӵİ취��������ָ��������а�ť
		for (int i = 0; i < m_btnGroup.GetSize(); ++i)
		{
			for (int j = i+1; j < m_btnGroup.GetSize(); ++j)
			{
				pBtn1 = (LLKButton*)m_btnGroup.GetAt(i);
				pBtn2 = (LLKButton*)m_btnGroup.GetAt(j);
				if (pBtn1->m_ID != 0 && pBtn1->m_ID == pBtn2->m_ID)
				{
					if( pBtn1->findPath(pBtn1->m_location, pBtn2->m_location))
					{
						//�ҵ���ť�󣬱�ʶ����
						//���ذ�ť
						pBtn1->ShowWindow(SW_HIDE);
						pBtn2->ShowWindow(SW_HIDE);
						//���´��ڣ������öԻ����onpain������·��
						UpdateWindow();
						//����һ��ͼƬ��ʣ��ʱ��ͷ���������
						m_time += 5;
						m_score += 10;
						//�ı䰴ť���ͺ�map��ֵΪ0
						pBtn1->m_ID = 0;
						pBtn2->m_ID = 0;
						/*map[pBtn1->m_location.x][pBtn1->m_location.y] = 0;
						map[pBtn2->m_location.x][pBtn2->m_location.y] = 0;*/
						for(int index=0;index<90;index++)
						{
							if(G.V[index].x==pBtn1->m_location.x&&G.V[index].y==pBtn1->m_location.y)
							{
								G.V[index].pic=0;
							}
						}
						for(int index=0;index<90;index++)
						{
							if(G.V[index].x==pBtn2->m_location.x&&G.V[index].y==pBtn2->m_location.y)
							{
								G.V[index].pic=0;
							}
						}

						pBtn1 = pBtn2 = NULL;
						if(LLKSetting::music==1)
						{
							PlaySound(_T("res\\elec.wav"), NULL, SND_FILENAME | SND_ASYNC);
						}
						if(LLKSetting::music==2)
						{
							PlaySound(_T("res\\shake.wav"), NULL, SND_FILENAME | SND_ASYNC);
						}
						return;
					}
				}
			}
		}
		MessageBox(_T("û�п������ӵ�ͼƬ��"),_T("����"));
	}
	else
	{
		MessageBox(_T("��ʣ��Ļ��ֲ���ʹ�õ��ߣ�"),_T("����"));
	}
}


void LLKLevelModel::OnBnClickedButtonSetting()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	stop_time=m_time;
	KillTimer(1);
	LLKSetting setting;
	setting.DoModal();
	while(IsWindow(setting))
	{}
	SetTimer(1,1000,NULL);
	m_time = stop_time;
}
