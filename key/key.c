#include "key.h"

void key_Init(){
    //ʹ��GPIOA��ʱ��
    GPIO_PortClock(GPIOA,true);
    
    //����GPIOA5~GPIO8Ϊ����ģʽ
    GPIO_PinConfigure(GPIOA,5,GPIO_IN_PULL_UP,GPIO_MODE_INPUT);
    GPIO_PinConfigure(GPIOA,6,GPIO_IN_PULL_UP,GPIO_MODE_INPUT);
    GPIO_PinConfigure(GPIOA,7,GPIO_IN_PULL_UP,GPIO_MODE_INPUT);
    GPIO_PinConfigure(GPIOA,8,GPIO_IN_PULL_UP,GPIO_MODE_INPUT);
        
}

