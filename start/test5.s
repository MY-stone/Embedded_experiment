;�����ջ�Ĵ�С
USR_STACK_LEGTH EQU 64
SVC_STACK_LEGTH EQU 0
FIQ_STACK_LEGTH EQU 16
IRQ_STACK_LEGTH EQU 64
ABT_STACK_LEGTH EQU 0
UND_STACK_LEGTH EQU 0

		AREA Example5,CODE,READONLY ;��������� Example5
		ENTRY 						;��ʶ�������
		CODE32 						;����32λARMָ��
START
		MOV R0,#0
		MOV R1,#1
		MOV R2,#2
		MOV R3,#3
		MOV R4,#4
		MOV R5,#5
		MOV R6,#6
		MOV R7,#7
		MOV	R8,#8
		MOV	R9,#9
		MOV	R10,#10
		MOV	R11,#11
		MOV	R12,#12
		BL InitStack;��ʼ����ģʽ�µĶ�ջָ��

		;��IRQ�жϣ���CPSR�Ĵ�����حλ���㣩
		MRS	R0,CPSR 		;RO <= CPSR
		BIC	R0,R0,#0x80
		MSR	CPSR_cxsf,R0 	; CPSR <= R0

		;�л����û�ģʽ
		MSR	CPSR_c,#0xd0
		MRS	R0,CPSR

		;�л�������ģʽ
		MSR CPSR_c,#0xdf
		MRS R0,CPSR
		
HALT 	B HALT
;���ƣ�InitStack
;���ܣ���ջ��ʼ��������ʼ����ģʽ�µĶ�ջָ�롣
;��ڲ�������
;���ڲ�������
;˵��������Ȩģʽ�µ��ô��ӳ��򣬱��縴λ��Ĺ���ģʽ
InitStack
		MOV R0,LR 		;RO<=LR����Ϊ����ģʽ��R0����ͬ��
		;���ù���ģʽ��ջ
		MSR CPSR_c,#0xd3
		LDR SP,StackSvc
		;�����ж�ģʽ��ջ
		MSR CPSR_c, #0xd2
		LDR SP,Stacklrq
		;���ÿ����ж�ģʽ��ջ
		MSR CPSR_c,#0xd1
		LDR SP, StackFiq
		;������ֹģʽ��ջ
		MSR CPSR_c, #0xd7
		LDR SP, StackAbt
		;����δ����ģʽ��ջ
		MSR CPSR_c, #0xdb
		LDR SP, StackUnd
		;����ϵͳģʽ��ջ
		MSR CPSR_c, #0xdf
		LDR SP, StackUsr
		MOV PC, R0
StackUsr DCD UsrStackSpace + (USR_STACK_LEGTH -1)*4
StackSvc DCD SvcStackSpace + (SVC_STACK_LEGTH -1)*4
Stacklrq DCD IrqStackSpace + (IRQ_STACK_LEGTH -1)*4
StackFiq DCD FiqStackSpace + (FIQ_STACK_LEGTH -1)*4
StackAbt DCD AbtStackSpace + (ABT_STACK_LEGTH -1)*4
StackUnd DCD UndtStackSpace + (UND_STACK_LEGTH -1)*4
;�����ջ�ռ�
		AREA MyStacks, DATA, NOINIT, ALIGN=2
UsrStackSpace SPACE USR_STACK_LEGTH * 4		;�û���ϵͳ��ģʽ��ջ�ռ� 
SvcStackSpace SPACE SVC_STACK_LEGTH * 4		;����ģʽ��ջ�ռ� 
IrqStackSpace SPACE IRQ_STACK_LEGTH * 4		;�ж�ģʽ��ջ�ռ� 
FiqStackSpace SPACE FIQ_STACK_LEGTH * 4		;�����ж�ģʽ��ջ�ռ� 
AbtStackSpace SPACE ABT_STACK_LEGTH * 4		;��ֹ��ģʽ��ջ�ռ�
UndtStackSpace SPACE UND_STACK_LEGTH * 4	;δ����ģʽ��ջ

		END