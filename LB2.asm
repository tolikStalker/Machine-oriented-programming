model SMALL     ; ������ �����: small
stack 100h      ; ������ ���: 256 ����

dataseg         ; ��।������ ��砫� ���樠����஢������ ᥣ���� ������

SUM     dw      0 
MASS    dw      10h,20h,30h,5h,40h,15h,20h,70h,35h,34h 
 
codeseg         ; ��।������ ��砫� ����
startupcode     ; ���ᯥ稢��� ��� ���樠����樨 � �⬥砥� ��砫� �ணࠬ��

lea BX, MASS    ; ����㧨�� ���� MASS � BX
mov CX, 10      ; ��⠭����� ���稪 

CCL:
    add SUM, [BX]   ; �������� � SUM ⥪�騩 �����
    add BX, 2       ; ������騩 ����� ���ᨢ�
loop CCL        ; ������, �᫨ ���稪 CX �� ����

exitcode  0 
end