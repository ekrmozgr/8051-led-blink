			ORG 0H
			SJMP ILK
			
			ORG 0BH
KESME_0:	LJMP KESME
					
			ORG 30H

ILK:		MOV R3,#19
BASLA_0:	MOV TMOD,#01H
			MOV TH0,#HIGH(15536)
			MOV TL0,#LOW(15536)
			SETB TR0
			MOV P1,#0FFH
BASLA:		CLR A
			MOV R1,#0
			MOV DPTR,#008FH
			MOV R7,#7  
			MOV R6,#8
			MOV P2,#0
			MOV P3,#0
KONTROL:	JB P1.0,ILK
KONTROL2:	JNB P1.0,ISLEM
ISLEM:		INC DPTR
			INC R1
			CLR A
			MOVC A,@A+DPTR
			MOV R2,A
			CALL SEC
			MOV P2,R2
			CJNE R1,#4,KONTROL		
			JNB TF0,BASLA
			CLR TF0
			DJNZ R3,BASLA_0
			MOV IE,#82H
			SJMP BASLA_0
			
SEC:		MOV P3,R7
			MOV P2,#0
			MOV A,R6
			MOV B,#2
			DIV AB
			MOV R6,A		
			ADD A,R7
			MOV R7,A
			RET


			ORG 0090H
				
BEN:		DB 79H,5CH,5BH,5FH
	

			ORG 0100H	
				
KESME:  	MOV R3,#19
			CPL P1.0
			MOV R0,#20
			MOV TMOD,#01H
SAY:
			MOV TH0,#HIGH(15536)
			MOV TL0,#LOW(15536)
			SETB TR0
KONTROL3: 	JNB TF0,KONTROL3
			CLR TF0
			DJNZ R0,SAY
			MOV IE,#0
			RETI

			END