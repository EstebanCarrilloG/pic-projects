
; PICBASIC PRO(TM) Compiler 2.50, (c) 1998, 2007 microEngineering Labs, Inc. All Rights Reserved.  
_USED			EQU	1

	INCLUDE	"C:\PBP\16F877A.INC"


; Define statements.
#define		CODE_SIZE		 8
#define		LCD_DREG		 PORTB 
#define		LCD_DBIT		 0 
#define		LCD_RSREG		 PORTB 
#define		LCD_RSBIT		 4 
#define		LCD_EREG		 PORTB 
#define		LCD_EBIT		 5
#define		ADC_BITS		 10 ;Fijar número de BITS del resultado (5,8,10)
#define		ADC_CLOCK		 3 ;Fijar EL CLOCK (rc = 3)
#define		ADC_SAMPLEUS		 50 ;Fijar el tiempo de muestreo en Us

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
_dato            		EQU	RAM_START + 018h
_tempMax         		EQU	RAM_START + 01Ah
_tempMin         		EQU	RAM_START + 01Bh
_x               		EQU	RAM_START + 01Ch
_PORTL           		EQU	 PORTB
_PORTH           		EQU	 PORTC
_TRISL           		EQU	 TRISB
_TRISH           		EQU	 TRISC
#define _calf            	_PORTD??3
#define _vent            	_PORTD??4
#define _enter           	_PORTD??5
#define _botonBajar      	_PORTD??6
#define _botonSubir      	_PORTD??7
#define _PORTD??3        	 PORTD, 003h
#define _PORTD??4        	 PORTD, 004h
#define _PORTD??5        	 PORTD, 005h
#define _PORTD??6        	 PORTD, 006h
#define _PORTD??7        	 PORTD, 007h

; Constants.
_g               		EQU	000DFh

; EEPROM data.
	ORG EEPROM_START

	ORG EEPROM_START + 000h
	DE	012h
	DE	019h

	INCLUDE	"SDCCON~1.MAC"
	INCLUDE	"C:\PBP\PBPPIC14.LIB"

	MOVE?CB	001h, TRISA
	MOVE?CB	00Eh, ADCON1
	MOVE?CB	0E0h, TRISD

	LABEL?L	_inicio	
	READ?CB	000h, _tempMin
	READ?CB	001h, _tempMax

	LABEL?L	_sensar	
	ADCIN?CW	000h, _dato
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	0FEh
	LCDOUT?C	002h
	LCDOUT?C	054h
	LCDOUT?C	02Eh
	LCDOUT?C	04Dh
	LCDOUT?C	049h
	LCDOUT?C	04Eh
	LCDOUT?C	020h
	LCDOUT?C	054h
	LCDOUT?C	02Eh
	LCDOUT?C	041h
	LCDOUT?C	043h
	LCDOUT?C	054h
	LCDOUT?C	020h
	LCDOUT?C	054h
	LCDOUT?C	02Eh
	LCDOUT?C	04Dh
	LCDOUT?C	041h
	LCDOUT?C	058h
	DIV?WCW	_dato, 080h, _dato
	LCDOUT?C	0FEh
	LCDOUT?C	0C6h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?W	_dato
	LCDOUTDEC?	
	LCDOUT?C	_g
	LCDOUT?C	043h
	LCDOUT?C	0FEh
	LCDOUT?C	0C0h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?B	_tempMin
	LCDOUTDEC?	
	LCDOUT?C	_g
	LCDOUT?C	043h
	LCDOUT?C	0FEh
	LCDOUT?C	0CCh
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?B	_tempMax
	LCDOUTDEC?	
	LCDOUT?C	_g
	LCDOUT?C	043h
	MOVE?CB	000h, _x
	LABEL?L	L00001	
	CMPGT?BCL	_x, 064h, L00002
	CMPEQ?TCL	_enter, 001h, _grabar1a
	PAUSE?C	00Fh
	NEXT?BCL	_x, 001h, L00001
	LABEL?L	L00002	
	CMPLT?WBL	_dato, _tempMin, _calentar
	CMPGT?WBL	_dato, _tempMax, _enfriar
	LOW?T	_calf
	LOW?T	_vent
	GOTO?L	_sensar

	LABEL?L	_calentar	
	HIGH?T	_calf
	LOW?T	_vent
	GOTO?L	_sensar

	LABEL?L	_enfriar	
	HIGH?T	_vent
	LOW?T	_calf
	GOTO?L	_sensar

	LABEL?L	_grabar1a	
	GOSUB?L	_soltar

	LABEL?L	_grabar1	
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	0FEh
	LCDOUT?C	002h
	LCDOUT?C	050h
	LCDOUT?C	052h
	LCDOUT?C	04Fh
	LCDOUT?C	047h
	LCDOUT?C	052h
	LCDOUT?C	041h
	LCDOUT?C	04Dh
	LCDOUT?C	041h
	LCDOUT?C	052h
	LCDOUT?C	020h
	LCDOUT?C	054h
	LCDOUT?C	045h
	LCDOUT?C	04Dh
	LCDOUT?C	050h
	LCDOUT?C	03Ah
	LCDOUT?C	0FEh
	LCDOUT?C	0C0h
	LCDOUT?C	04Dh
	LCDOUT?C	069h
	LCDOUT?C	06Eh
	LCDOUT?C	069h
	LCDOUT?C	06Dh
	LCDOUT?C	061h
	LCDOUT?C	020h
	LCDOUT?C	03Dh
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?B	_tempMin
	LCDOUTDEC?	
	LCDOUT?C	_g
	LCDOUT?C	043h
	PAUSE?C	064h
	CMPEQ?TCL	_botonBajar, 001h, _restar1
	CMPEQ?TCL	_botonSubir, 001h, _sumar1
	CMPEQ?TCL	_enter, 001h, _grabarA
	GOTO?L	_grabar1

	LABEL?L	_restar1	
	GOSUB?L	_soltar
	CMPLT?BCL	_tempMin, 009h, _grabar1
	SUB?BCB	_tempMin, 001h, _tempMin
	GOTO?L	_grabar1

	LABEL?L	_sumar1	
	GOSUB?L	_soltar
	CMPGT?BCL	_tempMin, 012h, _grabar1
	ADD?BCB	_tempMin, 001h, _tempMin
	GOTO?L	_grabar1

	LABEL?L	_grabarA	
	GOSUB?L	_soltar
	WRITE?CB	000h, _tempMin

	LABEL?L	_grabar2	
	LCDOUT?C	0FEh
	LCDOUT?C	001h
	LCDOUT?C	0FEh
	LCDOUT?C	002h
	LCDOUT?C	050h
	LCDOUT?C	052h
	LCDOUT?C	04Fh
	LCDOUT?C	047h
	LCDOUT?C	052h
	LCDOUT?C	041h
	LCDOUT?C	04Dh
	LCDOUT?C	041h
	LCDOUT?C	052h
	LCDOUT?C	020h
	LCDOUT?C	054h
	LCDOUT?C	045h
	LCDOUT?C	04Dh
	LCDOUT?C	050h
	LCDOUT?C	03Ah
	LCDOUT?C	0FEh
	LCDOUT?C	0C0h
	LCDOUT?C	04Dh
	LCDOUT?C	061h
	LCDOUT?C	078h
	LCDOUT?C	069h
	LCDOUT?C	06Dh
	LCDOUT?C	061h
	LCDOUT?C	020h
	LCDOUT?C	03Dh
	LCDOUT?C	020h
	LCDOUTCOUNT?C	000h
	LCDOUTNUM?B	_tempMax
	LCDOUTDEC?	
	LCDOUT?C	_g
	LCDOUT?C	043h
	PAUSE?C	064h
	CMPEQ?TCL	_botonBajar, 001h, _restar2
	CMPEQ?TCL	_botonSubir, 001h, _sumar2
	CMPEQ?TCL	_enter, 001h, _grabarB
	GOTO?L	_grabar2

	LABEL?L	_restar2	
	GOSUB?L	_soltar
	CMPLT?BCL	_tempMax, 018h, _grabar2
	SUB?BCB	_tempMax, 001h, _tempMax
	GOTO?L	_grabar2

	LABEL?L	_sumar2	
	GOSUB?L	_soltar
	CMPGT?BCL	_tempMax, 028h, _grabar2
	ADD?BCB	_tempMax, 001h, _tempMax
	GOTO?L	_grabar2

	LABEL?L	_grabarB	
	GOSUB?L	_soltar
	WRITE?CB	001h, _tempMax
	GOTO?L	_inicio

	LABEL?L	_soltar	

	LABEL?L	_soltar2	
	CMPEQ?TCL	_botonBajar, 001h, _soltar2
	CMPEQ?TCL	_botonSubir, 001h, _soltar2
	CMPEQ?TCL	_enter, 001h, _soltar2
	PAUSE?C	064h
	RETURN?	

	END
