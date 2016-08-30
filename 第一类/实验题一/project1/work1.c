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
	//outp(0x3002 , 0xaa);
	int data=0x01;
	while (1)
	{
		outp(0x3002 , data);
		data=data<<1;		//每次左移一位
		if(data==0x80)
			data=1;
		delay(4);	//	延时
	}
}

