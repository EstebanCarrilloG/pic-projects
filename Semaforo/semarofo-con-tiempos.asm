
; PICBASIC PRO(TM) Compiler 2.50, (c) 1998, 2007 microEngineering Labs, Inc. All Rights Reserved.  
_USED			EQU	1

	INCLUDE	"C:\PBP\16F628A.INC"

RAM_START       		EQU	00020h
RAM_END         		EQU	0014Fh
RAM_BANKS       		EQU	00003h
BANK0_START     		EQU	00020h
BANK0_END       		EQU	0007Fh
BANK1_START     		EQU	000A0h
BANK1_END       		EQU	000EFh
BANK2_START     		EQU	00120h
BANK2_END       		EQU	0014Fh
EEPROM_START    		EQU	02100h
EEPROM_END      		EQU	0217Fh

; C:\PBP\PBPPIC14.RAM      	00012	R0      VAR     WORD BANK0 SYSTEM       ' System Register
R0              		EQU	RAM_START + 000h
; C:\PBP\PBPPIC14.RAM      	00013	R1      VAR     WORD BANK0 SYSTEM       ' System Register
R1              		EQU	RAM_START + 002h
; C:\PBP\PBPPIC14.RAM      	00014	R2      VAR     WORD BANK0 SYSTEM       ' System Register
R2              		EQU	RAM_START + 004h
; C:\PBP\PBPPIC14.RAM      	00015	R3      VAR     WORD BANK0 SYSTEM       ' System Register
R3              		EQU	RAM_START + 006h
; C:\PBP\PBPPIC14.RAM      	00016	R4      VAR     WORD BANK0 SYSTEM       ' System Register
R4              		EQU	RAM_START + 008h
; C:\PBP\PBPPIC14.RAM      	00017	R5      VAR     WORD BANK0 SYSTEM       ' System Register
R5              		EQU	RAM_START + 00Ah
; C:\PBP\PBPPIC14.RAM      	00018	R6      VAR     WORD BANK0 SYSTEM       ' System Register
R6              		EQU	RAM_START + 00Ch
; C:\PBP\PBPPIC14.RAM      	00019	R7      VAR     WORD BANK0 SYSTEM       ' System Register
R7              		EQU	RAM_START + 00Eh
; C:\PBP\PBPPIC14.RAM      	00020	R8      VAR     WORD BANK0 SYSTEM       ' System Register
R8              		EQU	RAM_START + 010h
; C:\PBP\PBPPIC14.RAM      	00026	FLAGS   VAR     BYTE BANK0 SYSTEM       ' Static flags
FLAGS           		EQU	RAM_START + 012h
; C:\PBP\PBPPIC14.RAM      	00025	GOP     VAR     BYTE BANK0 SYSTEM       ' Gen Op Parameter
GOP             		EQU	RAM_START + 013h
; C:\PBP\PBPPIC14.RAM      	00022	RM1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Mask
RM1             		EQU	RAM_START + 014h
; C:\PBP\PBPPIC14.RAM      	00024	RM2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Mask
RM2             		EQU	RAM_START + 015h
; C:\PBP\PBPPIC14.RAM      	00021	RR1     VAR     BYTE BANK0 SYSTEM       ' Pin 1 Register
RR1             		EQU	RAM_START + 016h
; C:\PBP\PBPPIC14.RAM      	00023	RR2     VAR     BYTE BANK0 SYSTEM       ' Pin 2 Register
RR2             		EQU	RAM_START + 017h
; C:\PBP\16F628A.BAS       	00020	PORTL   VAR     PORTB
_PORTL           		EQU	 PORTB
; C:\PBP\16F628A.BAS       	00021	PORTH   VAR     PORTA
_PORTH           		EQU	 PORTA
; C:\PBP\16F628A.BAS       	00022	TRISL   VAR     TRISB
_TRISL           		EQU	 TRISB
; C:\PBP\16F628A.BAS       	00023	TRISH   VAR     TRISA
_TRISH           		EQU	 TRISA
	INCLUDE	"SEMARO~1.MAC"
	INCLUDE	"C:\PBP\PBPPIC14.LIB"


; C:\PBP\16F628A.BAS       	00012	BANK0   $0020, $007F
; C:\PBP\16F628A.BAS       	00013	BANK1   $00A0, $00EF
; C:\PBP\16F628A.BAS       	00014	BANK2   $0120, $014F
; C:\PBP\16F628A.BAS       	00015	EEPROM  $2100, $217F
; C:\PBP\16F628A.BAS       	00016	LIBRARY "PBPPIC14"

; C:\PBP\16F628A.BAS       	00018	        include "PIC14EXT.BAS"

; C:\PBP\16F628A.BAS       	00025	        include "PBPPIC14.RAM"

; C:\USERS\ESTEBAN\DOCUMENTS\MCS\SEMARO~1.PBP	00012	trisb = 0
	MOVE?CB	000h, TRISB

; C:\USERS\ESTEBAN\DOCUMENTS\MCS\SEMARO~1.PBP	00014	semaforo:

	LABEL?L	_semaforo	

; C:\USERS\ESTEBAN\DOCUMENTS\MCS\SEMARO~1.PBP	00015	portb=%001100
	MOVE?CB	00Ch, PORTB

; C:\USERS\ESTEBAN\DOCUMENTS\MCS\SEMARO~1.PBP	00016	pause 5000
	PAUSE?C	01388h

; C:\USERS\ESTEBAN\DOCUMENTS\MCS\SEMARO~1.PBP	00017	portb=%001010
	MOVE?CB	00Ah, PORTB

; C:\USERS\ESTEBAN\DOCUMENTS\MCS\SEMARO~1.PBP	00018	pause 1000
	PAUSE?C	003E8h

; C:\USERS\ESTEBAN\DOCUMENTS\MCS\SEMARO~1.PBP	00019	portb=%100001 
	MOVE?CB	021h, PORTB

; C:\USERS\ESTEBAN\DOCUMENTS\MCS\SEMARO~1.PBP	00020	pause 5000
	PAUSE?C	01388h

; C:\USERS\ESTEBAN\DOCUMENTS\MCS\SEMARO~1.PBP	00021	PORTB=%010001
	MOVE?CB	011h, PORTB

; C:\USERS\ESTEBAN\DOCUMENTS\MCS\SEMARO~1.PBP	00022	PAUSE 1000
	PAUSE?C	003E8h

; C:\USERS\ESTEBAN\DOCUMENTS\MCS\SEMARO~1.PBP	00023	goto semaforo
	GOTO?L	_semaforo

	END
