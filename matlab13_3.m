%2����FIR�t�B���^�ɂ��摜����
x = imread('girl.tif');                    %�摜�̓ǂݍ���
figure(1);   
imshow(x,[0 255]);                         %���͉摜�̐}��
%�������ƎG������
hs = [ 1 1 1; 1 1 1; 1 1 1]/9;             %�������t�B���^
y = filter2(hs,x);                         %������
figure(2);
imshow(y,[0 255]);                         %���������ꂽ�摜�̐}��
% 
mu = 0; sigma2 = 0.0025;                   %���F�K�E�X�G���̕��ςƕ��U
noisy_x = imnoise(x,'gaussian',mu,sigma2); %�摜�ɔ��F�K�E�X�G����������
figure(3);
imshow(noisy_x,[0 255]);                   %�G�����������摜�̐}��
y = filter2(hs,noisy_x);                   %�G���̏���
figure(4);
imshow(y,[0 255]);                         %�G���������ꂽ�摜�̐}��
%
%�N�s��
he = [ 0 -1 0; -1 5 -1; 0 -1 0];           %�N�s���t�B���^
y = filter2(he,x);                         %�N�s��
figure(5);
imshow(y,[0 255]);                         %�N�s�����ꂽ�摜�̐}��
%�֊s���o
hL = [0 1 0; 1 -4 1; 0 1 0];               %���v���V�A���t�B���^
y = filter2(hL,x);                         %�֊s���o
figure(6);
imshow(y,[0 255]);                         %�֊s���o���ꂽ�摜�̐}��