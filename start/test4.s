		AREA Example4,CODE,READONLY ;��������� Example
		ENTRY 						;��ʶ�������
		CODE32 						;����32λARMָ��
START 
		;if(x>y) z=100;
		;else z=50;
		MOV R0,#76 		;��ʼ��x��ֵ
		MOV R1,#243 	;��ʼ��y��ֵ
		CMP R0,R1 		;�ж� x>y?
		MOVHI R2,#100 	;x>y ������ȷ��z=100
		MOVLS R2,#50 	;����ʧ����z=50
		;for(i=0; i<10; i++)
		;{ x++;
		;}
		;��xΪRO, iΪR2 (i��x��Ϊ�޷�������)
		MOV R0,#0		;��ʼ��x��ֵ 
		MOV R2,#0		;����i=0
FOR_L1 	CMP R2,#10		;�ж�i<10?
		BHS	FOR_END		;R2>=10,�˳�ѭ��

		ADD R0,R0,#1 	;ѭ���壬X++
		ADD R2,R2,#1 	;i++
		B	FOR_L1
FOR_END	NOP


		;while��x<=y��
		;�� x*=2;
		;��
		;��xΪRO, yΪR1 ��x��y��Ϊ�޷��������� 
		MOV R0,#1 		;��ʼ��x��ֵ
		MOV R1,#20 		;��ʼ��y��ֵ
		B WHILE_L2 		;����Ҫ�ж�����
WHILE_L1 MOV R0,R0,LSL#1 ;ѭ���壬x*=2
WHILE_L2 CMP R0,R1 		;x<y?
		BLS	WHILE_L1	;��������ȷ������ѭ��
WHILE_END NOP

		;do
		;�� x-��
		;�� while��x>0��;
		;��xΪRO ��xΪ�޷���������
		MOV R0,#5 		;��ʼ��x��ֵ
DOWHILE_L1 ADD R0,R0,#-1 ;ѭ���壬x--
DOWHILE_L2 MOVS R0,R0 	;R0 <= R0,��Ӱ���������־
		BNE DOWHILE_L1	;��RO��Ϊ0����x��Ϊ0>�������ѭ��
DOWHILE_END NOP

		END