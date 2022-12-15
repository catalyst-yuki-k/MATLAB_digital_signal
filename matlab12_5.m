%�摜GIRL��2�������U�t�[���G�ϊ�
%�摜�f�[�^�̓ǂݍ��݂Ɛ}��
GIRL = imread('girl.tif');         %�摜�f�[�^�̓ǂݍ���
x = double(imresize(GIRL,0.25));   %�摜GIRL��1/4�̃T�C�Y�ɕύX
x = flipud(x);                     %���₷���̂��߂ɉ摜�̏㉺�����ւ�
[N1,N2] = size(x);                 %�摜�̐����E���������̃T�C�Y
n1 = 0:N1-1; n2 = 0:N2-1;          %�摜�̐����E���������̃C���f�b�N�X
colormap([0 0 0]);                 %�����}�����w��
subplot(2,2,1); mesh(n1,n2,x);     %�摜�̗��̓I�}��
view(-20,66);                      %���_�̐ݒ�
axis([0 N1-1 0 N2-1 0 500]); 
xlabel('n_1'); ylabel('n_2'); zlabel('x(n_1,n_2)'); 
%�摜��2����DFT
X = fft2(x,N1,N2);                 %2�������U�t�[���G�ϊ�
absX = abs(X);                     %���g���X�y�N�g���̐�Βl
absX(1,1) = 0;                     %�}���̂��ߒ������������Ă���
subplot(2,2,2); mesh(n1,n2,absX);  %�U���X�y�N�g���̗��̓I�}��
axis([0 N1-1 0 N2-1 0 5*10^4]);
xlabel('k_1'); ylabel('k_2'); zlabel('|X(k_1,k_2)|'); 