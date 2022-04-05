/* 

* Código escrito por: Esteban Carrillo para EDEPTEC. 
* Página web: https://www.edeptec.com
* Facebook: @edeptec
* Youtube: https://youtube.com/c/EDEPTEC

*/

#include <16F877a.h>
#fuses XT,NOWDT,NOPROTECT,NOLVP
#use delay(clock = 4M)
#use fast_io (a)
#use fast_io (c)
#use fast_io (d)

byte CONST display[10] ={0x40,0x79,0x24,0x30,0x19,0x12,0x02,0x78,0x00,0x10};

int16 t= 1950;
int pause=0,cambio=0;

#INT_EXT
void ext_isr(VOID){

   IF(pause==0)
   pause=1;

   ELSE
   pause=0;
}

void main (){
   byte A=0,B=0,C=0,D=0,E=0,F=0;
   set_tris_b(0x01);
   set_tris_c(0x00);
   set_tris_d(0x00);
   set_tris_a(0x00);
   enable_interrupts(INT_EXT);
   ext_INT_edge(L_to_H);
   enable_interrupts(GLOBAL);
   WHILE(TRUE){
      initiation: IF(pause==0) {
      IF(cambio==0) {
         output_a(0x01);
         output_c(display[A]);
         delay_us(t);
         output_a(0x02);
         output_c(display[B]);
         delay_us(t);
         output_a(0x04);
         output_d(display[C]);
         delay_us(t);
         output_a(0x08);
         output_d(display[D]);
         delay_us(t);
      }

      ELSE {
   output_a(0x01);
   output_c(display[C]);
   delay_us(t);
   output_a(0x02);
   output_c(display[D]);
   delay_us(t);
   output_a(0x04);
   output_d(display[E]);
   delay_us(t);
   output_a(0x08);
   output_d(display[F]);
   delay_us(t);
      }
      }

else {
   IF(cambio==0) {
   output_a(0x01);
   output_c(display[A]);
   delay_us(t);
   output_a(0x02);
   output_c(display[B]);
   delay_us(t);
   output_a(0x04);
   output_d(display[C]);
   delay_us(t);
   output_a(0x08);
   output_d(display[D]);
   delay_us(t);
   }

else {
   output_a(0x01);
   output_c(display[C]);
   delay_us(t);
   output_a(0x02);
   output_c(display[D]);
   delay_us(t);
   output_a(0x04);
   output_d(display[E]);
   delay_us(t);
   output_a(0x08);
   output_d(display[F]);
   delay_us(t);
}

A = A+1;

if (A<=9)
   GOTO initiation;

else
A=0;
B=B+1;

if(B<=9)
   GOTO initiation;

else
A=0;
B=0;
C=C+1;

if(C<=9)
   GOTO initiation;

else
A=0;
B=0;
C=0;
D=D+1;

if(D<=5)
   GOTO initiation;

else
A=0;
B=0;
C=0;
D=0;
cambio=1;
E=E+1;

if(E<=9)
   GOTO initiation;

else
A=0;
B=0;
C=0;
D=0;
E=0;
F=1;
pause=0;
goto initiation;
}
   }
}


