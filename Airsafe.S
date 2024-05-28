;------------------------
; Assembly Code - Master
;------------------------
#define __SFR_OFFSET 0x00
#include "avr/io.h"
;------------------------
.global main

;============================Delay Routine=============================;
delay_sec: ;1s delay
  LDI R20, 255
  ld1: LDI R21, 255
  ld2: LDI R22, 124
  ld3: DEC R22
  BRNE ld3
  DEC R21
  BRNE ld2
  DEC R20
  BRNE ld1
  RET

delay_short:
    NOP
    NOP
    RET

delay_us:
    LDI   R30, 90
lu: RCALL delay_short
    DEC   R30
    BRNE  lu
    RET
    
delay_ms:
    LDI   R31, 40
lms:RCALL delay_us
    DEC   R31
    BRNE  lms
    RET

;============================ADC Routine============================;
ADC_read:
  LDI   R20, 0xC7   ;set ADSC in ADCSRA to start conversion
  STS   ADCSRA, R20

  wait_adc:
    LDS   R21, ADCSRA ;check ADIF flag in ADCSRA
    SBRS  R21, 4      ;skip jump when conversion is done (flag set)
    RJMP  wait_adc    ;loop until ADIF flag is set

  LDI   R17, 0xD7   ;set ADIF flag again
  STS   ADCSRA, R17 ;so that controller clears ADIF

  LDS   R19, ADCL   ;get low-byte result from ADCL
  LDS   R18, ADCH   ;get high-byte result from ADCH
  RET

;============================I2C Routine============================;
I2C_start:
    LDI   R21, (1<<TWINT)|(1<<TWSTA)|(1<<TWEN)
    STS   TWCR, R21       ;transmit START condition

    wt1:
        LDS   R21, TWCR
        SBRS  R21, TWINT      ;TWI interrupt = 1?
        RJMP  wt1             ;no, wait for end of transmission
    RET

I2C_write:
    STS   TWDR, R27       ;copy byte in R27 into data register
    LDI   R21, (1<<TWINT)|(1<<TWEN)
    STS   TWCR, R21       ;transmit byte

    wt2:
        LDS   R21, TWCR
        SBRS  R21, TWINT
        RJMP  wt2             ;wait for end of transmission
    RET

I2C_stop:
    LDI   R21, (1<<TWINT)|(1<<TWSTO)|(1<<TWEN)
    STS   TWCR, R21       ;transmit STOP condition
    RET

;============================ASCII Routine============================;
ASCII_MSD:
  MOV R23, R16 ;save copy of result
  ANDI R16, 0xF0 ;extract & swap high-nibble
  SWAP R16
  SUBI R16, -48 ;R16 = R16 - (48) = R16 + 48
  MOV R28, R16 ;save a copy of high-byte result
  SUBI R28, 58 ;if +ve
  BRPL A_F_D1 ;branch & add 7 to get ASCII A to F
MSD_RET:
  RET
A_F_D1:
  SUBI R16, -7 ;R16 = R16 - (7) = R16 + 7
  RJMP MSD_RET

ASCII_LSD:
  MOV R16, R23 ;restore copy of result
  ANDI R16, 0x0F ;extract low-nibble
  SUBI R16, -48 ;R16 = R16 - (48) = R16 + 48
  MOV R28, R16 ;save a copy of high-byte result
  SUBI R28, 58 ;if +ve
  BRPL A_F_D0 ;branch & add 7 to get ASCII A to F
LSD_RET:
  RET
A_F_D0:
  SUBI R16, -7 ;R16 = R16 - (7) = R16 + 7
  RJMP LSD_RET

;============================LCD Routine============================;
LCD_sendByte:
    ;R29 = data
    RCALL I2C_start

    LDI R27, 0x40
    RCALL I2C_write

    MOV R27, R29
    RCALL I2C_write

    RCALL I2C_stop
    RET

LCD_send4Bits:
    ;R29 = Value
    RCALL LCD_sendByte
    
    ORI R29, 0b00000100
    RCALL LCD_sendByte
    RCALL delay_short

    ANDI R29, 0b11111011
    RCALL LCD_sendByte
    RCALL delay_us
    RET

LCD_writeChar:
    ;R29 = Value | R26 = Mode
    PUSH R29
    ANDI R29, 0xF0
    OR R29, R26 
    RCALL LCD_send4Bits

    POP R29
    SWAP R29
    ANDI R29, 0xF0
    OR R29, R26
    RCALL LCD_send4Bits
    RET
    
LCD_init:
    LDI R26, 0x00

    LDI R29, 0x33
    RCALL LCD_writeChar
    RCALL delay_ms

    LDI R29, 0x32
    RCALL LCD_writeChar
    RCALL delay_ms

    LDI R29, 0x28
    RCALL LCD_writeChar
    RCALL delay_ms

    LDI R29, 0x0C
    RCALL LCD_writeChar
    RCALL delay_ms
    
    LDI R29, 0x01
    RCALL LCD_writeChar
    RCALL delay_ms

    LDI R29, 0x06
    RCALL LCD_writeChar
    RET

printvalue:
    ;R18 = ADC Byte | R29 = Value To LCD | R26 = Mode To LCD
    MOV R16, R18

    LDI R26, 0x01
    RCALL ASCII_MSD
    MOV R29, R16
    RCALL LCD_writeChar

    RCALL ASCII_LSD
    MOV R29, R16
    RCALL LCD_writeChar

    LDI R29, 0x80
    LDI R26, 0x00
    RCALL LCD_writeChar
    RET

;============================Output Routine============================;
pick_led:
  ;Set green
  LDI R24, 0b00000001
  
  CPI R18, 141
  BRLO led_return

  ;Set yellow
  LDI R24, 0b00000010
  CPI R18, 216
  BRLO led_return

  ;Set Red
  LDI R24, 0b00000100
  ;Set Buzzer
  SBI PORTD, 7

  led_return:
    OUT PORTB, R24
    RET

;============================Main Routine============================;
main:  
  ;Output Config
  LDI R24, 0b00000111
  OUT DDRB, R24
  SBI DDRD, 7

  ;Analog Config
  CBI DDRC, 0
  LDI R20, 0x60 ;internal 5V, right-justified data, ADC0
  STS ADMUX, R20
  LDI R20, 0x87 ;enable ADC, ADC prescaler CLK/128
  STS ADCSRA, R20

  ;I2C Config
  LDI   R21, 0
  STS   TWSR, R21       ;prescaler = 0
  LDI   R21, 72
  STS   TWBR, R21       ;SCK freq = 100kHz
  LDI   R21, (1<<TWEN)
  STS   TWCR, R21       ;enable TWI

  RCALL LCD_init
  
loop:
  RCALL ADC_read
  
  RCALL printvalue

  RCALL pick_led
  RCALL delay_sec
  RJMP loop