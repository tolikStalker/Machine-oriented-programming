model SMALL     ; ������ �����: small
stack 100h      ; ������ ���: 256 ����
dataseg         ; ��।������ ��砫� ���樠����஢������ ᥣ���� ������
A dw 15         ; ��।������ ��६����� A ࠧ��஬ 2 ����
B dw 88         ; ��।������ ��६����� B ࠧ��஬ 2 ����
C dw 32         ; ��।������ ��६����� C ࠧ��஬ 2 ����
X dw ?          ; ��।������ ��६����� X ࠧ��஬ 2 ����
codeseg         ; ��।������ ��砫� ����
startupcode     ; ���ᯥ稢��� ��� ���樠����樨 � �⬥砥� ��砫� �ணࠬ��

mov AX, A       ; AX = A
mov BX, B       ; BX = B

sub AX, BX      ; AX = (A - B)

sar AX, 2       ; AX = (A - B) / 4

mov BX, C       ; BX = C
sal BX, 1       ; BX = C * 2

sub AX, BX      ; AX = (A - B) / 4 - 2C
add AX, 5       ; AX = (A - B) / 4 - 2C + 5

mov X, AX       ; X = AX = (A - B) / 4 - 2C + 5

exitcode 0      ; �������� ��� �����襭��
end