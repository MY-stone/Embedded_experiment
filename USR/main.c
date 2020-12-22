#include "stm32f10x.h"
#include "LED.h"
#include "key.h"
#include "TIM.h"
#include "usart.h"
#include "arm_math.h"
int main()
{
    int a1[8]={12,15,4,9,7,10,11,2};
    int a3[12]={1,10,9,5,3,6,5,2,7,9,2,6};
    int a4[12]={11,20,19,20,8,16,15,12,17,19,12,16};
    char* b = {"Embedded system"};
    float mean1,mean3,mean4;
    float standard3,standard4,convariance34,coefficent34;
    
    
    LED_Init();
    Tube_Init();
    key_Init();
    uart_init(57600);    //9600波特率
    TIM3_Init(50000,216);
    
    
    BubbleSort(a1,8);	
    mean3 = get_mean(a3,12);
    mean4 = get_mean(a4,12);
    standard3 = get_standard(a3,12,mean3);
    standard4 = get_standard(a4,12,mean4);

    convariance34 = get_convariance(mean3,mean4,a3,a4,12);
    coefficent34 = convariance34/(standard3*standard4);
    
    //printf("convariance34:%f,coefficent34:%f",convariance34,coefficent34);
    
    while(1)
    {   

        if(GPIO_PinRead(GPIOA,5))
            GPIO_PinWrite(GPIOA,1,1);   //拉高
        else
            GPIO_PinWrite(GPIOA,1,0);   //置低
        
        if(GPIO_PinRead(GPIOA,6))
            GPIO_PinWrite(GPIOA,2,1);   //拉高
        else
            GPIO_PinWrite(GPIOA,2,0);   //置低
        
        if(GPIO_PinRead(GPIOA,7))
            GPIO_PinWrite(GPIOA,3,1);   //拉高
        else
            GPIO_PinWrite(GPIOA,3,0);   //置低
        
        if(GPIO_PinRead(GPIOA,8))
            GPIO_PinWrite(GPIOA,4,1);   //拉高
        else
            GPIO_PinWrite(GPIOA,4,0);   //置低
        
    }
}               


