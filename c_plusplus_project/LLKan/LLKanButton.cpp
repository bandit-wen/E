// LLKanButton.cpp : implementation file
//
#include "stdafx.h"
#include <windows.h>
#include <mmsystem.h>
#pragma comment(lib, "WINMM.LIB")
#include "LLKan.h"
#include "LLKanDlg.h"
#include "LLKanButton.h"

//��ʼ��ȫ�ֱ���
CLLKanButton* CLLKanButton::ms_firstBtn = NULL;
CLLKanButton* CLLKanButton::ms_secondBtn = NULL;
CPoint CLLKanButton::ms_ptCross1(-1,-1);
CPoint CLLKanButton::ms_ptCross2(-1,-1);
CLLKanDlg* CLLKanButton::parent = NULL;


IMPLEMENT_DYNAMIC(CLLKanButton, CButton)

CLLKanButton::CLLKanButton()
: m_ID(0)
, m_location(0)
{
	
}

CLLKanButton::~CLLKanButton()
{
}


BEGIN_MESSAGE_MAP(CLLKanButton, CButton)
	ON_WM_LBUTTONDOWN()
END_MESSAGE_MAP()




CLLKanButton::CLLKanButton(int type,CPoint point )
{
	m_location = point;
	m_ID = type;

}

//��ť���µ���Ӧ����
void CLLKanButton::OnLButtonDown(UINT nFlags, CPoint point)
{
	// TODO: Add your message handler code here and/or call default
	CString str;

	parent = (CLLKanDlg *)GetParent();
	//��ʼ�����ӹյ�
	ms_ptCross1.x = ms_ptCross1.y = -1;
	ms_ptCross2.x = ms_ptCross2.y = -1;

	//ѡ��һ����ťʱ�ı�ͼƬ������
	if (CLLKanButton::ms_firstBtn == NULL)
	{
		//ms_firstBtn��¼������ѡ�еĵ�һ����ť
		//ms_secondBtn��¼������ѡ�еĵڶ�����ť
		CLLKanButton::ms_firstBtn = this;
		//��ͼƬ����һ�ŵ�ɫΪ��ɫ��ͬ���͵�ͼƬ
		str.Format(_T("res\\%d.bmp"), (this->m_ID)+100);
		HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
		this->SetBitmap(m_fkBmp);
		this->ShowWindow(SW_SHOW);
		//�����ťʱ������
		PlaySound(_T("H:\\C++code\\LLKan\\res\\sel.wav"), NULL, SND_FILENAME | SND_ASYNC);
	}
	//��������һ�����͵İ�ť
	else if (CLLKanButton::ms_firstBtn->m_ID != this->m_ID)
	{
		str.Format(_T("res\\%d.bmp"), CLLKanButton::ms_firstBtn->m_ID);
		HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
		CLLKanButton::ms_firstBtn->SetBitmap(m_fkBmp);
		CLLKanButton::ms_firstBtn->ShowWindow(SW_SHOW);

		str.Format(_T("res\\%d.bmp"), (this->m_ID)+100);
		m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
		this->SetBitmap(m_fkBmp);
		this->ShowWindow(SW_SHOW);

		PlaySound(_T("H:\\C++code\\LLKan\\res\\sel.wav"), NULL, SND_FILENAME | SND_ASYNC);

		CLLKanButton::ms_firstBtn = this;
	}
	//ȡ��ѡ�еİ�ť
	else if (CLLKanButton::ms_firstBtn == this)
	{
		str.Format(_T("res\\%d.bmp"), CLLKanButton::ms_firstBtn->m_ID);
		HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
		CLLKanButton::ms_firstBtn->SetBitmap(m_fkBmp);
		CLLKanButton::ms_firstBtn->ShowWindow(SW_SHOW);
		CLLKanButton::ms_firstBtn = NULL;
		PlaySound(_T("H:\\C++code\\LLKan\\res\\sel.wav"), NULL, SND_FILENAME | SND_ASYNC);
	}
	//������ť������
	else if(FindLine(ms_firstBtn->m_location, this->m_location)||
		FindOneConner(ms_firstBtn->m_location, this->m_location)||
		FindSide(ms_firstBtn->m_location, this->m_location)||
		FindTwoConner(ms_firstBtn->m_location, this->m_location))
	{
		//��¼����ѡ�еĵڶ�����ť
		ms_secondBtn = this;
		//���ذ�ť
		ms_firstBtn->ShowWindow(SW_HIDE);
		ms_secondBtn->ShowWindow(SW_HIDE);
		//���´��ڣ������öԻ����onpain������·��
		parent->UpdateWindow();
		//����һ��ͼƬ��ʣ��ʱ��ͷ���������
		parent->m_time += 5;
		parent->m_score += 10;
		//�ı䰴ť���ͺ�map��ֵΪ0
		ms_firstBtn->m_ID = 0;
		ms_secondBtn->m_ID = 0;
		parent->map[ms_firstBtn->m_location.x][ms_firstBtn->m_location.y] = 0;
		parent->map[ms_secondBtn->m_location.x][ms_secondBtn->m_location.y] = 0;
		ms_firstBtn = ms_secondBtn = NULL;
		PlaySound(_T("H:\\C++code\\LLKan\\res\\elec.wav"), NULL, SND_FILENAME | SND_ASYNC);
	}
	//����ͬ���͵İ�ť��������
	else
	{
		str.Format(_T("res\\%d.bmp"), CLLKanButton::ms_firstBtn->m_ID);
		HBITMAP m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
		CLLKanButton::ms_firstBtn->SetBitmap(m_fkBmp);
		CLLKanButton::ms_firstBtn->ShowWindow(SW_SHOW);

		str.Format(_T("res\\%d.bmp"), (this->m_ID)+100);
		m_fkBmp = (HBITMAP)::LoadImage(AfxGetInstanceHandle(),str, IMAGE_BITMAP, 0, 0,LR_CREATEDIBSECTION|LR_LOADFROMFILE);
		this->SetBitmap(m_fkBmp);
		this->ShowWindow(SW_SHOW);

		PlaySound(_T("H:\\C++code\\LLKan\\res\\sel.wav"), NULL, SND_FILENAME | SND_ASYNC);
		CLLKanButton::ms_firstBtn = this;
	}
	CButton::OnLButtonDown(nFlags, point);
}

//����ť��ͬһ��ֱ����
BOOL CLLKanButton::FindLine(CPoint p1, CPoint p2)
{
	//CLLKanDlg *parent = (CLLKanDlg *)GetParent();
	int max, min;
	int i;
	//��ͬһ��
	if( (p1.x) == (p2.x) )
	{
		max = (p1.y>p2.y)?p1.y:p2.y;
		min = (p1.y<p2.y)?p1.y:p2.y;
		if(max == min+1)  //���ڵ���������
			return TRUE;
		for(i=min+1; i<max; i++)
		{
			if(parent->map[p1.x][i] != 0)
				return FALSE;
		}
		return TRUE;
	}
	//��ͬһ��
	if( (p1.y) == (p2.y) )
	{
		max = (p1.x>p2.x)?p1.x:p2.x;
		min = (p1.x<p2.x)?p1.x:p2.x;
		if(max == min+1)
			return TRUE; //���ڵ���������
		for(i=min+1; i<max; i++)
		{
			if(parent->map[i][p1.y] !=0)
				return FALSE;
		}
		return TRUE;
	}
	return FALSE;
}

//��һ���յ��·��
BOOL CLLKanButton::FindOneConner(CPoint p1, CPoint p2)
{
	int maxx, maxy, minx, miny;
	maxx = (p1.x>p2.x)?p1.x:p2.x;
	maxy = (p1.y>p2.y)?p1.y:p2.y;
	minx = (p1.x<p2.x)?p1.x:p2.x;
	miny = (p1.y<p2.y)?p1.y:p2.y;
	//4����ֱ�����жϣ����ܷ��ҵ�������Ŀ����ֱ��·��
	if(parent->map[minx][maxy] == 0)
	{
		ms_ptCross1.x = minx;
		ms_ptCross1.y = maxy;
		if ((FindLine ( p1, ms_ptCross1)) && (FindLine
			(ms_ptCross1, p2)))
			return TRUE;
	}
	if(parent->map[maxx][miny] == 0)
	{
		ms_ptCross1.x = maxx;
		ms_ptCross1.y = miny;
		if ((FindLine (p1, ms_ptCross1)) && (FindLine
			(ms_ptCross1, p2)))
			return TRUE;
	}
	if(parent->map[minx][miny] == 0)
	{
		ms_ptCross1.x = minx;
		ms_ptCross1.y = miny;
		if ((FindLine (p1, ms_ptCross1)) && (FindLine
			(ms_ptCross1, p2)))
			return TRUE;
	}
	if(parent->map[maxx][maxy] == 0)
	{
		ms_ptCross1.x = maxx;
		ms_ptCross1.y = maxy;
		if ((FindLine (p1, ms_ptCross1)) && (FindLine
			(ms_ptCross1, p2)))
			return TRUE;
	}
	return FALSE;
}

//���������յ��һ����������Ϊ�������������Ե����ó���������㷨Ч��
/*

_________
|       |       
A       A

*/

BOOL CLLKanButton::FindSide(CPoint p1, CPoint p2)
{
	int max, min;
	int i;
	BOOL line=TRUE;
	BOOL col=TRUE;
	if( (p1.x) == (p2.x) )
	{
		max = (p1.y>p2.y)?p1.y:p2.y;
		min = (p1.y<p2.y)?p1.y:p2.y;
		for(i=min; i<=max; i++) //�ϲ�
		{
			if(parent->map[p1.x-1][i] !=0)
			{
				line=FALSE;
				break;
			}
		}
		if(line)
		{
			ms_ptCross1.x = p1.x-1;
			ms_ptCross1.y = p1.y;
			ms_ptCross2.x = p1.x-1;
			ms_ptCross2.y = p2.y;
			return TRUE;
		}
		else
			line=TRUE;
		for(i=min; i<=max; i++)
		{
			if(parent->map[p1.x+1][i] !=0) //�²�
			{
				line=FALSE;
				break;
			}
		}
		if(line)
		{
			ms_ptCross1.x = p1.x+1;
			ms_ptCross1.y = p1.y;
			ms_ptCross2.x = p1.x+1;
			ms_ptCross2.y = p2.y;
			return TRUE;
		}
	}
	else
		line=FALSE;
	if( (p1.y) == (p2.y) )
	{
		max = (p1.x>p2.x)?p1.x:p2.x;
		min = (p1.x<p2.x)?p1.x:p2.x;
		for(i=min; i<=max; i++)
		{
			if(parent->map[i][p1.y-1] !=0) //���
			{
				col=FALSE;
				break;
			}
		}
		if(col)
		{
			ms_ptCross1.x = p1.x;
			ms_ptCross1.y = p1.y-1;
			ms_ptCross2.x = p2.x;
			ms_ptCross2.y = p2.y-1;
			return TRUE;
		}
		else
			col=TRUE;
		for(i=min; i<=max; i++)
		{
			if(parent->map[i][p1.y+1] !=0) //�Ҳ�
			{
				col=FALSE;
				break;
			}
		}
		if(col)
		{
			ms_ptCross1.x = p1.x;
			ms_ptCross1.y = p1.y+1;
			ms_ptCross2.x = p2.x;
			ms_ptCross2.y = p2.y+1;
			return TRUE;
		}
	}
	else
		col=FALSE;
	if(line || col)
		return TRUE;
	else
		return FALSE;
}

//�����յ�
BOOL CLLKanButton::FindTwoConner(CPoint p1, CPoint p2)
{
	//�����յ�ض���һ��������ͬ����һ������ֱ�����������ͬ
	int i;
	CPoint tempPoint1 = 0;
	CPoint tempPoint2 = 0;
	//������Ŀ�����ˮƽ����Ѱ�ҹյ�
	for(i=0; i<MAXY; i++)
	{
		if(i == p1.y)
			continue;
		tempPoint1.x = p1.x;
		tempPoint1.y = i;
		ms_ptCross1 = tempPoint1;
		if((parent->map[tempPoint1.x][tempPoint1.y]==0))
		{
			if(FindLine(tempPoint1, p1))
			{
				tempPoint2.x = p2.x;
				tempPoint2.y = tempPoint1.y;
				if((parent->map[tempPoint2.x][tempPoint2.y]==0))
				{
					if(FindLine(tempPoint1,tempPoint2))
					{
						ms_ptCross2 = tempPoint2;
						if(FindLine(tempPoint2, p2))
							return TRUE;
					}
				}
			}
		}
	}
	//������Ŀ����Ĵ�ֱ����Ѱ�ҹյ�
	for(i=0; i<MAXX; i++)
	{
		if(i == p1.x)
			continue;
		tempPoint1.x = i;
		tempPoint1.y = p1.y;
		ms_ptCross1 = tempPoint1;
		if((parent->map[tempPoint1.x][tempPoint1.y]==0) )
		{
			if(FindLine(tempPoint1, p1))
			{
				tempPoint2.x = tempPoint1.x;
				tempPoint2.y = p2.y;
				if ((parent ->map [tempPoint2.x][tempPoint2.y]==0))
				{
					if(FindLine(tempPoint1,tempPoint2))
					{
						ms_ptCross2 = tempPoint2;
						if(FindLine(tempPoint2, p2))
							return TRUE;
					}
				}
			}
		}
	}
	return FALSE;
}
