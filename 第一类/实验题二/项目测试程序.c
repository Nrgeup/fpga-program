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
	int port_r,value;
	port_r=0x3002;		//0010
	while(1)	
	{
		//先读入无条件输入端口的数值
		value=inp(port_r);
		delay(40);	//延时一段时间，循环读数据		
		printf("Get data is %d \n", value);	//显示在桌面上
	}
}
