%2����FIR�t�B���^�̎��g������
h = [1 2 1; 2 4 2; 1 2 1]/16;                 %�P�ʃC���p���X����
hh = zeros(11,11); hh(6:8,6:8) = h(1:3,1:3);  %�}���̂��߂̃[���Â�
n1 = -5:5; n2 = n1;                           %�M���̋��
subplot(2,2,1);
mesh(n1,n2,hh);                               %�M���̐}��
axis([-5 5 -5 5 0 0.3]); 
xlabel('n_1'); ylabel('n_2'); zlabel('h(n_1,n_2)');
[H,w1,w2] = freqz2(h);                        %2�������g������
subplot(2,2,2);
mesh(w1*pi,w2*pi,abs(H));                     %�U�������̐}��
axis([-pi pi -pi pi 0 1]); 
xlabel('\omega_1 [rad]'); ylabel('\omega_2 [rad]'); 
zlabel('|H(e^{j\omega_1},e^{j\omega_2})|');