%���������ɂ���{�I�M���̂��ϊ�
syms a n u0 z w;     %���p�����ϐ��̐錾
% 
u0 = 1;              %�P�ʃX�e�b�v
U0 = ztrans(u0,n,z)  %�P�ʃX�e�b�v�̂��ϊ�
%�ȉ��C���l
e = a^n;             %�w���֐�
E = ztrans(e,n,z)
%
r = n;               %�����v�֐�
R = ztrans(r,n,z)
%
s = sin(w*n);        %�����g
S = ztrans(s,n,z)
%
c = cos(w*n);        %�]���g
C = ztrans(c,n,z)