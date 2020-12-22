#include "arm_math.h"

//大在前，小在后,排序
void BubbleSort(int a[], int len)
{
	int i, j, temp;
	for (j =  len - 1; j >0 ; j--)
	{
		for (i = len - 1; i > len - 1 - j; i--)
		if (a[i] > a[i - 1])
		{
			temp = a[i];
			a[i] = a[i - 1];
			a[i - 1] = temp;
		}
	}
}

//计算平均值
float get_mean(int a[],int len)
{
    float mean;
    int i;
    for(i=0;i<len;i++)
    {
        mean += a[i];
    }
    mean = mean/len;
    return mean;
}

//计算标准差
float get_standard(int a[],int len,float mean)
{
    float standard;
    int i,temp;
    for(i=0;i<len;i++)
    {
        temp = a[i]-mean;
        temp = temp*temp;
        standard+=temp;
    }
    
    standard = standard/len;
    standard = sqrt(standard);
    
    return standard;
}

//计算协方差
float get_convariance(float mean1,float mean2,int a[],int b[],int len)
{
    float convariance =0;
    int i;
    for(i = 0;i<len;i++)
    {
        convariance = (a[i]-mean1)*(b[i]-mean2);
        convariance +=convariance;
    }
    convariance = convariance/len;
    
    return convariance;
}
