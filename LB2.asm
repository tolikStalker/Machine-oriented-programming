model SMALL     ; ������ �����: small
stack 100h      ; ������ ���: 256 ����

dataseg         ; ��।������ ��砫� ���樠����஢������ ᥣ���� ������

SUM     dw      0 
MASS    dw      -10h,10h, -30h,20h, -20h,30h, -30h,30h, -10h,5h 
 
codeseg         ; ��।������ ��砫� ����
startupcode     ; ���ᯥ稢��� ��� ���樠����樨 � �⬥砥� ��砫� �ணࠬ��

lea BX, MASS    ; ����㧨�� ���� MASS � BX
mov CX, 10      ; ��⠭����� ���稪 

CCL:
    mov AX, [BX]    ; ���祭�� ����� � ॣ���� AX
    add SUM, AX     ; �������� � SUM ⥪�騩 �����
    add BX, 2       ; ������騩 ����� ���ᨢ�
loop CCL        ; ������, �᫨ ���稪 CX �� ����

exitcode  0 
end