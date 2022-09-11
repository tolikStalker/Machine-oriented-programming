model  SMALL 
        stack  100h 
 
        dataseg 
AskCont db 0Ah,0Dh 
        db '�������� ࠡ��� ? Esc, �த������ ? �� ������ ' 
        db '$' 
Ask     db 0Ah,0Dh,'������ ��ப�:','$' 
COUNT   db 10 dup( ? ) ; ���稪� ������⢠ ��� 
CIFR    db '0123456789ABCDEF' ; ⠡��� �८�ࠧ������ 
                            ; ��⭠������� ��� ��� �뢮�� 
INPSTR  db 80, ?, 82 dup( ? ) ; ���� ����� 
OUTSTR  db 0Dh,0Ah, ?, ' ', ?, ?, '$' ; ���� �뢮�� 
 
        codeseg 
        startupcode 
 
BEGIN: 
;���� ��ப� 
        lea    DX, Ask 
        mov    AH, 09h 
        int    21h 
        lea    DX, INPSTR 
        mov    AH, 0Ah 
        int    21h 
 
;��ࠡ�⪠ 
        xor    AX, AX 
        lea    BX, INPSTR+2  ;���� ��砫� ��������� ��ப� 
        xor    CX, CX 
        mov    CL, INPSTR+1  ;���-�� ��������� ᨬ����� ��ப� 
BB: 
        mov    AL, [BX]      ;��।��� ᨬ��� ��ப� 
        cmp    AL, '0'       ;��� ᨬ���� �����, 祬 ��� ��� ? 
        jb     NC            ;��, �.�. �� ��� 
        cmp    AL, '9'       ;��� ᨬ���� �����, 祬 ��� ����⪨ ? 
        ja     NC            ;��, �.�. �� ��� 
;ᨬ��� ? �����筠� ��� 
        sub    AL, '0'       ;����砥� ��. ���祭�� ����, �.�. 
        mov    SI, AX        ; ������ � ���ᨢ� ���稪�� COUNT 
        inc    COUNT[SI]     ;㢥��稢��� ᮮ⢥���. ���稪 
NC:     inc    BX            ;������� ��।��� ᨬ��� ��ப� 
        loop   BB 
 
;�뢮� १���⮢ 
        lea    DX, OUTSTR 
        xor    SI, SI        ;���稪 ��� 
OO:     xor    AX, AX 
        mov    AL, '0' 
        add    AX, SI        ;ASCII-��� ��।��� ���� � SI 
        mov    OUTSTR+2, AL  ; � ���� �뢮�� 
        mov    AL, COUNT[SI] ;AL<-���祭�� ���稪� 
                             ; ��।��� ���� 
        mov    CL, 4         ;����砥� 
        shr    AL, CL        ; � DI 
        mov    DI, AX        ; ���祭�� ���襩 ���. ���� 
        mov    AL, CIFR[DI]  ; ���稪� �८�ࠧ㥬 � ASCII-��� 
        mov    OUTSTR+4, AL  ;����뫠�� � ���� �뢮�� 
        mov    AL, COUNT[SI] ;AL<-����. ���稪� ��।�. ���� 
        and    AL, 0Fh       ;����砥� � DI ���祭�� 
        mov    DI, AX        ; ����襩 ���. ���� ���稪� 
        mov    AL, CIFR[DI]  ; �८�ࠧ㥬 ASCII-��� 
        mov    OUTSTR+5, AL  ; ����뫠�� � ���� �뢮�� 
        mov    AH, 09h       ;�뢮� ��ନ஢����� � ���� 
        int    21h           ; ��ப� 
        inc    SI            ;���稪 ��।��� ���� 
        cmp    SI, 10 
        jl     OO 
 
;����� �� �த������� ࠡ��� 
        lea    DX, AskCont 
        mov    AH, 09h 
        int    21h 
        mov    AH, 08h 
        int    21h 
        cmp    AL, 27 
        je     QUIT 
        jmp    BEGIN 
 
;����� ࠡ��� 
QUIT:   exitcode  0 
end 