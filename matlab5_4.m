%�f�B�W�^���t�B���^�̒P�ʃX�e�b�v����
nend = 10; n = 0:nend;             %���Ԃ͈̔�
x = ones(1,nend+1);                %�P�ʃX�e�b�v����
%alpha = 0.5�̂Ƃ��̒P�ʃC���p���X����
alpha1 = 0.5; 
h1 = alpha1.^n;                    %�P�ʃC���p���X����
y1 = conv(h1,x);                   %�����݂���
y1 = y1(1:nend+1)                  %�o�͂̐}���͈͂̐���
subplot(2,2,1);
stem(n,y1);                        %�o�͂̐}��
axis([0 nend 0 2.5]); grid;
xlabel('Time n'); ylabel('y(n)'); 
%�ȉ����l��alpha = -0.5�̂Ƃ�
alpha2 = -0.5; 
h2 = alpha2.^n;   
y2 = conv(h2,x);
y2 = y2(1:nend+1)
subplot(2,2,2);
stem(n,y2); 
axis([0 nend 0 2.5]); grid;
xlabel('Time n'); ylabel('y(n)'); 