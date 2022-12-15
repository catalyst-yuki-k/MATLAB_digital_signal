%2�������U��ԃt�[���G�ϊ�
x = [0 1 0; 1 4 1; 0 1 0]/8;                  %2�����M��
xx = zeros(11,11); xx(6:8,6:8) = x(1:3,1:3);  %�}���̂��߂̃[���Â�
n1 = -5:5; n2 = n1;                           %�M���̋��
subplot(2,2,1);
mesh(n1,n2,xx);                               %�M���̐}��
axis([-5 5 -5 5 0 0.5]); 
xlabel('n_1'); ylabel('n_2'); zlabel('x(n_1,n_2)');
[X,w1,w2] = freqz2(x);                        %2�������U��ԃt�[���G�ϊ�
subplot(2,2,2);
mesh(w1*pi,w2*pi,abs(X));                     %�U���X�y�N�g���̐}��
axis([-pi pi -pi pi 0 1]);
xlabel('\omega_1 [rad]'); ylabel('\omega_2 [rad]'); 
zlabel('|X(e^{j\omega_1},e^{j\omega_2})|');