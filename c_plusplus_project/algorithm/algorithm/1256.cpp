#include "stdafx.h"
#include <iostream>
#include <algorithm>
#include <string.h>
using namespace std;
char s[14], ss[14];//����������飬������13���������Ϊ14�����'\0'
bool used[14];//��־�����е��ַ��Ƿ�ʹ�ù������ڱ����ظ���������
int len;//��������ĳ���
/*cmp������ʹ��STL��sort����ʱ����д���жϺ��������ڽ�������������*/
int cmp(char a, char b)
{
	if (tolower(a) != tolower(b))
	{
		return tolower(a) < tolower(b);
	}
	else
		return a < b;
}
/*���ݷ������ڽ����������ȫ�����ظ����з��õ���������У�����ÿ�ζ����������գ���Ϊ���еĳ��Ⱦ���ͬ*/
void backtrace(int n)
{
	if (n == len)
	{
		cout << ss << endl;//���һ�㣬����ַ���
	}
	for (int i = 0; i < len; ++i)
	{
		if (used[i] == false)//û���ù�����ַ�
		{
			ss[n] = s[i];
			used[i] = true;
			backtrace(n + 1);
			used[i] = false;
			int temp = i + 1;
			while (temp < len && s[temp] == s[i])//�����������ҵ���һ������ͬ���ַ����ٿ�ʼ���У��˴�wa��
			{
				temp++;
			}
			temp--; //i���������ʶ��ȼ�1���˴�Ҳwa��
			i = temp;
		}
	}
}
int main()
{
	int n;
	scanf("%d", &n);
	while (n--)
	{
		scanf("%s", &s);
		len = strlen(s);
		memset(used, 0, sizeof(used));
		ss[len] = '\0';//���Ӵ��м�Ϊwa,����vs�л��Զ���'\0'������
		sort(s, s + len, cmp);
		backtrace(0);//�ӵ�һλ��ʼ
	}
	system("pause");
	return 0;
}