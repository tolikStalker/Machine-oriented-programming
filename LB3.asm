model SMALL     ; ������ �����: small
stack 100h      ; ������ ���: 256 ����

dataseg         ; ��।������ ��砫� ���樠����஢������ ᥣ���� ������

COUNT   dw      0 
MASS    db      1h,2h, 3h,4h, 5h,6h, 7h,8h
 
codeseg         ; ��।������ ��砫� ����
startupcode     ; ���ᯥ稢��� ��� ���樠����樨 � �⬥砥� ��砫� �ணࠬ��

lea BX, MASS    ; ����㧨�� ���� MASS � BX
mov CX, 8       ; ��⠭����� ���稪 

BCL:
    mov DL, 1               ; ����㧨�� 1 � DL
    BICL:
        test [BX], DL       ; ZF = ⥪�騩 ����� ���������� � DL
        jz SKP              ; �ய����� �ਡ������� �᫨ ��� 0
            add COUNT, 1    ; �ਡ����� � ����稪� ���
        SKP:
        shl DL, 1           ; ����� ��᪨ ����� �� 1
    jnb BICL                ; ������� �᫨ �� �뫮 ��९�������
    add BX, 1               ; ������騩 �ᥭ�
loop BCL                    ; ������, �᫨ ���稪 CX �� ����
 
exitcode  0 
end