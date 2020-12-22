#include "key.h"

void key_Init(){
    //使能GPIOA的时钟
    GPIO_PortClock(GPIOA,true);
    
    //定义GPIOA5~GPIO8为输入模式
    GPIO_PinConfigure(GPIOA,5,GPIO_IN_PULL_UP,GPIO_MODE_INPUT);
    GPIO_PinConfigure(GPIOA,6,GPIO_IN_PULL_UP,GPIO_MODE_INPUT);
    GPIO_PinConfigure(GPIOA,7,GPIO_IN_PULL_UP,GPIO_MODE_INPUT);
    GPIO_PinConfigure(GPIOA,8,GPIO_IN_PULL_UP,GPIO_MODE_INPUT);
        
}

