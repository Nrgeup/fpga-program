#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <bios.h>
#include <ctype.h>
#include <process.h>

// 延时函数
void delay(int time)
{
	int  i;
	long j;
	for(i=0;i<=time;i++)
	{
		for(j=0;j<=0x400000;j++)
		{   }
	}
	return;
}


void main()
{
	unsigned int data=7;      //input your data hare!
	unsigned int port_273=0x3002;  //无条件输出电路的选通地址
	unsigned int port_194=0x3008;  //8位寄存器的选通地址
	
   	outp(port_273,0xff);	//选通74273，给s0、s1送“11”信号，控制74194进行并行输入
   	outp(port_194,data);	//给74194送原始数据
	outp(port_273,0x02); 	//选通74273，给s0、s1送“10”信号，控制74194进行右移
	
	while(1)
	{
		outp(port_194,0);  //提供clk信号，循环右移一位
		delay(20);	//延时一段时间
	}	
}

