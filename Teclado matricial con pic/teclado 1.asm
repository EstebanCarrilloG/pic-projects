
; PICBASIC PRO(TM) Compiler 2.50, (c) 1998, 2007 microEngineering Labs, Inc. All Rights Reserved.  
_USED			EQU	1

	INCLUDE	"C:\PBP\16F877A.INC"


; Define statements.
#define		CODE_SIZE		 8
#define		LCD_DREG		 PORTC
#define		LCD_DBIT		 4
#define		LCD_RSREG		 PORTC
#define		LCD_RSBIT		 1
#define		LCD_EREG		 PORTC
#define		LCD_EBIT		 2

RAM_START       		EQU	00020h
RAM_END         		EQU	001EFh
RAM_BANKS       		EQU	00004h
BANK0_START     		EQU	00020h
BANK0_END       		EQU	0007Fh
BANK1_START     		EQU	000A0h
BANK1_END       		EQU	000EFh
BANK2_START     		EQU	00110h
BANK2_END       		EQU	0016Fh
BANK3_START     		EQU	00190h
BANK3_END       		EQU	001EFh
EEPROM_START    		EQU	02100h
EEPROM_END      		EQU	021FFh

R0              		EQU	RAM_START + 000h
R1              		EQU	RAM_START + 002h
R2              		EQU	RAM_START + 004h
R3              		EQU	RAM_START + 006h
R4              		EQU	RAM_START + 008h
R5              		EQU	RAM_START + 00Ah
R6              		EQU	RAM_START + 00Ch
R7              		EQU	RAM_START + 00Eh
R8              		EQU	RAM_START + 010h
FLAGS           		EQU	RAM_START + 012h
GOP             		EQU	RAM_START + 013h
RM1             		EQU	RAM_START + 014h
RM2             		EQU	RAM_START + 015h
RR1             		EQU	RAM_START + 016h
RR2             		EQU	RAM_START + 017h
T1              		EQU	RAM_START + 018h
_n               		EQU	RAM_START + 01Ah
_pausa           		EQU	RAM_START + 01Bh
_x               		EQU	RAM_START + 01Ch
_PORTL           		EQU	 PORTB
_PORTH           		EQU	 PORTC
_TRISL           		EQU	 TRISB
_TRISH           		EQU	 TRISC
#define _c0              	_PORTD??6
#define _c1              	_PORTD??5
#define _c2              	_PORTD??4
#define _f0              	_PORTD??3
#define _f1              	_PORTD??2
#define _f2              	_PORTD??1
#define _f3              	_PORTD??0
#define _PORTD??6        	 PORTD, 006h
#define _PORTD??5        	 PORTD, 005h
#define _PORTD??4        	 PORTD, 004h
#define _PORTD??3        	 PORTD, 003h
#define _PORTD??2        	 PORTD, 002h
#define _PORTD??1        	 PORTD, 001h
#define _PORTD??0        	 PORTD, 000h
	INCLUDE	"TECLAD~1.MAC"
	INCLUDE	"C:\PBP\PBPPIC14.LIB"

	MOVE?CB	00Fh, TRISB
	MOVE?CB	00Ah, _pausa
	LCDOUT?C	0FEh
	LCDOUT?C	002h
	LCDOUT?C	054h
	LCDOUT?C	045h
	LCDOUT?C	043h
	LCDOUT?C	04Ch
	LCDOUT?C	041h
	LCDOUT?C	053h
	LCDOUT?C	020h
	LCDOUT?C	050h
	LCDOUT?C	055h
	LCDOUT?C	04Ch
	LCDOUT?C	053h
	LCDOUT?C	041h
	LCDOUT?C	044h
	LCDOUT?C	041h
	LCDOUT?C	053h
	LCDOUT?C	03Ah

	LABEL?L	_ciclo	
	HIGH?T	_c0
	LOW?T	_c1
	LOW?T	_c2
	CMPNE?TCL	_f0, 001h, L00001
	MOVE?CB	003h, _x
	GOSUB?L	_almacenarnumeros
	LABEL?L	L00001	
	CMPNE?TCL	_f1, 001h, L00003
	MOVE?CB	006h, _x
	GOSUB?L	_almacenarnumeros
	LABEL?L	L00003	
	CMPNE?TCL	_f2, 001h, L00005
	MOVE?CB	009h, _x
	GOSUB?L	_almacenarnumeros
	LABEL?L	L00005	
	CMPNE?TCL	_f3, 001h, L00007
	MOVE?CB	023h, _x
	GOSUB?L	_almacenarnumeros
	LABEL?L	L00007	
	LOW?T	_c0
	PAUSE?B	_pausa
	LOW?T	_c0
	HIGH?T	_c1
	LOW?T	_c2
	CMPNE?TCL	_f0, 001h, L00009
	MOVE?CB	002h, _x
	GOSUB?L	_almacenarnumeros
	LABEL?L	L00009	
	CMPNE?TCL	_f1, 001h, L00011
	MOVE?CB	005h, _x
	GOSUB?L	_almacenarnumeros
	LABEL?L	L00011	
	CMPNE?TCL	_f2, 001h, L00013
	MOVE?CB	008h, _x
	GOSUB?L	_almacenarnumeros
	LABEL?L	L00013	
	CMPNE?TCL	_f3, 001h, L00015
	MOVE?CB	000h, _x
	GOSUB?L	_almacenarnumeros
	LABEL?L	L00015	
	LOW?T	_c1
	PAUSE?B	_pausa
	LOW?T	_c0
	LOW?T	_c1
	HIGH?T	_c2
	CMPNE?TCL	_f0, 001h, L00017
	MOVE?CB	001h, _x
	GOSUB?L	_almacenarnumeros
	LABEL?L	L00017	
	CMPNE?TCL	_f1, 001h, L00019
	MOVE?CB	004h, _x
	GOSUB?L	_almacenarnumeros
	LABEL?L	L00019	
	CMPNE?TCL	_f2, 001h, L00021
	MOVE?CB	007h, _x
	GOSUB?L	_almacenarnumeros
	LABEL?L	L00021	
	CMPNE?TCL	_f3, 001h, L00023
	MOVE?CB	02Ah, _x
	GOSUB?L	_almacenarnumeros
	LABEL?L	L00023	
	LOW?T	_c2
	PAUSE?B	_pausa
	GOTO?L	_ciclo

	LABEL?L	_almacenarnumeros	
	LCDOUT?C	0FEh
	LCDOUT?C	002h
	LCDOUT?C	054h
	LCDOUT?C	045h
	LCDOUT?C	043h
	LCDOUT?C	04Ch
	LCDOUT?C	041h
	LCDOUT?C	053h
	LCDOUT?C	020h
	LCDOUT?C	050h
	LCDOUT?C	055h
	LCDOUT?C	04Ch
	LCDOUT?C	053h
	LCDOUT?C	041h
	LCDOUT?C	044h
	LCDOUT?C	041h
	LCDOUT?C	053h
	LCDOUT?C	03Ah
	LCDOUT?C	0FEh
	ADD?CBW	0C0h, _n, T1
	LCDOUT?W	T1
	CMPNE?BCL	_x, 02Ah, L00025
	LCDOUT?C	02Ah
	GOTO?L	L00026
	LABEL?L	L00025	
	CMPNE?BCL	_x, 023h, L00027
	LCDOUT?C	023h
	GOTO?L	L00028
	LABEL?L	L00027	
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?B	_x
	LCDOUTDEC?	
	LABEL?L	L00028	
	LABEL?L	L00026	
	PAUSE?C	032h
	ADD?BCB	_n, 001h, _n
	CMPLT?BCL	_n, 010h, L00029
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	MOVE?CB	000h, _n
	LCDOUT?C	0FEh
	LCDOUT?C	002h
	LCDOUT?C	054h
	LCDOUT?C	045h
	LCDOUT?C	043h
	LCDOUT?C	04Ch
	LCDOUT?C	041h
	LCDOUT?C	053h
	LCDOUT?C	020h
	LCDOUT?C	050h
	LCDOUT?C	055h
	LCDOUT?C	04Ch
	LCDOUT?C	053h
	LCDOUT?C	041h
	LCDOUT?C	044h
	LCDOUT?C	041h
	LCDOUT?C	053h
	LCDOUT?C	03Ah
	LABEL?L	L00029	
	RETURN?	

	END
