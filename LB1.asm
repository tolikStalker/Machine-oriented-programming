model SMALL     ; ������ �����: small
stack 100h      ; ������ ���: 256 ����
dataseg         ; ��।������ ��砫� ���樠����஢������ ᥣ���� ������
A dw 15          ; ��।������ ��६����� A ࠧ��஬ 2 ����
B dw 88         ; ��।������ ��६����� B ࠧ��஬ 2 ����
C dw 32          ; ��।������ ��६����� C ࠧ��஬ 2 ����
X dw ?          ; ��।������ ��६����� X ࠧ��஬ 2 ����
codeseg         ; ��।������ ��砫� ����
startupcode     ; ���ᯥ稢��� ��� ���樠����樨 � �⬥砥� ��砫� �ணࠬ��

mov AX, A       ; AX = A
mov BX, B       ; BX = B

sub AX, BX      ; AX = AX - BX

cwd             ; DX:AX ���७�� AX
mov BX, 4       ; BX = 4
idiv BX         ; AX = DX:AX / BX, DX = DX:AX mod BX

mov BX, AX      ; BX = AX
mov AX, C       ; AX = C
mov DX, 2       ; DX = 2
imul DX         ; DX:AX = AX * DX

SUB BX, AX      ; BX = BX - AX
ADD BX, 5       ; BX = BX + 5

mov X, BX       ; X = BX

exitcode 0      ; �������� ��� �����襭��
end