#include "stm32f10x.h"
#include "math.h"

void BubbleSort(int a[], int len);//大在前，小在后
float get_mean(int a[],int len);
float get_standard(int a[],int len,float mean);
float get_convariance(float mean1,float mean2,int a[],int b[],int len);

