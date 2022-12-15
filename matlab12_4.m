%2�������U�t�[���G�ϊ��̗�
N1 = 16; N2 = 16;                   %�M���̃T�C�Y
[n1,n2] = meshgrid(0:N1-1,0:N2-1);  %�C���f�b�N�X�͈̔�
a1 = 0.5; a2 = 0.75;                %�M���̃p�����[�^
x = (a1.^n1).*(a2.^n2);             %�M��
X = fft2(x);                        %2�������U�t�[���G�ϊ�
subplot(2,2,1);
mesh(n1,n2,x);                      %�M���̐}��
axis([0 N1-1 0 N2-1 0 1]);
xlabel('n_1'); ylabel('n_2'); zlabel('x(n_1,n_2)');
subplot(2,2,2);
mesh(n1,n2,abs(X));                 %�U���X�y�N�g���̐}��
axis([0 N1-1 0 N2-1 0 8]);
xlabel('k_1'); ylabel('k_2'); zlabel('|X(k_1,k_2)|');