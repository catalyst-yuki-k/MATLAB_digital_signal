%���������ɂ��y(n) = h(n)*x(n) <--> Y(z) = H(z)X(z)�̊m�F
syms a n x z;            %���p����L���̐錾
h = a^n;                 %�w���֐�h(n)
H = ztrans(h,n,z)        %h��z�ϊ�
x = 1;                   %�P�ʃX�e�b�vx(n)=u0(n)
X = ztrans(x,n,z)        %x�̂��ϊ�
HX = H*X                 %H��X�̐�
y = symsum(h*x,0,n)      %h��x�̂����݂���y
Y = ztrans(y,n,z)        %y�̂��ϊ�
simple(Y) == simple(HX)  %Y=HX���H�iYes�Ȃ��1�CNo�Ȃ��0)