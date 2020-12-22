X EQU 11			;����X��ֵΪ11
Y EQU 8				;����Ѿ��ֵΪ8
BIT23 EQU (1<<23)	;���� BIT23 ��ֵΪ 0x00800000


	AREA Examp1e2,CODE,READONLY ;��������� Example2
	ENTRY 						;��ʶ�������
	CODE32 						;����32λARMָ��
START 						;ʹ�� MOV��ADD ָ��ʵ��R8 = R3 = X + Y

	MOV R0,#X 					;R0 <=X, X��ֵ������8λͼ����
	MOV R1,#Y 					;R1 <= Y, Y��ֵ������8λͼ����
	ADD R3,R0,R1 				;���� R3 = X + Y
	MOV R8,R3 					;R8<= R3
		
	;ʹ�� MVN��SUB ָ��ʵ�֣�R5 = 0x5FFFFFF8 - R8 * 8
	MVN R0,#0xA0000007 			; 0XA0000007* �ķ���Ϊ 0x5FFFFF:F8
	SUB R5,R0,R8,LSL #3 		; R8 ���� 3 λ��������� R8 * 8

	;ʹ��CMPָ���ж�(5*Y/2>>(2*X)����������R5 = R5&OxFFFFOOOO,���� R5 = R5|0x000000FF
	MOV R0,#Y
	ADD R0,R0,R0,LSL #2 		;����R0 = Y + 4*Y = 5*Y
	MOV R0,R0,LSR #1 			;����R0 = 5*Y/2
	MOV R1,#X
	MOV R1,R1,LSL#1 			;���� R1 = 2*x
	CMP R0,R1 					;�Ƚ� R0 �� R1����(5*Y/2)��(2*X)����
	LDRHI R2,=0xFFFF0000 		;��(5*Y/2)>(2*X)���� R2 <= 0xFFFF0000
	ANDHI R5,R5,R2 				;��(5*Y/2)>(2*X)���� R5 = R5&R2
	ORRLS R5,R5,#0x000000FF 	;��(5*Y/2) < (2*X)���� R5 = R5|0x000000FF

	;ʹ��TSTָ�����R5��bit23�Ƿ�Ϊ1��������bit6λ����(ʹ��BICָ��)
	TST R5,#BIT23
	BICNE R5,R5,#0x00000040
	B START
	
	END