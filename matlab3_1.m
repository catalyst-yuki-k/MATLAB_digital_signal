%���U�t�[���G�ϊ��̌v�Z��
%�M��
x = [1 1 1 1 0 0 0 0];                  %8�_�̐M��
n = 0:length(x)-1;                      %���Ԃ̃C���f�b�N�X
subplot(2,2,1); 
stem(n,x);                              %�M���̐}��
axis([0 length(n) min(x) max(x)]);
xlabel('Time n'); ylabel('x(n)'); 
%���U���ԃt�[���G�ϊ�
w = -pi:0.01:pi;                        %���g���͈̔�
Xejw = freqz(x,1,w);                    %���U���ԃt�[���G�ϊ��̌v�Z
subplot(2,2,2); 
maxX = max(abs(Xejw));                  %|Xejw|�̍ő�l
plot(w,abs(Xejw));                      %�U���X�y�N�g���̐}��
axis([-pi pi 0 maxX]);
xlabel('Frequency \omega [rad]'); ylabel('|X(e^{j\omega})|');
%���U�t�[���G�ϊ� DFT
k = n                                   %���g���̃C���f�b�N�X
X = mydft(x)                            %DFT�̌v�Z
magX = abs(X)                           %�U���X�y�N�g��
subplot(2,2,3); 
stem(k,magX);                           %�U���X�y�N�g���̐}��
axis([0 length(k) 0 maxX]);
xlabel('Frequency k'); ylabel('|X(k)|'); 
%���U�t�[���G�ϊ��̃V�t�g�}��
kshift = k-floor(length(k)/2);          %�C���f�b�N�X�̃V�t�g
Xshift = fftshift(X);                   %DFT X(k)�̃V�t�g
magXshift = abs(Xshift);                %�V�t�g���ꂽ DFT �̐U���X�y�N�g��
subplot(2,2,4); 
stem(kshift,magXshift);                 %�V�t�g���ꂽ�U���X�y�N�g���̐}��
axis([-length(k)/2 length(k)/2 0 maxX]);
xlabel('Frequency k'); ylabel('|X(k)|');