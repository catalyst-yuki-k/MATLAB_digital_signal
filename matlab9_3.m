%���֐��@��FIR�t�B���^�̐݌v��
wp = 0.2*pi; ws = 0.3*pi;                %�ʉ߈�[���g���C�j�~��[���g��
trwidth = ws-wp;                         %�J�ڑш敝
N = ceil(6.6*pi/trwidth)+1               %�n�~���O���̒����i�^�b�v���j
win = hamming(N);                        %�n�~���O��
%���֐��ɂ��FIR�t�B���^�̐݌v�i�P�ʃC���p���X�����j
wc = (wp+ws)/2;                          %�Ւf���g��
h = fir1(N-1,wc/pi,win);                 %�݌v���ꂽ�P�ʃC���p���X����
n = -(N-1)/2:(N-1)/2;                    %�����͈̔�
subplot(2,2,1);
stem(n,h);                               %�P�ʃC���p���X�����̐}��
axis([-(N-1)/2 (N-1)/2 -0.1 0.3]); grid;
xlabel('Time n '); ylabel('h(n)'); 
%�݌v���ꂽFIR�t�B���^�̎��g������ 
dw = 0.001;                              %���g���̍���
w = 0:dw:pi;                             %���g���͈̔�
H = freqz(h,1,w);                        %���g�������̌v�Z 
maxH = max(abs(H));                      %���g�������̍ő�l
dBH = 20*log10(abs(H)/maxH);             %�U�������̐��K��
subplot(2,2,2);
plot(w,dBH);                             %�U�������̐}��
axis([0 pi -80 5]); grid;
xlabel('Frequency \omega [rad]'); ylabel('|H(e^{j\omega})| [dB]');
Rp = -min(dBH(1:ceil(wp/dw)+1))          %�ʉ߈惊�v���̊m�F
As = -max(dBH(ceil(ws/dw)+1:length(w)))  %�j�~�挸���ʂ̊m�F