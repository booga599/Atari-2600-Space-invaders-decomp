; Disassembly of ~\Downloads\Atari 2600\Atari 2600\Space Invaders.bin
; Disassembled 06/23/26 22:03:49
; Using Stella 7.0
;
; ROM properties name : Space Invaders (1980) (Atari)
; ROM properties MD5  : 72ffbef6504b75e69ee1045af9075f66
; Bankswitch type     : 4K* (4K) 
;
; Legend: *  = CODE not yet run (tentative code)
;         D  = DATA directive (referenced in some way)
;         G  = GFX directive, shown as '#' (stored in player, missile, ball)
;         P  = PGFX directive, shown as '*' (stored in playfield)
;         C  = COL directive, shown as color constants (stored in player color)
;         CP = PCOL directive, shown as color constants (stored in playfield color)
;         CB = BCOL directive, shown as color constants (stored in background color)
;         A  = AUD directive (stored in audio registers)
;         i  = indexed accessed only
;         c  = used by code executed in RAM
;         s  = used by stack
;         !  = page crossed, 1 cycle penalty

    processor 6502


;-----------------------------------------------------------
;      Color constants
;-----------------------------------------------------------

BLACK            = $00
YELLOW           = $10
BROWN            = $20
ORANGE           = $30
RED              = $40
MAUVE            = $50
VIOLET           = $60
PURPLE           = $70
BLUE             = $80
BLUE_CYAN        = $90
CYAN             = $a0
CYAN_GREEN       = $b0
GREEN            = $c0
GREEN_YELLOW     = $d0
GREEN_BEIGE      = $e0
BEIGE            = $f0


;-----------------------------------------------------------
;      TIA and IO constants accessed
;-----------------------------------------------------------

CXP0FB          = $02  ; (R)
CXP1FB          = $03  ; (R)
INPT4           = $0c  ; (R)
INPT5           = $0d  ; (R)

VSYNC           = $00  ; (W)
VBLANK          = $01  ; (W)
WSYNC           = $02  ; (W)
NUSIZ0          = $04  ; (W)
NUSIZ1          = $05  ; (W)
COLUP0          = $06  ; (W)
COLUP1          = $07  ; (W)
COLUPF          = $08  ; (W)
COLUBK          = $09  ; (W)
CTRLPF          = $0a  ; (W)
PF0             = $0d  ; (W)
PF1             = $0e  ; (W)
PF2             = $0f  ; (W)
RESP0           = $10  ; (W)
RESP1           = $11  ; (W)
RESBL           = $14  ; (W)
AUDC0           = $15  ; (W)
;AUDC1          = $16  ; (Wi)
AUDF0           = $17  ; (W)
;AUDF1          = $18  ; (Wi)
AUDV0           = $19  ; (W)
;AUDV1          = $1a  ; (Wi)
GRP0            = $1b  ; (W)
GRP1            = $1c  ; (W)
ENABL           = $1f  ; (W)
HMP0            = $20  ; (W)
HMP1            = $21  ; (W)
HMBL            = $24  ; (W)
VDELP0          = $25  ; (W)
VDELP1          = $26  ; (W)
HMOVE           = $2a  ; (W)
HMCLR           = $2b  ; (W)
CXCLR           = $2c  ; (W)

SWCHA           = $0280
SWCHB           = $0282
INTIM           = $0284
TIM8T           = $0295
TIM64T          = $0296


;-----------------------------------------------------------
;      RIOT RAM (zero-page) labels
;-----------------------------------------------------------

ram_80          = $80
ram_81          = $81
ram_82          = $82
ram_83          = $83
ram_84          = $84
ram_85          = $85
ram_86          = $86
ram_87          = $87
ram_88          = $88
ram_89          = $89
ram_8A          = $8a
ram_8B          = $8b
ram_8C          = $8c
ram_8D          = $8d
ram_8E          = $8e
ram_8F          = $8f
ram_90          = $90
ram_91          = $91
ram_92          = $92; (s)
;                 $93  (i)
;                 $94  (i)
;                 $95  (i)
;                 $96  (i)
ram_97          = $97
ram_98          = $98
ram_99          = $99
ram_9A          = $9a
ram_9B          = $9b
ram_9C          = $9c
ram_9D          = $9d
ram_9E          = $9e
ram_9F          = $9f
;                 $a0  (i)
;                 $a1  (i)
;                 $a2  (i)
;                 $a3  (i)
;                 $a4  (i)
;                 $a5  (i)
;                 $a6  (i)
ram_A7          = $a7
;                 $a8  (i)
;                 $a9  (i)
ram_AA          = $aa
ram_AB          = $ab
;                 $ac  (i)
;                 $ad  (i)
;                 $ae  (i)
;                 $af  (i)
;                 $b0  (i)
;                 $b1  (i)
;                 $b2  (i)
;                 $b3  (i)
;                 $b4  (i)
;                 $b5  (i)
;                 $b6  (i)
;                 $b7  (i)
;                 $b8  (i)
;                 $b9  (i)
;                 $ba  (i)
;                 $bb  (i)
;                 $bc  (i)
;                 $bd  (i)
;                 $be  (i)
;                 $bf  (i)
;                 $c0  (i)
;                 $c1  (i)
;                 $c2  (i)
;                 $c3  (i)
;                 $c4  (i)
;                 $c5  (i)
ram_C6          = $c6
ram_C7          = $c7
ram_C8          = $c8
ram_C9          = $c9
ram_CA          = $ca
ram_CB          = $cb
ram_CC          = $cc
ram_CD          = $cd
ram_CE          = $ce
ram_CF          = $cf
ram_D0          = $d0
ram_D1          = $d1
ram_D2          = $d2
ram_D3          = $d3
ram_D4          = $d4
ram_D5          = $d5
ram_D6          = $d6
ram_D7          = $d7
ram_D8          = $d8
ram_D9          = $d9
ram_DA          = $da
ram_DB          = $db
ram_DC          = $dc
ram_DD          = $dd
ram_DE          = $de
ram_DF          = $df
ram_E0          = $e0
ram_E1          = $e1
ram_E2          = $e2
ram_E3          = $e3
ram_E4          = $e4
ram_E5          = $e5
ram_E6          = $e6
ram_E7          = $e7
ram_E8          = $e8
ram_E9          = $e9
ram_EA          = $ea
ram_EB          = $eb
ram_EC          = $ec
ram_ED          = $ed
ram_EE          = $ee
ram_EF          = $ef
ram_F0          = $f0
ram_F1          = $f1
ram_F2          = $f2
ram_F3          = $f3
ram_F4          = $f4
ram_F5          = $f5
ram_F6          = $f6
ram_F7          = $f7
ram_F8          = $f8
ram_F9          = $f9
ram_FA          = $fa

;                 $fc  (s)
;                 $fd  (s)
;                 $fe  (s)
;                 $ff  (s)


;-----------------------------------------------------------
;      User Defined Labels
;-----------------------------------------------------------

Start           = $fe98


;***********************************************************
;      Bank 0
;***********************************************************

    SEG     CODE
    ORG     $f000

Lf000
    sta     HMCLR                   ;3        
    lda     ram_84                  ;3        
    bmi     Lf006                   ;2/3 =   8
Lf006
    and     #$0f                    ;2        
    tax                             ;2   =   4
Lf009
    dex                             ;2        
    bpl     Lf009                   ;2/3 =   4
Lf00c
    lda     (ram_F8),y              ;5        
    tax                             ;2        
    lda     (ram_EE),y              ;5        
    sta     GRP0                    ;3        
    lda     (ram_F0),y              ;5        
    sta     GRP1                    ;3        
    lda     (ram_F2),y              ;5        
    sta     GRP0                    ;3        
    lda     (ram_F4),y              ;5        
    sta     GRP1                    ;3        
    lda     (ram_F6),y              ;5        
    sta     GRP0                    ;3        
    txa                             ;2        
    sta     GRP1                    ;3        
    sta     GRP0                    ;3        
    dec     ram_89                  ;5        
    dey                             ;2        
    pha                             ;3        
    pla                             ;4        
    pha                             ;3        
    pla                             ;4        
    lda     (ram_F8),y              ;5        
    tax                             ;2        
    lda     (ram_EE),y              ;5        
    sta     GRP0                    ;3        
    lda     (ram_F0),y              ;5        
    sta     GRP1                    ;3        
    lda     (ram_F2),y              ;5        
    sta     GRP0                    ;3        
    lda     (ram_F4),y              ;5        
    sta     GRP1                    ;3        
    lda     (ram_F6),y              ;5        
    sta     GRP0                    ;3        
    txa                             ;2        
    sta     GRP1                    ;3        
    sta     GRP0                    ;3        
    lda     ram_89                  ;3        
    cmp     #$04                    ;2        
    bcc     Lf055                   ;2/3      
    lda     #$00                    ;2        
    bcs     Lf058                   ;2/3 = 142
Lf055
    nop                             ;2        
    lda     #$02                    ;2   =   4
Lf058
    sta.w   ENABL                   ;4        
    dey                             ;2        
    bpl     Lf00c                   ;2/3      
    iny                             ;2        
    sty     GRP0                    ;3        
    sty     GRP1                    ;3        
    sty     HMCLR                   ;3        
    sty     GRP0                    ;3        
    sty     GRP1                    ;3        
    sta     WSYNC                   ;3   =  28
;---------------------------------------
    dec     ram_89                  ;5        
    lda     ram_89                  ;3        
    cmp     #$04                    ;2        
    bcc     Lf077                   ;2/3      
    lda     #$00                    ;2        
    bcs     Lf07a                   ;2/3 =  16
Lf077
    nop                             ;2        
    lda     #$02                    ;2   =   4
Lf07a
    sta     ENABL                   ;3        
    ldy     ram_80                  ;3        
    lda     CXP0FB                  ;3        
    ora     CXP1FB                  ;3        
    asl                             ;2        
    bmi     Lf08b                   ;2/3      
    nop                             ;2        
    nop                             ;2        
    nop                             ;2        
    nop                             ;2        
    bpl     Lf092                   ;2/3 =  26
Lf08b
    lda     ram_82                  ;3        
    ora     Lfcdc,y                 ;4        
    sta     ram_82                  ;3   =  10
Lf092
    sta     CXCLR                   ;3        
    dey                             ;2        
    dec     ram_8C                  ;5        
    bpl     Lf0a2                   ;2/3      
    lda     #$00                    ;2        
    sta     VDELP0                  ;3        
    sta     VDELP1                  ;3        
    jmp     Lf109                   ;3   =  23
    
Lf0a2
    jsr     Lfde9                   ;6   =   6
Lf0a5
    sty     ram_80                  ;3        
    lda.wy  ram_92,y                ;4        
    sta     ram_F8                  ;3        
    ldx     #$f4                    ;2   =  12
Lf0ae
    lsr     ram_F8                  ;5        
    bcc     Lf0b9                   ;2/3      
    lda     Lfcd6,y                 ;4        
    adc     ram_8B                  ;3        
    bne     Lf0bd                   ;2/3 =  16
Lf0b9
    pha                             ;3         *
    pla                             ;4         *
    lda     #$00                    ;2   =   9 *
Lf0bd
    sta     ram_FA,x                ;4        
    inx                             ;2        
    inx                             ;2        
    bmi     Lf0ae                   ;2/3      
    dec     ram_89                  ;5        
    lda     ram_89                  ;3        
    cmp     #$04                    ;2        
    bcc     Lf0cf                   ;2/3      
    lda     #$00                    ;2        
    bcs     Lf0d2                   ;2/3 =  26
Lf0cf
    nop                             ;2        
    lda     #$02                    ;2   =   4
Lf0d2
    sta     ENABL                   ;3        
    lda     ram_C8                  ;3        
    and     #$38                    ;2        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    cmp     ram_80                  ;3        
    bne     Lf0f5                   ;2/3      
    lda     ram_C8                  ;3         *
    and     #$07                    ;2         *
    asl                             ;2         *
    tax                             ;2         *
    lda     ram_C8                  ;3         *
    rol                             ;2         *
    rol                             ;2         *
    rol                             ;2         *
    and     #$03                    ;2         *
    tay                             ;2         *
    lda     Lfd1e,y                 ;4         *
    sta     ram_EE,x                ;4         *
    jmp     Lf0fa                   ;3   =  52 *
    
Lf0f5
    ldx     #$05                    ;2   =   2
Lf0f7
    dex                             ;2        
    bpl     Lf0f7                   ;2/3 =   4
Lf0fa
    sta     HMCLR                   ;3        
    jsr     Lfdb2                   ;6        
    ldx     #$06                    ;2   =  11
Lf101
    dex                             ;2        
    bpl     Lf101                   ;2/3      
    ldy     #$09                    ;2        
    jmp     Lf000                   ;3   =   9
    
Lf109
    dec     ram_8E                  ;5        
    bmi     Lf113                   ;2/3      
    jsr     Lfdb2                   ;6        
    jmp     Lf109                   ;3   =  16
    
Lf113
    bit     ram_98                  ;3        
    bvs     Lf11a                   ;2/3      
    jmp     Lf1b2                   ;3   =   8 *
    
Lf11a
    lda     ram_DD                  ;3        
    sta     COLUP0                  ;3        
    lda     #$01                    ;2        
    sta     ram_8E                  ;3        
    lda     #$00                    ;2        
    sta     ram_EF                  ;3        
    sta     ram_F1                  ;3        
    sta     ram_F3                  ;3        
    lda     #$ab                    ;2        
    sta     ram_EE                  ;3        
    lda     #$b4                    ;2        
    sta     ram_F0                  ;3        
    lda     #$bd                    ;2        
    sta     ram_F2                  ;3        
    lda     #$11                    ;2        
    sta     WSYNC                   ;3   =  42
;---------------------------------------
    sta     HMCLR                   ;3        
    sta     ram_F4                  ;3        
    lda     ram_85                  ;3        
    sta     HMP0                    ;3        
    and     #$0f                    ;2        
    tay                             ;2   =  16
Lf145
    dey                             ;2        
    bpl     Lf145                   ;2/3      
    sta     RESP0                   ;3        
    dec     ram_89                  ;5        
    lda     ram_89                  ;3        
    cmp     #$04                    ;2        
    lda     #$02                    ;2        
    bcc     Lf155                   ;2/3      
    lsr                             ;2   =  23
Lf155
    sta     ENABL                   ;3        
    sta     WSYNC                   ;3   =   6
;---------------------------------------
    sta     HMOVE                   ;3        
    ldy     #$00                    ;2        
    lda     ram_85                  ;3        
    bpl     Lf163                   ;2/3      
    lda     ram_85                  ;3   =  13
Lf163
    and     #$0f                    ;2        
    tax                             ;2        
    dex                             ;2        
    dex                             ;2   =   8
Lf168
    dex                             ;2        
    bpl     Lf168                   ;2/3 =   4
Lf16b
    lda     (ram_EE),y              ;5        
    sta     GRP0                    ;3        
    nop                             ;2        
    lda     (ram_F0),y              ;5        
    sta     GRP0                    ;3        
    lda     (ram_F2),y              ;5        
    sta     GRP0                    ;3        
    dec     ram_F4                  ;5        
    bmi     Lf18e                   ;2/3      
    lda     ram_F4                  ;3        
    lsr                             ;2        
    bcc     Lf189                   ;2/3      
    iny                             ;2        
    lda     #$20                    ;2   =  44
Lf184
    lsr                             ;2        
    bne     Lf184                   ;2/3      
    beq     Lf16b                   ;2/3 =   6
Lf189
    jsr     Lfde9                   ;6        
    bpl     Lf16b                   ;2/3 =   8
Lf18e
    lda     #$00                    ;2        
    sta     GRP0                    ;3        
    sta     WSYNC                   ;3   =   8
;---------------------------------------
    lda     CXP0FB                  ;3        
    asl                             ;2        
    and     #$80                    ;2        
    ora     ram_82                  ;3        
    sta     ram_82                  ;3        
    sta     CXCLR                   ;3        
    jsr     Lfde9                   ;6        
    sta     HMCLR                   ;3        
    sta     WSYNC                   ;3   =  28
;---------------------------------------
    sta     WSYNC                   ;3   =   3
;---------------------------------------
Lf1a8
    dec     ram_8E                  ;5        
    bmi     Lf1b2                   ;2/3      
    jsr     Lfdb2                   ;6        
    jmp     Lf1a8                   ;3   =  16
    
Lf1b2
    bit     ram_98                  ;3        
    bpl     Lf1b9                   ;2/3      
    jmp     Lf282                   ;3   =   8 *
    
Lf1b9
    jsr     Lfde9                   ;6        
    sta     HMCLR                   ;3        
    sta     WSYNC                   ;3   =  12
;---------------------------------------
    lda     ram_DF                  ;3        
    sta     COLUP0                  ;3        
    lda     ram_86                  ;3        
    sta     HMP0                    ;3        
    and     #$0f                    ;2        
    tay                             ;2   =  16
Lf1cb
    dey                             ;2        
    bpl     Lf1cb                   ;2/3      
    sta     RESP0                   ;3        
    sta     WSYNC                   ;3   =  10
;---------------------------------------
    lda     ram_E0                  ;3        
    sta     COLUP1                  ;3        
    lda     ram_87                  ;3        
    sta     HMP1                    ;3        
    and     #$0f                    ;2        
    tay                             ;2   =  16
Lf1dd
    dey                             ;2        
    bpl     Lf1dd                   ;2/3      
    sta     RESP1                   ;3        
    sta     WSYNC                   ;3   =  10
;---------------------------------------
    sta     HMOVE                   ;3        
    jsr     Lfde9                   ;6        
    lda     #$00                    ;2        
    bit     SWCHB                   ;4        
    bpl     Lf1f2                   ;2/3      
    lda     #$05                    ;2   =  19 *
Lf1f2
    sta     NUSIZ1                  ;3        
    lda     #$00                    ;2        
    bvc     Lf1fa                   ;2/3      
    lda     #$05                    ;2   =   9 *
Lf1fa
    sta     NUSIZ0                  ;3        
    lda     ram_98                  ;3        
    and     #$10                    ;2        
    beq     Lf204                   ;2/3      
    lda     #$0a                    ;2   =  12
Lf204
    sta     ram_F4                  ;3        
    lda     ram_98                  ;3        
    and     #$20                    ;2        
    beq     Lf20e                   ;2/3      
    lda     #$0a                    ;2   =  12 *
Lf20e
    sta     ram_F6                  ;3        
    lda     ram_AA                  ;3        
    lsr                             ;2        
    sta     WSYNC                   ;3   =  11
;---------------------------------------
    bcc     Lf22e                   ;2/3      
    ldx     ram_C9                  ;3        
    lda     Lfd16,x                 ;4        
    sta     ram_F8                  ;3        
    lda     #$ff                    ;2        
    sta     ram_F9                  ;3        
    lda     ram_CA                  ;3        
    and     #$08                    ;2        
    bne     Lf22c                   ;2/3      
    sta     ram_F4                  ;3        
    sta     ram_F6                  ;3   =  30
Lf22c
    bpl     Lf253                   ;2/3 =   2
Lf22e
    lda     #$00                    ;2        
    sta     ram_F8                  ;3        
    lda     ram_CA                  ;3        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    lda     ram_AA                  ;3        
    and     #$04                    ;2        
    beq     Lf245                   ;2/3      
    lda     #$1e                    ;2        
    bcs     Lf243                   ;2/3      
    lda     #$14                    ;2   =  27
Lf243
    sta     ram_F4                  ;3   =   3
Lf245
    lda     ram_AA                  ;3        
    and     #$02                    ;2        
    beq     Lf253                   ;2/3      
    lda     #$14                    ;2         *
    bcs     Lf251                   ;2/3       *
    lda     #$1e                    ;2   =  13 *
Lf251
    sta     ram_F6                  ;3   =   3 *
Lf253
    ldx     #$09                    ;2        
    ldy     #$09                    ;2   =   4
Lf257
    sta     WSYNC                   ;3   =   3
;---------------------------------------
    lda     #$00                    ;2        
    sta     PF0                     ;3        
    lda     (ram_F4),y              ;5        
    sta     GRP0                    ;3        
    lda     (ram_F6),y              ;5        
    sta     GRP1                    ;3        
    txa                             ;2        
    lsr                             ;2        
    tay                             ;2        
    lda     (ram_F8),y              ;5        
    sta     PF0                     ;3        
    txa                             ;2        
    lsr                             ;2        
    bcc     Lf27d                   ;2/3      
    dec     ram_89                  ;5        
    lda     ram_89                  ;3        
    cmp     #$04                    ;2        
    lda     #$02                    ;2        
    bcc     Lf27b                   ;2/3      
    lsr                             ;2   =  57
Lf27b
    sta     ENABL                   ;3   =   3
Lf27d
    dex                             ;2        
    txa                             ;2        
    tay                             ;2        
    bpl     Lf257                   ;2/3 =   8
Lf282
    sta     WSYNC                   ;3   =   3
;---------------------------------------
    lda     #$00                    ;2        
    sta     NUSIZ0                  ;3        
    sta     NUSIZ1                  ;3        
    sta     PF0                     ;3        
    sta     ENABL                   ;3        
    sta     GRP0                    ;3        
    sta     GRP1                    ;3        
    lda     ram_E4                  ;3        
    sta     COLUBK                  ;3        
    lda     ram_81                  ;3        
    sta     RESP0                   ;3        
    ldx     #$04                    ;2   =  34
Lf29c
    dex                             ;2        
    bpl     Lf29c                   ;2/3      
    sta     RESP1                   ;3        
    sta     HMCLR                   ;3        
    lda     #$e0                    ;2        
    sta     HMP1                    ;3        
    sta     WSYNC                   ;3   =  18
;---------------------------------------
    sta     HMOVE                   ;3        
    lda     #$c0                    ;2        
    sta     GRP0                    ;3        
    sta     GRP1                    ;3        
    ldx     #$04                    ;2        
    lda     #$00                    ;2   =  15
Lf2b5
    sta     ram_F3,x                ;4        
    dex                             ;2        
    bne     Lf2b5                   ;2/3      
    jsr     Lfe08                   ;6        
    inx                             ;2        
    jsr     Lfe08                   ;6        
    lda     ram_AA                  ;3        
    and     #$81                    ;2        
    bne     Lf2f6                   ;2/3      
    bit     CXP0FB                  ;3        
    bvc     Lf2d1                   ;2/3      
    lda     #$04                    ;2        
    bit     ram_AA                  ;3        
    beq     Lf2dc                   ;2/3 =  41
Lf2d1
    dex                             ;2        
    bit     CXP1FB                  ;3        
    bvc     Lf2f6                   ;2/3      
    lda     #$02                    ;2         *
    bit     ram_AA                  ;3         *
    bne     Lf2f6                   ;2/3 =  14 *
Lf2dc
    ora     ram_AA                  ;3        
    sta     ram_AA                  ;3        
    sta     ram_C6                  ;3        
    jsr     Lfe75                   ;6        
    lda     #$06                    ;2        
    jsr     Lfe7e                   ;6        
    lda     ram_C7                  ;3        
    bne     Lf2f6                   ;2/3      
    bit     ram_DB                  ;3        
    bvc     Lf2f6                   ;2/3      
    lda     #$02                    ;2         *
    sta     ram_F4,x                ;4   =  39 *
Lf2f6
    sta     WSYNC                   ;3   =   3
;---------------------------------------
Lf2f8
    lda     INTIM                   ;4        
    bne     Lf2f8                   ;2/3      
    sta     GRP0                    ;3        
    sta     GRP1                    ;3        
    lda     #$c8                    ;2        
    sta     TIM8T                   ;4        
    lda     #$00                    ;2        
    sta     ram_F1                  ;3        
    tax                             ;2        
    lda     ram_82                  ;3        
    bpl     Lf36e                   ;2/3      
    lda     ram_CA                  ;3         *
    lsr                             ;2         *
    bcc     Lf316                   ;2/3       *
    ldx     #$04                    ;2   =  39 *
Lf316
    lda     ram_D1,x                ;4         *
    cmp     #$49                    ;2         *
    bcc     Lf320                   ;2/3       *
    cmp     #$58                    ;2         *
    bcc     Lf321                   ;2/3 =  12 *
Lf320
    inx                             ;2   =   2 *
Lf321
    cpx     #$03                    ;2         *
    bcc     Lf331                   ;2/3       *
    lda     #$09                    ;2         *
    sta     ram_EF                  ;3         *
    lda     #$ff                    ;2         *
    sta     ram_F2                  ;3         *
    lda     #$7f                    ;2         *
    bne     Lf33b                   ;2/3 =  18 *
Lf331
    lda     #$ff                    ;2         *
    sta     ram_EF                  ;3         *
    lda     #$01                    ;2         *
    sta     ram_F2                  ;3         *
    lda     #$f6                    ;2   =  12 *
Lf33b
    sta     ram_D1,x                ;4         *
    lda     ram_D3,x                ;4         *
    ldy     #$03                    ;2         *
    clc                             ;2         *
    sbc     ram_9B                  ;3   =  15 *
Lf344
    dey                             ;2         *
    clc                             ;2         *
    adc     #$e0                    ;2         *
    bpl     Lf344                   ;2/3       *
    adc     #$20                    ;2         *
    tax                             ;2         *
    lda     Lfd13,y                 ;4         *
    sta     ram_F0                  ;3         *
    ldy     ram_EF                  ;3   =  22 *
Lf354
    tya                             ;2         *
    clc                             ;2         *
    adc     ram_F2                  ;3         *
    tay                             ;2         *
    lda     Lff4c,x                 ;4         *
    eor     #$ff                    ;2         *
    and     (ram_F0),y              ;5         *
    beq     Lf354                   ;2/3       *
    jsr     Lfd8f                   ;6         *
    dey                             ;2         *
    jsr     Lfd8b                   ;6         *
    iny                             ;2         *
    iny                             ;2         *
    jsr     Lfd8b                   ;6   =  46 *
Lf36e
    lda     ram_CA                  ;3        
    lsr                             ;2        
    bcs     Lf376                   ;2/3      
    jmp     Lf429                   ;3   =  10
    
Lf376
    bit     ram_82                  ;3        
    bvc     Lf3a0                   ;2/3      
    lda     ram_C8                  ;3         *
    and     #$39                    ;2         *
    cmp     #$39                    ;2         *
    beq     Lf3a0                   ;2/3       *
    lda     #$39                    ;2         *
    sta     ram_C8                  ;3         *
    ldx     #$01                    ;2         *
    lda     ram_98                  ;3         *
    and     #$04                    ;2         *
    bne     Lf38f                   ;2/3       *
    dex                             ;2   =  30 *
Lf38f
    lda     #$04                    ;2         *
    sta     ram_C6                  ;3         *
    lsr                             ;2         *
    bit     ram_DB                  ;3         *
    bvc     Lf399                   ;2/3       *
    lsr                             ;2   =  14 *
Lf399
    sta     ram_F4,x                ;4         *
    lda     #$05                    ;2         *
    jsr     Lfe8b                   ;6   =  12 *
Lf3a0
    lda     #$06                    ;2        
    sta     ram_F0                  ;3   =   5
Lf3a4
    dec     ram_F0                  ;5        
    bpl     Lf3ab                   ;2/3      
    jmp     Lf4cf                   ;3   =  10
    
Lf3ab
    ldx     ram_F0                  ;3        
    lda     ram_82                  ;3        
    and     Lfcdc,x                 ;4        
    beq     Lf3a4                   ;2/3      
    ldy     #$01                    ;2         *
    lda     #$35                    ;2         *
    sec                             ;2         *
    sbc     Lfd31,x                 ;4         *
    clc                             ;2         *
    adc     ram_90                  ;3         *
    cmp     #$52                    ;2         *
    bcs     Lf426                   ;2/3!      *
    cmp     ram_D5                  ;3         *
    bcs     Lf3ce                   ;2/3       *
    adc     #$0d                    ;2         *
    cmp     ram_D5                  ;3         *
    bcc     Lf3ce                   ;2/3       *
    dey                             ;2   =  45 *
Lf3ce
    sty     ram_EE                  ;3         *
    ldx     ram_EE                  ;3         *
    ldy     #$ff                    ;2         *
    lda     ram_9A                  ;3         *
    clc                             ;2         *
    adc     #$fd                    ;2   =  15 *
Lf3d9
    iny                             ;2         *
    adc     #$10                    ;2         *
    cmp     ram_D7,x                ;4         *
    bcc     Lf3d9                   ;2/3       *
    sty     ram_EF                  ;3         *
    ldx     ram_F0                  ;3         *
    lda     Lfcdc,y                 ;4         *
    and     ram_92,x                ;4         *
    beq     Lf426                   ;2/3!      *
    eor     ram_92,x                ;4         *
    sta     ram_92,x                ;4         *
    ldy     ram_EE                  ;3         *
    lda     Lfcde,y                 ;4         *
    ldy     #$01                    ;2         *
    and     ram_98                  ;3         *
    bne     Lf3fb                   ;2/3       *
    dey                             ;2   =  50 *
Lf3fb
    lda     Lfd2b,x                 ;4         *
    sta.wy  ram_F6,y                ;5         *
    lda     #$02                    ;2         *
    jsr     Lfe7e                   ;6         *
    dec     ram_91                  ;5         *
    bne     Lf414                   ;2/3       *
    lda     ram_AA                  ;3         *
    ora     #$08                    ;2         *
    sta     ram_AA                  ;3         *
    lda     #$61                    ;2         *
    sta     ram_CA                  ;3   =  37 *
Lf414
    jsr     Lfbed                   ;6         *
    txa                             ;2         *
    asl                             ;2         *
    asl                             ;2         *
    asl                             ;2         *
    ora     ram_EF                  ;3         *
    sta     ram_C8                  ;3         *
    lda     #$f6                    ;2         *
    ldy     ram_EE                  ;3         *
    sta.wy  ram_D5,y                ;5   =  30 *
Lf426
    jmp     Lf3a4                   ;3   =   3 *
    
Lf429
    lsr                             ;2        
    bcs     Lf459                   ;2/3      
    lda     ram_C8                  ;3        
    and     #$39                    ;2        
    cmp     #$39                    ;2        
    beq     Lf459                   ;2/3      
    lda     ram_9E                  ;3        
    cmp     #$b4                    ;2        
    beq     Lf459                   ;2/3      
    lda     ram_98                  ;3         *
    lsr                             ;2         *
    bcs     Lf445                   ;2/3       *
    dec     ram_9E                  ;5         *
    bne     Lf459                   ;2/3       *
    beq     Lf44d                   ;2/3 =  36 *
Lf445
    inc     ram_9E                  ;5         *
    lda     ram_9E                  ;3         *
    cmp     #$98                    ;2         *
    bcc     Lf459                   ;2/3 =  12 *
Lf44d
    lda     #$b4                    ;2         *
    sta     ram_9E                  ;3         *
    lda     #$00                    ;2         *
    sta     ram_CC                  ;3         *
    lda     #$04                    ;2         *
    sta     ram_C6                  ;3   =  15 *
Lf459
    lda     SWCHA                   ;4        
    tay                             ;2        
    asl                             ;2        
    asl                             ;2        
    asl                             ;2        
    asl                             ;2        
    sta     ram_EE                  ;3        
    and     #$80                    ;2        
    sta     ram_81                  ;3        
    lda     ram_DB                  ;3        
    cmp     #$90                    ;2        
    bne     Lf475                   ;2/3      
    bit     ram_AA                  ;3         *
    bvc     Lf47f                   ;2/3       *
    ldy     ram_EE                  ;3         *
    bvs     Lf47f                   ;2/3 =  39 *
Lf475
    and     #$02                    ;2        
    beq     Lf47f                   ;2/3      
    tya                             ;2         *
    and     #$40                    ;2         *
    ora     ram_81                  ;3         *
    tay                             ;2   =  13 *
Lf47f
    ldx     #$01                    ;2   =   2
Lf481
    lda     ram_AA                  ;3        
    and     Lfd60,x                 ;4        
    bne     Lf4a0                   ;2/3      
    bit     ram_EE                  ;3        
    bmi     Lf48e                   ;2/3      
    inc     ram_9C,x                ;6   =  20
Lf48e
    bvs     Lf492                   ;2/3      
    dec     ram_9C,x                ;6   =   8
Lf492
    lda     ram_9C,x                ;4        
    cmp     #$76                    ;2        
    bcc     Lf49a                   ;2/3      
    dec     ram_9C,x                ;6   =  14 *
Lf49a
    cmp     #$23                    ;2        
    bcs     Lf4a0                   ;2/3      
    inc     ram_9C,x                ;6   =  10
Lf4a0
    sty     ram_EE                  ;3        
    dex                             ;2        
    bpl     Lf481                   ;2/3      
    lda     ram_CA                  ;3        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    bcs     Lf4cf                   ;2/3      
    lda     ram_DC                  ;3        
    lsr                             ;2        
    bcc     Lf4cf                   ;2/3      
    lda     ram_AA                  ;3         *
    and     #$10                    ;2         *
    beq     Lf4c1                   ;2/3       *
    inc     ram_9B                  ;5         *
    lda     ram_9B                  ;3         *
    cmp     #$35                    ;2         *
    bcc     Lf4cf                   ;2/3       *
    bcs     Lf4c9                   ;2/3 =  46 *
Lf4c1
    dec     ram_9B                  ;5         *
    lda     ram_9B                  ;3         *
    cmp     #$21                    ;2         *
    bcs     Lf4cf                   ;2/3 =  12 *
Lf4c9
    lda     ram_AA                  ;3         *
    eor     #$10                    ;2         *
    sta     ram_AA                  ;3   =   8 *
Lf4cf
    lda     INTIM                   ;4        
    bne     Lf4cf                   ;2/3 =   6
Lf4d4
    lda     #$02                    ;2        
    sta     VBLANK                  ;3        
    sta     WSYNC                   ;3   =   8
;---------------------------------------
    bit     ram_AA                  ;3        
    bmi     Lf4f1                   ;2/3      
    sed                             ;2        
    ldx     #$01                    ;2   =   9
Lf4e1
    lda     ram_E8,x                ;4        
    clc                             ;2        
    adc     ram_F6,x                ;4        
    sta     ram_E8,x                ;4        
    lda     ram_E6,x                ;4        
    adc     ram_F4,x                ;4        
    sta     ram_E6,x                ;4        
    dex                             ;2        
    bpl     Lf4e1                   ;2/3 =  30
Lf4f1
    cld                             ;2        
    sta     WSYNC                   ;3   =   5
;---------------------------------------
    lda     ram_CA                  ;3        
    and     #$07                    ;2        
    bne     Lf50c                   ;2/3!     
    lda     ram_C8                  ;3        
    clc                             ;2        
    adc     #$40                    ;2        
    sta     ram_C8                  ;3        
    cmp     #$40                    ;2        
    bcs     Lf50c                   ;2/3      
    jsr     Lfbf1                   ;6        
    lda     #$30                    ;2        
    sta     ram_C8                  ;3   =  32
Lf50c
    lda     #$02                    ;2        
    sta     WSYNC                   ;3   =   5
;---------------------------------------
    sta     VSYNC                   ;3        
    sta     WSYNC                   ;3   =   6
;---------------------------------------
    sta     WSYNC                   ;3   =   3
;---------------------------------------
    lda     #$30                    ;2        
    sta     TIM64T                  ;4        
    lda     #$00                    ;2        
    sta     WSYNC                   ;3   =  11
;---------------------------------------
    sta     VSYNC                   ;3        
    lda     ram_CA                  ;3        
    lsr                             ;2        
    bcc     Lf549                   ;2/3      
    ldx     #$01                    ;2   =  12
Lf528
    lda     ram_D5,x                ;4        
    cmp     #$79                    ;2        
    bne     Lf532                   ;2/3      
    lda     #$f6                    ;2         *
    sta     ram_D5,x                ;4   =  14 *
Lf532
    lda     ram_D5,x                ;4        
    cmp     #$ec                    ;2        
    bcs     Lf544                   ;2/3      
    lda     ram_D5,x                ;4        
    adc     #$fe                    ;2        
    cmp     #$03                    ;2        
    bcs     Lf542                   ;2/3      
    lda     #$f6                    ;2   =  20
Lf542
    sta     ram_D5,x                ;4   =   4
Lf544
    dex                             ;2        
    bpl     Lf528                   ;2/3      
    bmi     Lf5a2                   ;2/3 =   6
Lf549
    lda     ram_CA                  ;3        
    and     #$0f                    ;2        
    cmp     #$0f                    ;2        
    beq     Lf556                   ;2/3      
    jsr     Lfdfb                   ;6        
    sta     ram_DA                  ;3   =  18
Lf556
    lda     ram_DC                  ;3        
    and     #$04                    ;2        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    lda     #$01                    ;2        
    tax                             ;2        
    bcc     Lf563                   ;2/3      
    asl                             ;2   =  19 *
Lf563
    sta     ram_81                  ;3   =   3
Lf565
    lda     ram_D1,x                ;4        
    cmp     #$ec                    ;2        
    bcs     Lf59f                   ;2/3      
    lda     ram_DC                  ;3        
    and     #$02                    ;2        
    beq     Lf590                   ;2/3      
    lda     ram_DA                  ;3         *
    cpx     #$00                    ;2         *
    beq     Lf579                   ;2/3       *
    asl                             ;2         *
    asl                             ;2   =  26 *
Lf579
    asl                             ;2         *
    bcc     Lf590                   ;2/3       *
    bpl     Lf588                   ;2/3       *
    lda     ram_D3,x                ;4         *
    cmp     #$81                    ;2         *
    bcs     Lf590                   ;2/3       *
    inc     ram_D3,x                ;6         *
    bne     Lf590                   ;2/3 =  22 *
Lf588
    lda     ram_D3,x                ;4         *
    cmp     #$17                    ;2         *
    bcc     Lf590                   ;2/3       *
    dec     ram_D3,x                ;6   =  14 *
Lf590
    lda     ram_D1,x                ;4        
    clc                             ;2        
    adc     ram_81                  ;3        
    sta     ram_D1,x                ;4        
    cmp     #$6c                    ;2        
    bcc     Lf59f                   ;2/3      
    lda     #$f6                    ;2        
    sta     ram_D1,x                ;4   =  23
Lf59f
    dex                             ;2        
    bpl     Lf565                   ;2/3 =   4
Lf5a2
    dec     ram_CA                  ;5        
    beq     Lf5a9                   ;2/3      
    jmp     Lf68c                   ;3   =  10
    
Lf5a9
    lda     ram_C7                  ;3        
    beq     Lf5b1                   ;2/3      
    inc     ram_C7                  ;5         *
    inc     ram_C7                  ;5   =  15 *
Lf5b1
    bit     ram_E5                  ;3        
    bmi     Lf622                   ;2/3!     
    lda     ram_AA                  ;3        
    and     #$08                    ;2        
    beq     Lf5e5                   ;2/3      
    eor     ram_AA                  ;3         *
    sta     ram_AA                  ;3         *
    ldx     ram_99                  ;3         *
    lda     Lfd0f,x                 ;4         *
    sta     ram_90                  ;3         *
    cpx     #$03                    ;2         *
    bcs     Lf5cc                   ;2/3       *
    inc     ram_99                  ;5   =  37 *
Lf5cc
    bit     ram_98                  ;3         *
    bmi     Lf5df                   ;2/3       *
    jsr     Lfefa                   ;6         *
    lda     ram_AA                  ;3         *
    and     #$06                    ;2         *
    bne     Lf5e5                   ;2/3       *
    lda     ram_AA                  ;3         *
    ora     #$01                    ;2         *
    sta     ram_AA                  ;3   =  26 *
Lf5df
    lda     #$40                    ;2         *
    sta     ram_CA                  ;3         *
    bne     Lf61f                   ;2/3!=   7 *
Lf5e5
    bit     ram_98                  ;3        
    bpl     Lf5f7                   ;2/3      
    bit     ram_A7                  ;3         *
    bmi     Lf60f                   ;2/3!      *
    lda     ram_DB                  ;3         *
    cmp     #$10                    ;2         *
    bne     Lf60f                   ;2/3!      *
    lda     #$00                    ;2         *
    beq     Lf628                   ;2/3!=  21 *
Lf5f7
    lda     ram_AA                  ;3        
    and     #$01                    ;2        
    beq     Lf622                   ;2/3!     
    eor     ram_AA                  ;3        
    sta     ram_AA                  ;3        
    lda     #$50                    ;2        
    sta     ram_D9                  ;3        
    lda     #$05                    ;2        
    sta     ram_C6                  ;3        
    lda     ram_C9                  ;3        
    bne     Lf65c                   ;2/3      
    inc     ram_C9                  ;5   =  33 *
Lf60f
    lda     ram_E5                  ;3         *
    ora     #$80                    ;2         *
    sta     ram_E5                  ;3         *
    lda     ram_C7                  ;3         *
    bne     Lf622                   ;2/3       *
    lda     #$bf                    ;2         *
    sta     ram_C7                  ;3         *
    bpl     Lf622                   ;2/3 =  20 *
Lf61f
    jmp     Lf689                   ;3   =   3 *
    
Lf622
    lda     ram_AA                  ;3        
    and     #$06                    ;2        
    beq     Lf668                   ;2/3 =   7
Lf628
    ora     #$01                    ;2         *
    eor     ram_AA                  ;3         *
    sta     ram_AA                  ;3         *
    lda     #$23                    ;2         *
    sta     ram_9C                  ;3         *
    lda     #$75                    ;2         *
    sta     ram_9D                  ;3         *
    lda     ram_DB                  ;3         *
    cmp     #$10                    ;2         *
    bne     Lf65a                   ;2/3       *
    bit     ram_A7                  ;3         *
    bmi     Lf65a                   ;2/3       *
    ldx     #$0a                    ;2   =  32 *
Lf642
    ldy     ram_90,x                ;4         *
    lda     ram_9F,x                ;4         *
    sta     ram_90,x                ;4         *
    sty     ram_9F,x                ;4         *
    dex                             ;2         *
    bpl     Lf642                   ;2/3       *
    jsr     Lff3a                   ;6         *
    lda     ram_AA                  ;3         *
    eor     #$40                    ;2         *
    sta     ram_AA                  ;3         *
    and     #$40                    ;2         *
    bne     Lf65c                   ;2/3 =  38 *
Lf65a
    dec     ram_C9                  ;5   =   5 *
Lf65c
    lda     #$40                    ;2        
    sta     ram_CA                  ;3        
    lda     #$b4                    ;2        
    sta     ram_9E                  ;3        
    lda     #$00                    ;2        
    sta     ram_CC                  ;3   =  15
Lf668
    dec     ram_C6                  ;5        
    bne     Lf689                   ;2/3      
    lda     ram_91                  ;3         *
    cmp     #$07                    ;2         *
    bcc     Lf689                   ;2/3       *
    jsr     Lfdfb                   ;6         *
    and     #$01                    ;2         *
    eor     ram_98                  ;3         *
    sta     ram_98                  ;3         *
    lsr                             ;2         *
    lda     #$98                    ;2         *
    bcc     Lf682                   ;2/3       *
    lda     #$00                    ;2   =  36 *
Lf682
    sta     ram_9E                  ;3         *
    lda     #$04                    ;2         *
    jsr     Lfe8b                   ;6   =  11 *
Lf689
    jmp     Lf875                   ;3   =   3
    
Lf68c
    lda     ram_CA                  ;3        
    lsr                             ;2        
    bcs     Lf694                   ;2/3      
    jmp     Lf7db                   ;3   =  10
    
Lf694
    lda     SWCHB                   ;4        
    and     #$03                    ;2        
    cmp     #$02                    ;2        
    bne     Lf6a3                   ;2/3      
    jsr     Lfeb2                   ;6        
    jmp     Lf744                   ;3   =  19
    
Lf6a3
    lda     SWCHB                   ;4        
    and     #$02                    ;2        
    beq     Lf6b3                   ;2/3      
    lda     ram_AA                  ;3        
    sta     ram_ED                  ;3        
    bmi     Lf6ee                   ;2/3      
    jmp     Lf747                   ;3   =  19
    
Lf6b3
    lda     #$b1                    ;2         *
    sta     ram_C7                  ;3         *
    bit     ram_AA                  ;3         *
    bmi     Lf6c9                   ;2/3       *
    lda     ram_AA                  ;3         *
    and     #$b0                    ;2         *
    ora     #$80                    ;2         *
    sta     ram_ED                  ;3         *
    jsr     Lfec0                   ;6         *
    jmp     Lf744                   ;3   =  29 *
    
Lf6c9
    inc     ram_ED                  ;5         *
    lda     ram_ED                  ;3         *
    cmp     #$0f                    ;2         *
    bcc     Lf6ee                   ;2/3       *
    lda     SWCHB                   ;4         *
    lsr                             ;2         *
    lda     #$0d                    ;2         *
    bcc     Lf6db                   ;2/3       *
    lda     #$02                    ;2   =  24 *
Lf6db
    sta     ram_ED                  ;3         *
    lda     ram_98                  ;3         *
    and     #$f3                    ;2         *
    sta     ram_98                  ;3         *
    lda     ram_DC                  ;3         *
    clc                             ;2         *
    adc     #$91                    ;2         *
    beq     Lf6ec                   ;2/3       *
    adc     #$70                    ;2   =  22 *
Lf6ec
    sta     ram_DC                  ;3   =   3 *
Lf6ee
    lda     ram_AA                  ;3        
    ora     #$80                    ;2        
    sta     ram_AA                  ;3        
    lda     ram_DC                  ;3        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    sta     ram_EC                  ;3        
    tay                             ;2        
    lda     Lfd4b,y                 ;4        
    sta     ram_DB                  ;3        
    lda     ram_98                  ;3        
    and     #$cf                    ;2        
    ora     Lfd52,y                 ;4        
    sta     ram_98                  ;3        
    lda     #$aa                    ;2        
    sta     ram_E7                  ;3        
    lda     #$a2                    ;2        
    sta     ram_E9                  ;3        
    ldy     #$00                    ;2        
    tya                             ;2        
    sec                             ;2        
    adc     ram_DC                  ;3   =  62
Lf719
    cmp     #$0a                    ;2        
    bcc     Lf723                   ;2/3      
    iny                             ;2         *
    sbc     #$0a                    ;2         *
    jmp     Lf719                   ;3   =  11 *
    
Lf723
    adc     Lfd39,y                 ;4        
    sta     ram_E8                  ;3        
    lda     ram_DC                  ;3        
    cmp     #$63                    ;2        
    lda     #$aa                    ;2        
    bcc     Lf732                   ;2/3      
    lda     #$a1                    ;2   =  18 *
Lf732
    sta     ram_E6                  ;3        
    lda     ram_DC                  ;3        
    cmp     #$10                    ;2        
    bcs     Lf73c                   ;2/3      
    dec     ram_E9                  ;5   =  15
Lf73c
    cmp     #$09                    ;2        
    bcs     Lf744                   ;2/3      
    adc     #$a1                    ;2        
    sta     ram_E8                  ;3   =   9
Lf744
    jmp     Lf875                   ;3   =   3
    
Lf747
    lda     ram_CA                  ;3        
    lsr                             ;2        
    bcs     Lf74f                   ;2/3 =   7
Lf74c
    jmp     Lf7db                   ;3   =   3 *
    
Lf74f
    lda     ram_C7                  ;3        
    bne     Lf74c                   ;2/3      
    bit     ram_98                  ;3        
    bmi     Lf769                   ;2/3      
    lda     ram_AA                  ;3        
    and     #$07                    ;2        
    bne     Lf769                   ;2/3      
    lda     ram_DB                  ;3        
    and     #$10                    ;2        
    beq     Lf7bb                   ;2/3      
    lda     ram_D5                  ;3        
    cmp     #$ec                    ;2        
    bcs     Lf76c                   ;2/3 =  31
Lf769
    jmp     Lf7d8                   ;3   =   3
    
Lf76c
    lda     ram_DB                  ;3        
    cmp     #$14                    ;2        
    beq     Lf77a                   ;2/3      
    cmp     #$90                    ;2        
    bne     Lf77f                   ;2/3      
    bit     ram_AA                  ;3         *
    bvc     Lf79b                   ;2/3 =  16 *
Lf77a
    bit     INPT5                   ;3         *
    jmp     Lf79d                   ;3   =   6 *
    
Lf77f
    lda     ram_DB                  ;3        
    bpl     Lf78d                   ;2/3      
    dec     ram_D9                  ;5         *
    bne     Lf78d                   ;2/3       *
    bit     ram_AA                  ;3         *
    bvc     Lf79f                   ;2/3       *
    bvs     Lf7ab                   ;2/3 =  19 *
Lf78d
    bit     ram_AA                  ;3        
    bvs     Lf7a7                   ;2/3      
    lda     ram_DB                  ;3        
    and     #$20                    ;2        
    beq     Lf79b                   ;2/3      
    bit     INPT5                   ;3         *
    bpl     Lf79f                   ;2/3 =  17 *
Lf79b
    bit     INPT4                   ;3   =   3
Lf79d
    bmi     Lf7d8                   ;2/3 =   2
Lf79f
    lda     ram_98                  ;3        
    and     #$fb                    ;2        
    ldx     #$00                    ;2        
    bpl     Lf7b1                   ;2/3 =   9
Lf7a7
    bit     INPT5                   ;3         *
    bmi     Lf7d8                   ;2/3 =   5 *
Lf7ab
    ldx     #$01                    ;2         *
    lda     ram_98                  ;3         *
    ora     #$04                    ;2   =   7 *
Lf7b1
    sta     ram_98                  ;3        
    ldy     #$00                    ;2        
    jsr     Lfbaf                   ;6        
    jmp     Lf7d8                   ;3   =  14
    
Lf7bb
    ldy     #$01                    ;2   =   2 *
Lf7bd
    ldx     #$01                    ;2         *
    lda     ram_98                  ;3         *
    and     Lfcde,y                 ;4         *
    bne     Lf7c7                   ;2/3       *
    dex                             ;2   =  13 *
Lf7c7
    lda.wy  ram_D5,y                ;4         *
    cmp     #$ec                    ;2         *
    bcc     Lf7d5                   ;2/3       *
    lda     INPT4,x                 ;4         *
    bmi     Lf7d5                   ;2/3       *
    jsr     Lfbaf                   ;6   =  20 *
Lf7d5
    dey                             ;2         *
    bpl     Lf7bd                   ;2/3 =   4 *
Lf7d8
    jmp     Lf875                   ;3   =   3
    
Lf7db
    lda     ram_AA                  ;3        
    and     #$07                    ;2        
    bne     Lf7d8                   ;2/3      
    tay                             ;2        
    lda     ram_91                  ;3        
    beq     Lf7d8                   ;2/3      
    lda     #$eb                    ;2        
    sta     ram_EE                  ;3        
    cmp     ram_D2                  ;3        
    bcs     Lf7d8                   ;2/3      
    jsr     Lfdfb                   ;6        
    bpl     Lf80d                   ;2/3!     
    and     #$03                    ;2        
    asl                             ;2        
    sta     ram_EE                  ;3        
    lda     ram_EA                  ;3        
    lsr                             ;2        
    lsr                             ;2        
    tax                             ;2   =  48
Lf7fd
    txa                             ;2        
    sec                             ;2        
    adc     ram_EE                  ;3        
    and     #$07                    ;2        
    tax                             ;2        
    lda     Lfcdc,x                 ;4        
    and     ram_EB                  ;3        
    beq     Lf7fd                   ;2/3!     
    bne     Lf83c                   ;2/3 =  22
Lf80d
    lda     ram_98                  ;3        
    and     #$04                    ;2        
    beq     Lf814                   ;2/3      
    iny                             ;2   =   9 *
Lf814
    ldx     #$05                    ;2   =   2
Lf816
    lda     Lfcdc,x                 ;4        
    and     ram_EB                  ;3        
    beq     Lf82d                   ;2/3      
    lda     ram_9A                  ;3        
    clc                             ;2        
    adc     #$fd                    ;2        
    clc                             ;2        
    adc     Lfd39,x                 ;4        
    cmp.wy  ram_9C,y                ;4        
    bcc     Lf831                   ;2/3      
    stx     ram_EE                  ;3   =  31
Lf82d
    dex                             ;2        
    bpl     Lf816                   ;2/3      
    inx                             ;2   =   6 *
Lf831
    lda     ram_EA                  ;3        
    and     #$10                    ;2        
    bne     Lf83c                   ;2/3      
    lda     ram_EE                  ;3        
    bmi     Lf83c                   ;2/3      
    tax                             ;2   =  14
Lf83c
    stx     ram_EF                  ;3        
    lda     Lfcdc,x                 ;4        
    sta     ram_F0                  ;3        
    ldx     #$ff                    ;2   =  12
Lf845
    inx                             ;2        
    cpx     #$06                    ;2        
    bcs     Lf875                   ;2/3      
    lda     ram_92,x                ;4        
    and     ram_F0                  ;3        
    beq     Lf845                   ;2/3      
    lda     #$3c                    ;2        
    adc     ram_90                  ;3        
    sbc     Lfd31,x                 ;4        
    sta     ram_D2                  ;3        
    sec                             ;2        
    sbc     ram_D1                  ;3        
    cmp     #$10                    ;2        
    bcc     Lf871                   ;2/3      
    cmp     #$f1                    ;2        
    bcs     Lf871                   ;2/3      
    ldy     ram_EF                  ;3        
    lda     ram_9A                  ;3        
    adc     Lfd39,y                 ;4        
    adc     #$04                    ;2        
    sta     ram_D4                  ;3        
    bne     Lf875                   ;2/3 =  57
Lf871
    lda     #$f6                    ;2        
    sta     ram_D2                  ;3   =   5
Lf875
    lda     ram_AA                  ;3        
    and     #$07                    ;2        
    bne     Lf8f5                   ;2/3      
    bit     ram_98                  ;3        
    bmi     Lf8f5                   ;2/3      
    ldy     #$ff                    ;2        
    lda     ram_91                  ;3        
    beq     Lf8f5                   ;2/3 =  19
Lf885
    iny                             ;2        
    cmp     Lfce4,y                 ;4        
    bcc     Lf885                   ;2/3      
    lda     Lfcf6,y                 ;4        
    sta     ram_EE                  ;3        
    lda     Lfced,y                 ;4        
    sta     ram_EF                  ;3        
    lda     ram_CA                  ;3        
    and     #$3f                    ;2        
    sta     ram_F0                  ;3        
    clc                             ;2        
    adc     ram_EF                  ;3        
    cmp     #$41                    ;2        
    bcs     Lf8f5                   ;2/3      
    lda     ram_F0                  ;3   =  42
Lf8a4
    beq     Lf8af                   ;2/3      
    cmp     ram_EF                  ;3        
    bcc     Lf8f5                   ;2/3      
    sbc     ram_EF                  ;3        
    jmp     Lf8a4                   ;3   =  13
    
Lf8af
    bit     ram_8B                  ;3        
    lda     #$09                    ;2        
    bvs     Lf8b7                   ;2/3      
    lda     #$ff                    ;2   =   9
Lf8b7
    sta     ram_8B                  ;3        
    lda     #$01                    ;2        
    jsr     Lfe7e                   ;6        
    lda     ram_98                  ;3        
    and     #$02                    ;2        
    beq     Lf8d3                   ;2/3      
    lda     ram_9A                  ;3        
    clc                             ;2        
    adc     ram_EE                  ;3        
    sta     ram_9A                  ;3        
    cmp     ram_8D                  ;3        
    bcc     Lf8f5                   ;2/3      
    lda     ram_8D                  ;3         *
    bne     Lf8e0                   ;2/3 =  39 *
Lf8d3
    lda     ram_9A                  ;3         *
    sec                             ;2         *
    sbc     ram_EE                  ;3         *
    sta     ram_9A                  ;3         *
    cmp     #$17                    ;2         *
    bcs     Lf8f5                   ;2/3       *
    lda     #$17                    ;2   =  17 *
Lf8e0
    sta     ram_9A                  ;3         *
    lda     ram_98                  ;3         *
    eor     #$02                    ;2         *
    sta     ram_98                  ;3         *
    bmi     Lf8f5                   ;2/3       *
    bit     ram_AA                  ;3         *
    bmi     Lf8f5                   ;2/3       *
    lda     ram_90                  ;3         *
    clc                             ;2         *
    adc     #$05                    ;2         *
    sta     ram_90                  ;3   =  28 *
Lf8f5
    lda     #$05                    ;2        
    sta     ram_8C                  ;3        
    lda     #$0b                    ;2        
    sec                             ;2        
    sbc     ram_90                  ;3        
    sta     ram_8E                  ;3        
    bit     ram_98                  ;3        
    bvs     Lf90b                   ;2/3      
    lda     ram_8E                  ;3         *
    clc                             ;2         *
    adc     #$0c                    ;2         *
    sta     ram_8E                  ;3   =  30 *
Lf90b
    ldx     #$fb                    ;2   =   2
Lf90d
    lda     ram_97,x                ;4        
    bne     Lf91d                   ;2/3      
    dec     ram_8C                  ;5         *
    lda     ram_8E                  ;3         *
    clc                             ;2         *
    adc     #$09                    ;2         *
    sta     ram_8E                  ;3         *
    inx                             ;2         *
    bne     Lf90d                   ;2/3 =  25 *
Lf91d
    lda     ram_8E                  ;3        
    bpl     Lf952                   ;2/3      
    lda     ram_98                  ;3         *
    and     #$40                    ;2         *
    beq     Lf934                   ;2/3       *
    eor     ram_98                  ;3         *
    sta     ram_98                  ;3         *
    lda     ram_8E                  ;3         *
    clc                             ;2         *
    adc     #$0c                    ;2         *
    sta     ram_8E                  ;3         *
    bpl     Lf952                   ;2/3 =  30 *
Lf934
    lda     #$00                    ;2         *
    sta     ram_8E                  ;3         *
    lda     ram_98                  ;3         *
    bmi     Lf952                   ;2/3       *
    ora     #$80                    ;2         *
    sta     ram_98                  ;3         *
    ldy     ram_8C                  ;3         *
    lda     ram_90                  ;3         *
    clc                             ;2         *
    adc     Lfff2,y                 ;4         *
    sta     ram_90                  ;3         *
    jsr     Lfe75                   ;6         *
    lda     #$06                    ;2         *
    jsr     Lfe7e                   ;6   =  44 *
Lf952
    ldx     #$05                    ;2        
    lda     #$00                    ;2   =   4
Lf956
    ora     ram_92,x                ;4        
    dex                             ;2        
    bpl     Lf956                   ;2/3      
    sta     ram_EB                  ;3   =  11
Lf95d
    lda     ram_EB                  ;3        
    beq     Lf98e                   ;2/3      
    lsr                             ;2        
    bcs     Lf97c                   ;2/3      
    jsr     Lfbed                   ;6         *
    lda     #$3a                    ;2         *
    sta     ram_C8                  ;3         *
    ldx     #$05                    ;2   =  22 *
Lf96d
    lsr     ram_92,x                ;6         *
    dex                             ;2         *
    bpl     Lf96d                   ;2/3       *
    lda     ram_9A                  ;3         *
    adc     #$10                    ;2         *
    sta     ram_9A                  ;3         *
    lsr     ram_EB                  ;5         *
    bne     Lf95d                   ;2/3 =  25 *
Lf97c
    ldx     #$06                    ;2   =   2
Lf97e
    dex                             ;2        
    lda     Lfcdc,x                 ;4        
    and     ram_EB                  ;3        
    beq     Lf97e                   ;2/3      
    lda     #$82                    ;2        
    sec                             ;2        
    sbc     Lfd39,x                 ;4        
    sta     ram_8D                  ;3   =  22
Lf98e
    lda     ram_90                  ;3        
    sta     ram_8F                  ;3        
    ldx     #$04                    ;2   =   8
Lf994
    lda     ram_99,x                ;4        
    jsr     Lfd67                   ;6        
    dex                             ;2        
    bne     Lf994                   ;2/3      
    lda     SWCHB                   ;4        
    and     #$08                    ;2        
    tay                             ;2        
    beq     Lf9a6                   ;2/3      
    lda     #$f7                    ;2   =  26
Lf9a6
    ora     #$07                    ;2        
    sta     ram_EE                  ;3        
    ldx     #$f8                    ;2   =   7
Lf9ac
    lda     Lfcff,y                 ;4        
    eor     ram_C7                  ;3        
    and     ram_EE                  ;3        
    sta     ram_E5,x                ;4        
    iny                             ;2        
    inx                             ;2        
    bmi     Lf9ac                   ;2/3      
    bit     ram_AA                  ;3        
    bmi     Lf9c1                   ;2/3      
    lda     ram_C7                  ;3        
    bne     Lf9d3                   ;2/3 =  30
Lf9c1
    lda     ram_C8                  ;3        
    and     #$38                    ;2        
    cmp     #$30                    ;2        
    bne     Lf9d3                   ;2/3      
    lda     ram_DC                  ;3        
    and     #$08                    ;2        
    beq     Lf9d3                   ;2/3      
    lda     ram_E3                  ;3         *
    sta     ram_E1                  ;3   =  22 *
Lf9d3
    lda     ram_DE                  ;3        
    sta     COLUP0                  ;3        
    lda     ram_E3                  ;3        
    sta     COLUBK                  ;3        
    lda     ram_E2                  ;3        
    sta     COLUPF                  ;3        
    lda     ram_CA                  ;3        
    lsr                             ;2        
    ldx     #$04                    ;2        
    bcs     Lf9e8                   ;2/3      
    ldx     #$00                    ;2   =  29
Lf9e8
    stx     ram_EF                  ;3        
    lda     ram_D1,x                ;4        
    cmp     ram_D2,x                ;4        
    bcc     Lfa1b                   ;2/3!     
    sta     ram_81                  ;3        
    lda     ram_D2,x                ;4        
    sta     ram_D1,x                ;4        
    lda     ram_81                  ;3        
    sta     ram_D2,x                ;4        
    lda     ram_D3,x                ;4        
    sta     ram_81                  ;3        
    lda     ram_D4,x                ;4        
    sta     ram_D3,x                ;4        
    lda     ram_81                  ;3        
    sta     ram_D4,x                ;4        
    lda     ram_CA                  ;3        
    lsr                             ;2        
    bcc     Lfa1b                   ;2/3      
    lda     ram_98                  ;3        
    and     #$0c                    ;2        
    lsr                             ;2        
    lsr                             ;2        
    tay                             ;2        
    lda     ram_98                  ;3        
    and     #$f3                    ;2        
    ora     Lfd1a,y                 ;4        
    sta     ram_98                  ;3   =  83
Lfa1b
    lda     ram_D4,x                ;4        
    ldx     #$05                    ;2        
    jsr     Lfd67                   ;6        
    ldx     ram_EF                  ;3        
    lda     ram_D1,x                ;4        
    sta     ram_89                  ;3        
    lda     ram_D2,x                ;4        
    cmp     #$ec                    ;2        
    bcs     Lfa31                   ;2/3      
    sec                             ;2        
    sbc     ram_D1,x                ;4   =  36
Lfa31
    sta     ram_8A                  ;3        
    lda     ram_D3,x                ;4        
    ldx     #$00                    ;2        
    jsr     Lfd67                   ;6        
    ldx     #$04                    ;2        
    jsr     Lfd7e                   ;6        
    sta     WSYNC                   ;3   =  26
;---------------------------------------
    sta     HMOVE                   ;3   =   3
Lfa43
    lda     INTIM                   ;4        
    bne     Lfa43                   ;2/3      
    sta     VBLANK                  ;3        
    sta     CXCLR                   ;3        
    ldx     #$00                    ;2        
    lda     #$ea                    ;2        
    sta     WSYNC                   ;3   =  19
;---------------------------------------
    sta     TIM64T                  ;4        
    sta     HMCLR                   ;3        
    bit     ram_AA                  ;3        
    bmi     Lfa64                   ;2/3      
    lda     ram_9E                  ;3        
    cmp     #$b4                    ;2        
    beq     Lfa64                   ;2/3      
    jmp     Lfb0d                   ;3   =  22 *
    
Lfa64
    ldx     #$07                    ;2        
    ldy     #$03                    ;2   =   4
Lfa68
    lda.wy  ram_E6,y                ;4        
    and     #$0f                    ;2        
    sta     ram_F0                  ;3        
    asl                             ;2        
    asl                             ;2        
    adc     ram_F0                  ;3        
    adc     #$54                    ;2        
    sta     ram_F0,x                ;4        
    dex                             ;2        
    lda.wy  ram_E6,y                ;4        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    sta     ram_F0                  ;3        
    asl                             ;2        
    asl                             ;2        
    adc     ram_F0                  ;3        
    adc     #$54                    ;2        
    sta     ram_F0,x                ;4        
    dex                             ;2        
    dey                             ;2        
    bpl     Lfa68                   ;2/3      
    sta     WSYNC                   ;3   =  61
;---------------------------------------
    lda     ram_DF                  ;3        
    sta     COLUP0                  ;3        
    lda     #$02                    ;2        
    sta     CTRLPF                  ;3        
    lda     ram_E0                  ;3        
    sta     COLUP1                  ;3        
    lda     #$04                    ;2        
    sta     ram_EE                  ;3        
    lda     #$ff                    ;2        
    sta     ram_EF                  ;3        
    nop                             ;2        
    nop                             ;2        
    ldx     #$05                    ;2   =  33
Lfaa7
    dex                             ;2        
    bpl     Lfaa7                   ;2/3 =   4
Lfaaa
    ldy     ram_F0                  ;3        
    lda     (ram_EE),y              ;5        
    sta     PF0                     ;3        
    lda     #$00                    ;2        
    sta     PF1                     ;3        
    ldy     ram_F5                  ;3        
    lda     (ram_EE),y              ;5        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    sta     PF2                     ;3        
    ldy     ram_F2                  ;3        
    lda     (ram_EE),y              ;5        
    sta     PF0                     ;3        
    ldy     ram_F7                  ;3        
    lda     (ram_EE),y              ;5        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    lsr                             ;2        
    sta     PF2                     ;3        
    ldy     ram_F4                  ;3        
    lda     (ram_EE),y              ;5        
    and     #$0f                    ;2        
    sta     ram_81                  ;3        
    ldy     ram_F1                  ;3        
    lda     (ram_EE),y              ;5        
    asl                             ;2        
    asl                             ;2        
    asl                             ;2        
    asl                             ;2        
    ora     ram_81                  ;3        
    sta     PF1                     ;3        
    lda     #$00                    ;2        
    sta     PF0                     ;3        
    sta     PF2                     ;3        
    ldy     ram_F6                  ;3        
    lda     (ram_EE),y              ;5        
    and     #$0f                    ;2        
    sta     ram_81                  ;3        
    ldy     ram_F3                  ;3        
    lda     (ram_EE),y              ;5        
    asl                             ;2        
    asl                             ;2        
    asl                             ;2        
    asl                             ;2        
    ora     ram_81                  ;3        
    sta     PF1                     ;3        
    dec     ram_EE                  ;5        
    bpl     Lfaaa                   ;2/3!     
    lda     ram_89                  ;3        
    clc                             ;2        
    adc     #$f9                    ;2        
    sta     ram_89                  ;3        
    lda     #$00                    ;2        
    sta     PF1                     ;3        
    beq     Lfb55                   ;2/3 = 167
Lfb0d
    jsr     Lfd67                   ;6         *
    jsr     Lfd7e                   ;6         *
    jsr     Lfde9                   ;6         *
    lda     #$a0                    ;2         *
    sta     ram_EE                  ;3         *
    lda     #$fc                    ;2         *
    sta     ram_EF                  ;3         *
    lda     #$00                    ;2         *
    sta     NUSIZ0                  ;3         *
    sta     WSYNC                   ;3   =  36 *
;---------------------------------------
    sta     HMOVE                   ;3         *
    lda     ram_C8                  ;3         *
    and     #$39                    ;2         *
    cmp     #$39                    ;2         *
    bne     Lfb3c                   ;2/3       *
    lda     ram_C8                  ;3         *
    rol                             ;2         *
    rol                             ;2         *
    rol                             ;2         *
    rol                             ;2         *
    and     #$03                    ;2         *
    tay                             ;2         *
    lda     Lfd1e,y                 ;4         *
    sta     ram_EE                  ;3   =  34 *
Lfb3c
    sta     WSYNC                   ;3   =   3 *
;---------------------------------------
    sta     HMCLR                   ;3         *
    jsr     Lfde9                   ;6         *
    ldy     #$09                    ;2   =  11 *
Lfb45
    sta     WSYNC                   ;3   =   3 *
;---------------------------------------
    lda     (ram_EE),y              ;5         *
    sta     GRP0                    ;3         *
    tya                             ;2         *
    lsr                             ;2         *
    bcs     Lfb52                   ;2/3       *
    jsr     Lfde9                   ;6   =  20 *
Lfb52
    dey                             ;2         *
    bpl     Lfb45                   ;2/3 =   4 *
Lfb55
    lda     #$00                    ;2        
    sta     WSYNC                   ;3   =   5
;---------------------------------------
    sta     GRP0                    ;3        
    lda     ram_84                  ;3        
    sta     HMP1                    ;3        
    sta     HMP0                    ;3        
    and     #$0f                    ;2        
    tay                             ;2   =  16
Lfb64
    dey                             ;2        
    bpl     Lfb64                   ;2/3      
    sta     RESP0                   ;3        
    lda     #$06                    ;2        
    sta     RESP1                   ;3        
    sta     WSYNC                   ;3   =  15
;---------------------------------------
    sta     HMOVE                   ;3        
    sta     NUSIZ0                  ;3        
    sta     NUSIZ1                  ;3        
    ldx     #$0a                    ;2        
    lda     #$fc                    ;2   =  13
Lfb79
    sta     ram_EF,x                ;4        
    dex                             ;2        
    dex                             ;2        
    bpl     Lfb79                   ;2/3      
    jsr     Lfde9                   ;6        
    lda     CXP0FB                  ;3        
    and     #$40                    ;2        
    sta     ram_82                  ;3        
    sta     CXCLR                   ;3        
    sta     HMCLR                   ;3        
    lda     #$f0                    ;2        
    sta     HMP1                    ;3        
    sta     WSYNC                   ;3   =  38
;---------------------------------------
    sta     HMOVE                   ;3        
    lda     ram_E1                  ;3        
    sta     COLUP0                  ;3        
    sta     COLUP1                  ;3   =  12
Lfb9a
    dec     ram_8F                  ;5        
    bpl     Lfba9                   ;2/3      
    ldy     #$05                    ;2        
    lda     #$01                    ;2        
    sta     VDELP0                  ;3        
    sta     VDELP1                  ;3        
    jmp     Lf0a5                   ;3   =  20
    
Lfba9
    jsr     Lfdb2                   ;6         *
    jmp     Lfb9a                   ;3   =   9 *
    
Lfbaf
    stx     ram_F2                  ;3        
    ldx     Lfd38,y                 ;4        
    lda     ram_D5,x                ;4        
    cmp     #$56                    ;2        
    bcs     Lfbbe                   ;2/3      
    cmp     #$45                    ;2         *
    bcs     Lfbec                   ;2/3 =  19 *
Lfbbe
    ldx     ram_F2                  ;3        
    lda     #$55                    ;2        
    sta.wy  ram_D5,y                ;5        
    lda     Lfce2,x                 ;4        
    and     SWCHB                   ;4        
    clc                             ;2        
    beq     Lfbd0                   ;2/3      
    lda     #$04                    ;2   =  24 *
Lfbd0
    adc     #$05                    ;2        
    adc     ram_9C,x                ;4        
    sta.wy  ram_D7,y                ;5        
    lda     #$03                    ;2        
    jsr     Lfe8b                   ;6        
    lda     ram_DB                  ;3        
    and     #$80                    ;2        
    beq     Lfbec                   ;2/3      
    lda     ram_AA                  ;3         *
    eor     #$40                    ;2         *
    sta     ram_AA                  ;3         *
    lda     #$50                    ;2         *
    sta     ram_D9                  ;3   =  39 *
Lfbec
    rts                             ;6   =   6
    
Lfbed
    lda     ram_C8                  ;3         *
    and     #$39                    ;2   =   5 *
Lfbf1
    cmp     #$39                    ;2        
    bne     Lfbfd                   ;2/3      
    lda     #$b4                    ;2         *
    sta     ram_9E                  ;3         *
    lda     #$00                    ;2         *
    sta     ram_CC                  ;3   =  14 *
Lfbfd
    rts                             ;6   =   6
    
    .byte   $00,$00                         ; $fbfe (*)
    
    .byte   %00000000 ; |        |            $fc00 (P)
    .byte   %00000000 ; |        |            $fc01 (P)
    .byte   %00000000 ; |        |            $fc02 (P)
    .byte   %00000000 ; |        |            $fc03 (P)
    .byte   %00000000 ; |        |            $fc04 (P)
    .byte   %00000000 ; |        |            $fc05 (G)
    .byte   %00000000 ; |        |            $fc06 (G)
    .byte   %00000000 ; |        |            $fc07 (G)
    .byte   %00000000 ; |        |            $fc08 (G)
    .byte   %00000000 ; |        |            $fc09 (G)
    .byte   %11111110 ; |####### |            $fc0a (G)
    .byte   %11111110 ; |####### |            $fc0b (G)
    .byte   %01111100 ; | #####  |            $fc0c (G)
    .byte   %11111110 ; |####### |            $fc0d (G)
    .byte   %00111000 ; |  ###   |            $fc0e (G)
    .byte   %00111000 ; |  ###   |            $fc0f (G)
    .byte   %01111100 ; | #####  |            $fc10 (G)
    .byte   %00111000 ; |  ###   |            $fc11 (G)
    .byte   %00111000 ; |  ###   |            $fc12 (G)
    .byte   %00010000 ; |   #    |            $fc13 (G)
    .byte   %10110110 ; |# ## ## |            $fc14 (G)
    .byte   %10111110 ; |# ##### |            $fc15 (G)
    .byte   %01011101 ; | # ### #|            $fc16 (G)
    .byte   %01101011 ; | ## # ##|            $fc17 (G)
    .byte   %01011001 ; | # ##  #|            $fc18 (G)
    .byte   %01100011 ; | ##   ##|            $fc19 (G)
    .byte   %00111100 ; |  ####  |            $fc1a (G)
    .byte   %01001100 ; | #  ##  |            $fc1b (G)
    .byte   %00010100 ; |   # #  |            $fc1c (G)
    .byte   %00101000 ; |  # #   |            $fc1d (G)
    .byte   %10110110 ; |# ## ## |            $fc1e (G)
    .byte   %10111110 ; |# ##### |            $fc1f (G)
    .byte   %01011101 ; | # ### #|            $fc20 (G)
    .byte   %01011011 ; | # ## ##|            $fc21 (G)
    .byte   %00100100 ; |  #  #  |            $fc22 (G)
    .byte   %10000101 ; |#    # #|            $fc23 (G)
    .byte   %01100110 ; | ##  ## |            $fc24 (G)
    .byte   %01100100 ; | ##  #  |            $fc25 (G)
    .byte   %00101000 ; |  # #   |            $fc26 (G)
    .byte   %00010000 ; |   #    |            $fc27 (G)
    .byte   %10010000 ; |#  #    |            $fc28 (G)
    .byte   %10001000 ; |#   #   |            $fc29 (G)
    .byte   %10001000 ; |#   #   |            $fc2a (G)
    .byte   %01000100 ; | #   #  |            $fc2b (G)
    .byte   %01000010 ; | #    # |            $fc2c (G)
    .byte   %01000010 ; | #    # |            $fc2d (G)
    .byte   %11111111 ; |########|            $fc2e (G)
    .byte   %11011011 ; |## ## ##|            $fc2f (G)
    .byte   %01011010 ; | # ## # |            $fc30 (G)
    .byte   %00011000 ; |   ##   |            $fc31 (G)
    .byte   %00001001 ; |    #  #|            $fc32 (G)
    .byte   %00010001 ; |   #   #|            $fc33 (G)
    .byte   %00010001 ; |   #   #|            $fc34 (G)
    .byte   %00100010 ; |  #   # |            $fc35 (G)
    .byte   %01000010 ; | #    # |            $fc36 (G)
    .byte   %01000010 ; | #    # |            $fc37 (G)
    .byte   %11111111 ; |########|            $fc38 (G)
    .byte   %11011011 ; |## ## ##|            $fc39 (G)
    .byte   %01111110 ; | ###### |            $fc3a (G)
    .byte   %00011000 ; |   ##   |            $fc3b (G)
    .byte   %10100101 ; |# #  # #|            $fc3c (G)
    .byte   %10100101 ; |# #  # #|            $fc3d (G)
    .byte   %10100101 ; |# #  # #|            $fc3e (G)
    .byte   %10011001 ; |#  ##  #|            $fc3f (G)
    .byte   %10011001 ; |#  ##  #|            $fc40 (G)
    .byte   %10100101 ; |# #  # #|            $fc41 (G)
    .byte   %11111111 ; |########|            $fc42 (G)
    .byte   %01011010 ; | # ## # |            $fc43 (G)
    .byte   %01111110 ; | ###### |            $fc44 (G)
    .byte   %00111100 ; |  ####  |            $fc45 (G)
    .byte   %01000010 ; | #    # |            $fc46 (G)
    .byte   %01011010 ; | # ## # |            $fc47 (G)
    .byte   %01011010 ; | # ## # |            $fc48 (G)
    .byte   %01011010 ; | # ## # |            $fc49 (G)
    .byte   %10011001 ; |#  ##  #|            $fc4a (G)
    .byte   %10100101 ; |# #  # #|            $fc4b (G)
    .byte   %11111111 ; |########|            $fc4c (G)
    .byte   %01011010 ; | # ## # |            $fc4d (G)
    .byte   %01111110 ; | ###### |            $fc4e (G)
    .byte   %00111100 ; |  ####  |            $fc4f (G)
    .byte   %11000011 ; |##    ##|            $fc50 (G)
    .byte   %00100100 ; |  #  #  |            $fc51 (G)
    .byte   %00011000 ; |   ##   |            $fc52 (G)
    .byte   %00011000 ; |   ##   |            $fc53 (G)
    .byte   %00011000 ; |   ##   |            $fc54 (G)
    .byte   %01011010 ; | # ## # |            $fc55 (G)
    .byte   %10111101 ; |# #### #|            $fc56 (G)
    .byte   %10100101 ; |# #  # #|            $fc57 (G)
    .byte   %10000001 ; |#      #|            $fc58 (G)
    .byte   %10000001 ; |#      #|            $fc59 (G)
    .byte   %00100100 ; |  #  #  |            $fc5a (G)
    .byte   %01000010 ; | #    # |            $fc5b (G)
    .byte   %00100100 ; |  #  #  |            $fc5c (G)
    .byte   %10100101 ; |# #  # #|            $fc5d (G)
    .byte   %10011001 ; |#  ##  #|            $fc5e (G)
    .byte   %10011001 ; |#  ##  #|            $fc5f (G)
    .byte   %10111101 ; |# #### #|            $fc60 (G)
    .byte   %01011010 ; | # ## # |            $fc61 (G)
    .byte   %00011000 ; |   ##   |            $fc62 (G)
    .byte   %00000000 ; |        |            $fc63 (G)
    .byte   %10000001 ; |#      #|            $fc64 (G)
    .byte   %01000010 ; | #    # |            $fc65 (G)
    .byte   %01000010 ; | #    # |            $fc66 (G)
    .byte   %00100100 ; |  #  #  |            $fc67 (G)
    .byte   %00100100 ; |  #  #  |            $fc68 (G)
    .byte   %00111100 ; |  ####  |            $fc69 (G)
    .byte   %01111110 ; | ###### |            $fc6a (G)
    .byte   %11101011 ; |### # ##|            $fc6b (G)
    .byte   %01111110 ; | ###### |            $fc6c (G)
    .byte   %00111100 ; |  ####  |            $fc6d (G)
    .byte   %00000000 ; |        |            $fc6e (G)
    .byte   %00100100 ; |  #  #  |            $fc6f (G)
    .byte   %01011010 ; | # ## # |            $fc70 (G)
    .byte   %01000010 ; | #    # |            $fc71 (G)
    .byte   %00100100 ; |  #  #  |            $fc72 (G)
    .byte   %00111100 ; |  ####  |            $fc73 (G)
    .byte   %01111110 ; | ###### |            $fc74 (G)
    .byte   %11010111 ; |## # ###|            $fc75 (G)
    .byte   %01111110 ; | ###### |            $fc76 (G)
    .byte   %00111100 ; |  ####  |            $fc77 (G)
    .byte   %01110111 ; | ### ###|            $fc78 (G)
    .byte   %01000100 ; | #   #  |            $fc79 (G)
    .byte   %01000100 ; | #   #  |            $fc7a (G)
    .byte   %01000100 ; | #   #  |            $fc7b (G)
    .byte   %01011100 ; | # ###  |            $fc7c (G)
    .byte   %11111111 ; |########|            $fc7d (G)
    .byte   %11110011 ; |####  ##|            $fc7e (G)
    .byte   %11110011 ; |####  ##|            $fc7f (G)
    .byte   %01111110 ; | ###### |            $fc80 (G)
    .byte   %00111100 ; |  ####  |            $fc81 (G)
    .byte   %11101110 ; |### ### |            $fc82 (G)
    .byte   %00100010 ; |  #   # |            $fc83 (G)
    .byte   %00100010 ; |  #   # |            $fc84 (G)
    .byte   %00100010 ; |  #   # |            $fc85 (G)
    .byte   %00111010 ; |  ### # |            $fc86 (G)
    .byte   %11111111 ; |########|            $fc87 (G)
    .byte   %11001111 ; |##  ####|            $fc88 (G)
    .byte   %11001111 ; |##  ####|            $fc89 (G)
    .byte   %01111110 ; | ###### |            $fc8a (G)
    .byte   %00111100 ; |  ####  |            $fc8b (G)
    .byte   %11100111 ; |###  ###|            $fc8c (G)
    .byte   %01000010 ; | #    # |            $fc8d (G)
    .byte   %01111110 ; | ###### |            $fc8e (G)
    .byte   %01111110 ; | ###### |            $fc8f (G)
    .byte   %01101011 ; | ## # ##|            $fc90 (G)
    .byte   %00111110 ; |  ##### |            $fc91 (G)
    .byte   %10011000 ; |#  ##   |            $fc92 (G)
    .byte   %10100100 ; |# #  #  |            $fc93 (G)
    .byte   %01000010 ; | #    # |            $fc94 (G)
    .byte   %00000001 ; |       #|            $fc95 (G)
    .byte   %11000110 ; |##   ## |            $fc96 (G)
    .byte   %01000010 ; | #    # |            $fc97 (G)
    .byte   %01111110 ; | ###### |            $fc98 (G)
    .byte   %01111110 ; | ###### |            $fc99 (G)
    .byte   %01010110 ; | # # ## |            $fc9a (G)
    .byte   %01111100 ; | #####  |            $fc9b (G)
    .byte   %00011001 ; |   ##  #|            $fc9c (G)
    .byte   %00100101 ; |  #  # #|            $fc9d (G)
    .byte   %01000010 ; | #    # |            $fc9e (G)
    .byte   %10000000 ; |#       |            $fc9f (G)
    
    .byte   $00,$38,$7c,$fe,$fe,$aa,$fe,$7c ; $fca0 (*)
    .byte   $38,$00,$00,$00,$00,$24,$3c,$76 ; $fca8 (*)
    .byte   $5c,$28,$00,$00,$00,$00,$00,$01 ; $fcb0 (*)
    .byte   $24,$95,$48,$c7,$24,$90,$20,$40 ; $fcb8 (*)
    .byte   $5d,$bb,$b6,$77,$cc,$2d,$7e,$cd ; $fcc0 (*)
    .byte   $da,$6d,$77,$77,$82,$54,$25,$53 ; $fcc8 (*)
    .byte   $c3,$54,$93,$a5,$99,$81         ; $fcd0 (*)
Lfcd6
    .byte   $28,$78,$64,$50,$3c,$8c         ; $fcd6 (D)
Lfcdc
    .byte   $01,$02                         ; $fcdc (D)
Lfcde
    .byte   $04,$08,$10,$20                 ; $fcde (D)
Lfce2
    .byte   $40,$80                         ; $fce2 (D)
Lfce4
    .byte   $22                             ; $fce4 (D)
    .byte   $16,$0c,$08,$05,$04,$03,$02,$00 ; $fce5 (*)
Lfced
    .byte   $20                             ; $fced (D)
    .byte   $20,$15,$15,$10,$0b,$07,$07,$04 ; $fcee (*)
Lfcf6
    .byte   $01                             ; $fcf6 (D)
    .byte   $01,$02,$02,$03,$03,$03,$04,$05 ; $fcf7 (*)
Lfcff
    .byte   $0f,$0e,$0f,$00,$02,$00,$04,$02 ; $fcff (*)
    .byte   $34,$52,$cc,$f6,$14,$0f,$00,$e2 ; $fd07 (D)
Lfd0f
    .byte   $05,$0a,$0f,$14                 ; $fd0f (*)
Lfd13
    .byte   $bd,$b4,$ab                     ; $fd13 (*)
Lfd16
    .byte   $54,$59,$5e                     ; $fd16 (*)
    .byte   $63                             ; $fd19 (D)
Lfd1a
    .byte   $00                             ; $fd1a (D)
    .byte   $08,$04,$0c                     ; $fd1b (*)
Lfd1e
    .byte   $aa,$b6,$c0,$cc                 ; $fd1e (*)
Lfd22
    .byte   $3c,$7e,$7e,$7e,$7e,$ff,$ff,$ff ; $fd22 (D)
    .byte   $c3                             ; $fd2a (D)
Lfd2b
    .byte   $05,$10,$15,$20,$25,$30         ; $fd2b (*)
Lfd31
    .byte   $00                             ; $fd31 (D)
    .byte   $09,$12,$1b,$24,$2d,$36         ; $fd32 (*)
Lfd38
    .byte   $01                             ; $fd38 (D)
Lfd39
    .byte   $00,$10,$20,$30,$40,$50         ; $fd39 (D)
    .byte   $60,$70,$80,$90,$00             ; $fd3f (*)
Lfd44
    .byte   $10                             ; $fd44 (*)
    .byte   $8b                             ; $fd45 (D)
    .byte   $d1                             ; $fd46 (*)
    .byte   $bf                             ; $fd47 (D)
    .byte   $9d,$d1                         ; $fd48 (*)
    .byte   $d1                             ; $fd4a (D)
Lfd4b
    .byte   $18                             ; $fd4b (D)
    .byte   $10,$61,$d1,$32,$90,$14         ; $fd4c (*)
Lfd52
    .byte   $10                             ; $fd52 (D)
    .byte   $10,$30,$30,$10,$10,$10         ; $fd53 (*)
Lfd59
    .byte   $00                             ; $fd59 (D)
    .byte   $00,$08,$00,$00,$00,$00         ; $fd5a (*)
Lfd60
    .byte   $05                             ; $fd60 (D)
Lfd61
    .byte   $03,$17,$2b,$23,$75,$b4         ; $fd61 (D)
    
Lfd67
    ldy     #$ff                    ;2        
    sec                             ;2   =   4
Lfd6a
    iny                             ;2        
    sbc     #$0f                    ;2        
    bcs     Lfd6a                   ;2/3      
    eor     #$ff                    ;2        
    sbc     #$06                    ;2        
    asl                             ;2        
    asl                             ;2        
    asl                             ;2        
    asl                             ;2        
    sty     ram_83,x                ;4        
    ora     ram_83,x                ;4        
    sta     ram_83,x                ;4        
    rts                             ;6   =  36
    
Lfd7e
    sta     WSYNC                   ;3   =   3
;---------------------------------------
    nop                             ;2        
    iny                             ;2        
    sta     HMP0,x                  ;4        
    nop                             ;2   =  10
Lfd85
    dey                             ;2        
    bpl     Lfd85                   ;2/3      
    sta     RESP0,x                 ;4        
    rts                             ;6   =  14
    
Lfd8b
    cpy     #$09                    ;2         *
    bcs     Lfdb1                   ;2/3 =   4 *
Lfd8f
    stx     ram_EE                  ;3         *
    inx                             ;2         *
    jsr     Lfdfb                   ;6         *
    and     #$20                    ;2         *
    bne     Lfd9b                   ;2/3       *
    dex                             ;2         *
    dex                             ;2   =  19 *
Lfd9b
    cpx     #$08                    ;2         *
    bcs     Lfda8                   ;2/3       *
    lda     ram_EA                  ;3         *
    cmp     #$c0                    ;2         *
    bcc     Lfda8                   ;2/3       *
    jsr     Lfdaa                   ;6   =  17 *
Lfda8
    ldx     ram_EE                  ;3   =   3 *
Lfdaa
    lda     (ram_F0),y              ;5         *
    and     Lff4c,x                 ;4         *
    sta     (ram_F0),y              ;6   =  15 *
Lfdb1
    rts                             ;6   =   6 *
    
Lfdb2
    dec     ram_89                  ;5        
    lda     ram_89                  ;3        
    bmi     Lfdc7                   ;2/3      
    cmp     #$04                    ;2        
    lda     #$02                    ;2        
    bcc     Lfdbf                   ;2/3      
    lsr                             ;2   =  18
Lfdbf
    sta     ENABL                   ;3        
    sta     WSYNC                   ;3   =   6
;---------------------------------------
    sta     HMCLR                   ;3        
    bpl     Lfde4                   ;2/3 =   5
Lfdc7
    clc                             ;2        
    adc     ram_8A                  ;3        
    sta     ram_89                  ;3        
    lda     #$00                    ;2        
    sta     WSYNC                   ;3   =  13
;---------------------------------------
    sta     HMCLR                   ;3        
    sta     ENABL                   ;3        
    lda     ram_88                  ;3        
    sta     HMBL                    ;3        
    and     #$0f                    ;2        
    tay                             ;2   =  16
Lfddb
    dey                             ;2        
    bpl     Lfddb                   ;2/3      
    sta     RESBL                   ;3        
    lda     #$7c                    ;2        
    sta     ram_8A                  ;3   =  12
Lfde4
    sta     WSYNC                   ;3   =   3
;---------------------------------------
    sta     HMOVE                   ;3        
    rts                             ;6   =   9
    
Lfde9
    dec     ram_89                  ;5        
    lda     ram_89                  ;3        
    cmp     #$04                    ;2        
    bcc     Lfdf5                   ;2/3      
    lda     #$00                    ;2        
    bcs     Lfdf8                   ;2/3 =  16
Lfdf5
    nop                             ;2        
    lda     #$02                    ;2   =   4
Lfdf8
    sta     ENABL                   ;3        
    rts                             ;6   =   9
    
Lfdfb
    lda     ram_EA                  ;3        
    asl                             ;2        
    asl                             ;2        
    clc                             ;2        
    adc     ram_EA                  ;3        
    clc                             ;2        
    adc     #$59                    ;2        
    sta     ram_EA                  ;3        
    rts                             ;6   =  25
    
Lfe08
    lda     ram_C7                  ;3        
    bne     Lfe68                   ;2/3      
    inc     ram_CD,x                ;6        
    ldy     ram_CB,x                ;4        
    beq     Lfe68                   ;2/3      
    cpy     #$05                    ;2        
    beq     Lfe1a                   ;2/3      
    cpy     #$02                    ;2        
    bne     Lfe3e                   ;2/3 =  25
Lfe1a
    ldy     ram_CD,x                ;4         *
    cpy     #$08                    ;2         *
    bne     Lfe28                   ;2/3       *
    lda     ram_CB,x                ;4         *
    cmp     #$05                    ;2         *
    beq     Lfe6c                   ;2/3       *
    bne     Lfe68                   ;2/3 =  18 *
Lfe28
    lda     Lffea,y                 ;4         *
    sta     AUDF0,x                 ;4         *
    lda     #$0c                    ;2         *
    sta     AUDC0,x                 ;4         *
    lda     #$cb                    ;2         *
    cmp     #$05                    ;2         *
    lda     #$04                    ;2         *
    bcc     Lfe3b                   ;2/3       *
    lda     #$08                    ;2   =  24 *
Lfe3b
    sta     AUDV0,x                 ;4         *
    rts                             ;6   =  10 *
    
Lfe3e
    lda     Lfd44,y                 ;4        
    sta     ram_EE                  ;3        
    lda     #$ff                    ;2        
    sta     ram_EF                  ;3        
    ldy     ram_CF,x                ;4        
    lda     (ram_EE),y              ;5        
    cmp     ram_CD,x                ;4        
    bne     Lfe67                   ;2/3      
    iny                             ;2        
    lda     (ram_EE),y              ;5        
    bmi     Lfe68                   ;2/3      
    cmp     #$3f                    ;2        
    beq     Lfe6c                   ;2/3      
    sta     AUDF0,x                 ;4        
    iny                             ;2        
    lda     (ram_EE),y              ;5        
    sta     AUDC0,x                 ;4        
    iny                             ;2        
    lda     (ram_EE),y              ;5        
    iny                             ;2        
    sty     ram_CF,x                ;4        
    sta     AUDV0,x                 ;4   =  72
Lfe67
    rts                             ;6   =   6
    
Lfe68
    lda     #$00                    ;2        
    sta     ram_CB,x                ;4   =   6
Lfe6c
    lda     #$00                    ;2        
    sta     AUDV0,x                 ;4        
    sta     ram_CD,x                ;4        
    sta     ram_CF,x                ;4        
    rts                             ;6   =  20
    
Lfe75
    lda     ram_CA                  ;3        
    and     #$01                    ;2        
    ora     #$80                    ;2        
    sta     ram_CA                  ;3        
    rts                             ;6   =  16
    
Lfe7e
    cmp     ram_CB                  ;3        
    bcc     Lfe8a                   ;2/3      
    sta     ram_CB                  ;3        
    lda     #$00                    ;2        
    sta     ram_CD                  ;3        
    sta     ram_CF                  ;3   =  16
Lfe8a
    rts                             ;6   =   6
    
Lfe8b
    cmp     ram_CC                  ;3        
    bcc     Lfe97                   ;2/3      
    sta     ram_CC                  ;3        
    lda     #$00                    ;2        
    sta     ram_CE                  ;3        
    sta     ram_D0                  ;3   =  16
Lfe97
    rts                             ;6   =   6
    
Start
    cld                             ;2        
    sei                             ;2        
    ldx     #$00                    ;2        
    txa                             ;2   =   8
Lfe9d
    sta     VSYNC,x                 ;4        
    inx                             ;2        
    bne     Lfe9d                   ;2/3      
    dex                             ;2        
    txs                             ;2        
    jsr     Lfeb2                   ;6        
    lda     #$c5                    ;2        
    sta     ram_C7                  ;3        
    lda     #$80                    ;2        
    sta     ram_AA                  ;3        
    jmp     Lf4d4                   ;3   =  31
    
Lfeb2
    lda     #$00                    ;2        
    sta     ram_E6                  ;3        
    sta     ram_E8                  ;3        
    sta     ram_E7                  ;3        
    sta     ram_E9                  ;3        
    sta     ram_C7                  ;3        
    lda     #$01                    ;2   =  19
Lfec0
    sta     ram_AA                  ;3        
    lda     #$00                    ;2        
    sta     ram_90                  ;3        
    sta     ram_99                  ;3        
    sta     ram_C6                  ;3        
    jsr     Lfe75                   ;6        
    lda     #$03                    ;2        
    sta     ram_C9                  ;3        
    lda     #$ff                    ;2        
    sta     ram_8B                  ;3        
    lda     ram_98                  ;3        
    and     #$53                    ;2        
    ldy     ram_EC                  ;3        
    ora     Lfd52,y                 ;4        
    ora     Lfd59,y                 ;4        
    sta     ram_98                  ;3        
    lda     ram_E5                  ;3        
    and     #$7f                    ;2        
    sta     ram_E5                  ;3        
    jsr     Lfefa                   ;6        
    ldx     #$0a                    ;2   =  65
Lfeee
    lda     ram_90,x                ;4        
    sta     ram_9F,x                ;4        
    dex                             ;2        
    bpl     Lfeee                   ;2/3      
    lda     #$6e                    ;2        
    sta     ram_A7                  ;3        
    rts                             ;6   =  23
    
Lfefa
    ldx     #$05                    ;2        
    lda     #$3f                    ;2   =   4
Lfefe
    sta     ram_92,x                ;4        
    dex                             ;2        
    bpl     Lfefe                   ;2/3!     
    sta     ram_EB                  ;3        
    sta     ram_D7                  ;3        
    sta     ram_D8                  ;3        
    sta     ram_D3                  ;3        
    sta     ram_D4                  ;3        
    lda     #$f6                    ;2        
    sta     ram_D5                  ;3        
    sta     ram_D6                  ;3        
    sta     ram_D1                  ;3        
    sta     ram_D2                  ;3        
    ldx     #$05                    ;2   =  39
Lff19
    lda     Lfd61,x                 ;4        
    sta     ram_99,x                ;4        
    dex                             ;2        
    bne     Lff19                   ;2/3      
    txa                             ;2        
    sta     ram_CB                  ;3        
    sta     ram_CC                  ;3        
    lda     #$24                    ;2        
    sta     ram_91                  ;3        
    lda     #$42                    ;2        
    ora     ram_98                  ;3        
    sta     ram_98                  ;3        
    lda     #$30                    ;2        
    sta     ram_C8                  ;3        
    lda     ram_AA                  ;3        
    and     #$f7                    ;2        
    sta     ram_AA                  ;3   =  46
Lff3a
    ldx     #$1a                    ;2        
    ldy     #$08                    ;2   =   4
Lff3e
    lda     Lfd22,y                 ;4        
    sta     ram_AB,x                ;4        
    dey                             ;2        
    bpl     Lff48                   ;2/3      
    ldy     #$08                    ;2   =  14
Lff48
    dex                             ;2        
    bpl     Lff3e                   ;2/3      
    rts                             ;6   =  10
    
Lff4c
    .byte   $7f,$bf,$df,$ef,$f7,$fb,$fd,$fe ; $ff4c (*)
    
    .byte   %11100111 ; |***  ***|            $ff54 (P)
    .byte   %10100101 ; |* *  * *|            $ff55 (P)
    .byte   %10100101 ; |* *  * *|            $ff56 (P)
    .byte   %10100101 ; |* *  * *|            $ff57 (P)
    .byte   %11100111 ; |***  ***|            $ff58 (P)
    .byte   %11100111 ; |***  ***|            $ff59 (P)
    .byte   %01000010 ; | *    * |            $ff5a (P)
    .byte   %01000010 ; | *    * |            $ff5b (P)
    .byte   %01100110 ; | **  ** |            $ff5c (P)
    .byte   %01000010 ; | *    * |            $ff5d (P)
    
    .byte   $e7,$24,$e7,$81,$e7             ; $ff5e (*)
    
    .byte   %11100111 ; |***  ***|            $ff63 (P)
    .byte   %10000001 ; |*      *|            $ff64 (P)
    .byte   %11100111 ; |***  ***|            $ff65 (P)
    .byte   %10000001 ; |*      *|            $ff66 (P)
    .byte   %11100111 ; |***  ***|            $ff67 (P)
    
    .byte   $81,$81,$e7,$a5,$a5,$e7,$81,$e7 ; $ff68 (*)
    .byte   $24,$e7,$e7,$a5,$e7,$24,$24,$81 ; $ff70 (*)
    .byte   $81,$81,$81,$e7,$e7,$a5,$e7,$a5 ; $ff78 (*)
    .byte   $e7,$81,$81,$e7,$a5,$e7         ; $ff80 (*)
    
    .byte   %00000000 ; |        |            $ff86 (P)
    .byte   %00000000 ; |        |            $ff87 (P)
    .byte   %00000000 ; |        |            $ff88 (P)
    .byte   %00000000 ; |        |            $ff89 (P)
    .byte   %00000000 ; |        |            $ff8a (P)
    
    .byte   $01,$16,$09,$0a,$02,$19,$08,$0a ; $ff8b (D)
    .byte   $03,$1f,$0c,$08,$04,$16,$0e,$07 ; $ff93 (D)
    .byte   $06,$ff                         ; $ff9b (D)
    .byte   $01,$18,$0c,$03,$03,$16,$0c,$03 ; $ff9d (*)
    .byte   $05,$14,$0c,$03,$07,$12,$0c,$03 ; $ffa5 (*)
    .byte   $09,$10,$0c,$03,$0b,$0e,$0c,$03 ; $ffad (*)
    .byte   $0d,$0d,$0c,$03,$0f,$10,$0c,$03 ; $ffb5 (*)
    .byte   $11,$3f                         ; $ffbd (*)
    .byte   $01,$18,$08,$07,$04,$19,$08,$05 ; $ffbf (D)
    .byte   $10,$1c,$08,$02,$30,$1e,$08,$01 ; $ffc7 (D)
    .byte   $50,$ff,$01,$18,$03,$0c,$09,$10 ; $ffcf (D)
    .byte   $0a,$08,$11,$12,$0e,$0f,$19,$16 ; $ffd7 (D)
    .byte   $0e,$08,$29,$1a,$0e,$04,$39,$1d ; $ffdf (D)
    .byte   $0e,$02,$49                     ; $ffe7 (D)
Lffea
    .byte   $ff                             ; $ffea (D)
    .byte   $10,$0d,$0a,$08,$07,$06,$05     ; $ffeb (*)
Lfff2
    .byte   $06,$07,$03,$04,$05,$06,$00,$00 ; $fff2 (*)
    .byte   $98,$fe                         ; $fffa (*)
    .byte   $98,$fe                         ; $fffc (D)
    .byte   $98                             ; $fffe (*)
    .byte   $fe                             ; $ffff (*)
