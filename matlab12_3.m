%2�����̒����`�̑ш搧���M��
a = pi/8; b = pi/4;                              %���g���ш�
[n1,n2] = meshgrid(-25:25);                      %��Ԏ��͈̔�
x = (a/pi*sinc(a*n1/pi)).*(b/pi*sinc(b*n2/pi));  %�M���̌v�Z
subplot(2,2,1);
mesh(n1,n2,x);                                   %�M���̐}��
axis([-25 25 -25 25 -0.01 0.035]);
xlabel('n_1'); ylabel('n_2'); zlabel('x(n_1,n_2)');