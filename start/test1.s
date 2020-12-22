COUNT 	EQU 0x30003100 			;定义一个变量，为0x30003100
		AREA Example2,CODE,READONLY 	;声明代码段 Example2
		ENTRY 								;标识程序入口
		CODE32 								;声明32:位ARM指令
START 	LDR R1,=COUNT						; R1=COUNT
		MOV R0,#0 							;将立即数0放入R0
		STR R0,[R1] 						;[R1] << R0,将R0里的数据放入R1
LOOP 	LDR R1,=COUNT						;R1<<COUNT
		LDR R0,[R1] 						;R0 << [R1]
		ADD R0,R0,#1 						; RO << R0 + 1
		STR R0,[R1] 						; [R1] << R0,即保存 COUNT
		B LOOP								;跳转到LOOP
		END
