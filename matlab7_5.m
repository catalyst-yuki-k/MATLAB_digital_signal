%�f�B�W�^���t�B���^�̋ɂƒP�ʃC���p���X����
%���ʂ̏�������
zr = [0; 0];                         %��̗�_�̈ʒu
nend = 50; n=0:nend;                 %�����͈̔�
x = [1 zeros(1,nend)];               %�P�ʃC���p���X�̓���
%�قȂ�����̋ɂ̏ꍇ
pl1 = [0.4; 0.9];                    %�ɂ̈ʒu
[num1,den1] = zp2tf(zr,pl1,1);       %��E�ɂ���2���t�B���^�̕��q�E����W��
h1 = filter(num1,den1,x);            %�t�B���^�����O�ɂ��P�ʃC���p���X����
subplot(3,1,1);
stem(n,h1); grid;                    %�P�ʃC���p���X�����̐}��
xlabel('Time n'); ylabel('h_1(n)');  
%�d���̋ɂ̏ꍇ
pl2 = [0.9 0.9]';                    %�ȉ�����
[num2,den2] = zp2tf(zr,pl2,1);
h2 = filter(num2,den2,x); 
subplot(3,1,2);
stem(n,h2); grid;
xlabel('Time n'); ylabel('h_2(n)');
%���f�����̋ɂ̏ꍇ
pl3 = [0.9*exp(j*pi/6) 0.9*exp(-j*pi/6)]';
[num3,den3] = zp2tf(zr,pl3,1);
h3 = filter(num3,den3,x); 
subplot(3,1,3);
stem(n,h3); grid;
xlabel('Time n'); ylabel('h_3(n)');